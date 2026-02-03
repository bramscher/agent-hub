# 🎭 Agent Hub

**AI Agent Task & Project Management System**

A Next.js + Supabase powered dashboard for tracking tasks, projects, and documentation for AI agents. Built with Apple glassmorphism design aesthetic.

## Features

### ✨ Full CRUD Operations
- ➕ **Create** - Add new projects and tasks with intuitive forms
- ✏️ **Edit** - Update any project or task with a click
- 🗑️ **Delete** - Remove projects/tasks with confirmation
- 🔄 **Quick Updates** - Change task status from dropdown (no edit needed!)

### 📊 Core Features
- **Project Management** - Track all AI agent projects with status, priority, and links
- **Task Tracking** - Manage tasks across projects with assignments and due dates
- **Documentation** - Keep notes, decisions, and technical docs organized
- **Activity Log** - Complete audit trail of all changes
- **Beautiful UI** - Apple-inspired glassmorphism design with dark mode
- **Real-time** - Powered by Supabase for instant updates
- **Toast Notifications** - Clear feedback for every action

### 🎯 See [FEATURES.md](./FEATURES.md) for complete feature list

## Tech Stack

- **Framework**: Next.js 15 (App Router, TypeScript)
- **Database**: Supabase (PostgreSQL)
- **UI**: Tailwind CSS + shadcn/ui
- **Design**: Glassmorphism / Liquid Glass aesthetic
- **Deployment**: Vercel

## Getting Started

### 1. Clone the repository

```bash
git clone <your-repo-url>
cd agent-hub
npm install
```

### 2. Set up Supabase

1. Create a new project at [supabase.com](https://supabase.com)
2. Go to SQL Editor and run the schema from `supabase-schema.sql`
3. Get your project URL and anon key from Settings > API

### 3. Configure environment variables

```bash
cp .env.local.example .env.local
```

Edit `.env.local` and add your Supabase credentials:

```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
```

### 4. Run the development server

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) to see the dashboard.

## Database Schema

### Projects
- Track project name, description, status, priority
- Link to GitHub repos and Vercel deployments
- Status: active, paused, completed, archived
- Priority: low, medium, high, urgent

### Tasks
- Linked to projects
- Status: todo, in_progress, blocked, completed, cancelled
- Assignable to agents or team members
- Due dates and completion tracking

### Documentation
- Linked to projects and tasks
- Types: note, decision, technical, completion, issue
- Full markdown support

### Activity Log
- Complete audit trail
- Tracks all changes and updates
- Links to projects and tasks

## Deployment

### Deploy to Vercel

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone)

1. Push your code to GitHub
2. Connect your repo to Vercel
3. Add environment variables in Vercel dashboard
4. Deploy!

## Usage

### Adding Data via Supabase Dashboard

1. Go to your Supabase project > Table Editor
2. Add projects, tasks, and documentation manually
3. The dashboard will automatically update

### API Integration (Coming Soon)

Future versions will include REST API endpoints for:
- Creating/updating projects and tasks from AI agents
- Automated activity logging
- Webhook integrations

## Inspiration

Inspired by vibe coding management systems but designed specifically for AI agent task tracking and coordination.

## License

MIT

---

Built with 🎭 by Brammolt
