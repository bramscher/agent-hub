# 🚀 Agent Hub Setup Guide

Complete setup instructions to get Agent Hub running.

## Prerequisites

- Node.js 18+ installed
- A Supabase account (free tier works great)
- A Vercel account (optional, for deployment)

## Step-by-Step Setup

### 1. Supabase Setup

1. **Create a Supabase Project**
   - Go to [supabase.com](https://supabase.com)
   - Click "New Project"
   - Fill in project details
   - Wait for the database to be provisioned

2. **Run the Database Schema**
   - In your Supabase dashboard, go to SQL Editor
   - Click "New Query"
   - Copy the entire contents of `supabase-schema.sql` from this repo
   - Paste and click "Run"
   - You should see "Success. No rows returned" for most statements

3. **Get Your API Credentials**
   - Go to Settings > API
   - Copy your Project URL
   - Copy your `anon` `public` key

### 2. Local Development

1. **Clone and Install**
   ```bash
   git clone https://github.com/bramscher/agent-hub.git
   cd agent-hub
   npm install
   ```

2. **Configure Environment Variables**
   ```bash
   cp .env.local.example .env.local
   ```
   
   Edit `.env.local`:
   ```env
   NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your_anon_key_here
   ```

3. **Run Development Server**
   ```bash
   npm run dev
   ```
   
   Open [http://localhost:3000](http://localhost:3000)

### 3. Deploy to Vercel

1. **Push to GitHub** (already done! ✅)

2. **Connect to Vercel**
   - Go to [vercel.com](https://vercel.com)
   - Click "Add New Project"
   - Import `bramscher/agent-hub`
   - Vercel will auto-detect Next.js

3. **Add Environment Variables**
   - In the Vercel project settings
   - Add `NEXT_PUBLIC_SUPABASE_URL`
   - Add `NEXT_PUBLIC_SUPABASE_ANON_KEY`

4. **Deploy**
   - Click "Deploy"
   - Wait ~2 minutes
   - Your dashboard is live! 🎉

## Adding Your First Data

### Via Supabase Table Editor

1. **Create a Project**
   - Go to Supabase > Table Editor > projects
   - Click "Insert row"
   - Fill in:
     - `name`: "Agent Hub"
     - `description`: "AI task management system"
     - `status`: "active"
     - `priority`: "high"
     - `github_url`: "https://github.com/bramscher/agent-hub"
   - Click "Save"

2. **Create a Task**
   - Go to tasks table
   - Click "Insert row"
   - Fill in:
     - `title`: "Set up Supabase database"
     - `status`: "completed"
     - `priority`: "high"
     - `assigned_to`: "brammolt"
   - Click "Save"

3. **Refresh Your Dashboard**
   - The data should appear immediately!

## API Integration (Future)

Coming soon: REST API endpoints for programmatic access from AI agents.

Planned features:
- Create/update projects via API
- Automated task logging
- Webhook support for external integrations
- GitHub Actions integration

## Troubleshooting

### "Cannot read properties of undefined"
- Check that environment variables are set correctly
- Verify Supabase credentials
- Make sure the database schema is applied

### "Failed to fetch"
- Check your Supabase project URL
- Verify API key is the `anon` key, not service role key
- Check Row Level Security policies are enabled

### Dark mode not working
- The theme auto-detects system preference
- Works in all modern browsers
- If stuck, clear browser cache

## Need Help?

- Check the [Supabase docs](https://supabase.com/docs)
- Check the [Next.js docs](https://nextjs.org/docs)
- Open an issue on GitHub

---

Built by 🎭 Brammolt - Your AI Task Commander
