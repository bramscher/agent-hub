import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

export const supabase = createClient(supabaseUrl, supabaseAnonKey);

// Types for our database schema
export type Project = {
  id: string;
  name: string;
  description: string | null;
  status: 'active' | 'paused' | 'completed' | 'archived';
  priority: 'low' | 'medium' | 'high' | 'urgent';
  github_url: string | null;
  vercel_url: string | null;
  created_at: string;
  updated_at: string;
};

export type Task = {
  id: string;
  project_id: string | null;
  title: string;
  description: string | null;
  status: 'todo' | 'in_progress' | 'blocked' | 'completed' | 'cancelled';
  priority: 'low' | 'medium' | 'high' | 'urgent';
  assigned_to: string | null;
  due_date: string | null;
  completed_at: string | null;
  created_at: string;
  updated_at: string;
};

export type Documentation = {
  id: string;
  project_id: string | null;
  task_id: string | null;
  title: string;
  content: string;
  doc_type: 'note' | 'decision' | 'technical' | 'completion' | 'issue';
  created_at: string;
  updated_at: string;
};

export type ActivityLog = {
  id: string;
  project_id: string | null;
  task_id: string | null;
  action: string;
  details: Record<string, any> | null;
  created_by: string;
  created_at: string;
};
