-- Agent Hub Database Schema
-- Task and Project Management for AI Agents

-- Enable UUID extension
create extension if not exists "uuid-ossp";

-- Projects table
create table if not exists projects (
  id uuid default uuid_generate_v4() primary key,
  name text not null,
  description text,
  status text not null check (status in ('active', 'paused', 'completed', 'archived')),
  priority text not null check (priority in ('low', 'medium', 'high', 'urgent')),
  github_url text,
  vercel_url text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Tasks table
create table if not exists tasks (
  id uuid default uuid_generate_v4() primary key,
  project_id uuid references projects(id) on delete cascade,
  title text not null,
  description text,
  status text not null check (status in ('todo', 'in_progress', 'blocked', 'completed', 'cancelled')),
  priority text not null check (priority in ('low', 'medium', 'high', 'urgent')),
  assigned_to text, -- agent name or 'brammolt'
  due_date timestamp with time zone,
  completed_at timestamp with time zone,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Documentation/Notes table
create table if not exists documentation (
  id uuid default uuid_generate_v4() primary key,
  project_id uuid references projects(id) on delete cascade,
  task_id uuid references tasks(id) on delete cascade,
  title text not null,
  content text not null,
  doc_type text not null check (doc_type in ('note', 'decision', 'technical', 'completion', 'issue')),
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Activity log table
create table if not exists activity_log (
  id uuid default uuid_generate_v4() primary key,
  project_id uuid references projects(id) on delete cascade,
  task_id uuid references tasks(id) on delete cascade,
  action text not null,
  details jsonb,
  created_by text not null, -- agent name or user
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Create indexes for better query performance
create index if not exists idx_tasks_project_id on tasks(project_id);
create index if not exists idx_tasks_status on tasks(status);
create index if not exists idx_documentation_project_id on documentation(project_id);
create index if not exists idx_documentation_task_id on documentation(task_id);
create index if not exists idx_activity_log_project_id on activity_log(project_id);
create index if not exists idx_activity_log_task_id on activity_log(task_id);
create index if not exists idx_activity_log_created_at on activity_log(created_at desc);

-- Create updated_at trigger function
create or replace function update_updated_at_column()
returns trigger as $$
begin
  new.updated_at = timezone('utc'::text, now());
  return new;
end;
$$ language plpgsql;

-- Create triggers
create trigger update_projects_updated_at before update on projects
  for each row execute function update_updated_at_column();

create trigger update_tasks_updated_at before update on tasks
  for each row execute function update_updated_at_column();

create trigger update_documentation_updated_at before update on documentation
  for each row execute function update_updated_at_column();

-- Enable Row Level Security (RLS)
alter table projects enable row level security;
alter table tasks enable row level security;
alter table documentation enable row level security;
alter table activity_log enable row level security;

-- Create policies (allow all for now - customize based on auth needs)
create policy "Enable all access for projects" on projects for all using (true);
create policy "Enable all access for tasks" on tasks for all using (true);
create policy "Enable all access for documentation" on documentation for all using (true);
create policy "Enable all access for activity_log" on activity_log for all using (true);
