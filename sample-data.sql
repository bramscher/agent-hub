-- Sample Data for Agent Hub
-- Based on Craig's actual projects
-- Run this in Supabase SQL Editor after running complete_setup.sql

-- Insert Projects
INSERT INTO projects (id, name, description, status, priority, github_url, vercel_url) VALUES
(
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  'Agent Hub',
  'AI Agent Task & Project Management System - Next.js + Supabase dashboard for tracking tasks, projects, and documentation across all AI agent work',
  'active',
  'high',
  'https://github.com/bramscher/agent-hub',
  NULL
),
(
  'b2c3d4e5-f6a7-8901-bcde-f12345678901',
  'Konmashi Platform',
  'Omnichannel AI agent content pipeline for property management - Max (maintenance), Sally (receptionist), Leesa (leasing). HDPM proof-of-concept, commercialize to thousands of Appfolio customers',
  'active',
  'urgent',
  NULL,
  NULL
),
(
  'c3d4e5f6-a7b8-9012-cdef-123456789012',
  'HDPM Inc',
  'Property management business - acquired 2025. Operations and proof-of-concept for Konmashi AI agent team',
  'active',
  'high',
  NULL,
  NULL
),
(
  'd4e5f6a7-b8c9-0123-def1-234567890123',
  'Wellifi',
  'SaaS health/wellness platform - founded 2021',
  'active',
  'medium',
  NULL,
  NULL
),
(
  'e5f6a7b8-c9d0-1234-ef12-345678901234',
  'BramPlan Inc',
  'Consulting and holding company - founded 2019. Strategic acquisitions and growth initiatives',
  'active',
  'medium',
  NULL,
  NULL
);

-- Insert Tasks
INSERT INTO tasks (id, project_id, title, description, status, priority, assigned_to, due_date) VALUES
-- Agent Hub tasks
(
  '10000000-0000-0000-0000-000000000001',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  'Set up Supabase database',
  'Run schema SQL, configure environment variables, test database connection',
  'completed',
  'high',
  'brammolt',
  NULL
),
(
  '10000000-0000-0000-0000-000000000002',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  'Deploy to Vercel',
  'Connect GitHub repo to Vercel, configure environment variables, deploy production',
  'in_progress',
  'high',
  'brammolt',
  '2026-02-04T00:00:00Z'
),
(
  '10000000-0000-0000-0000-000000000003',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  'Add REST API endpoints',
  'Create API routes for programmatic task/project creation from AI agents',
  'todo',
  'medium',
  'brammolt',
  NULL
),
(
  '10000000-0000-0000-0000-000000000004',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  'Implement MCP server integration',
  'Add Model Context Protocol server similar to Archon for AI assistant integration',
  'todo',
  'low',
  NULL,
  NULL
),

-- Konmashi Platform tasks
(
  '20000000-0000-0000-0000-000000000001',
  'b2c3d4e5-f6a7-8901-bcde-f12345678901',
  'Design Max (Maintenance AI) persona',
  'Define voice, personality, knowledge base, and conversation flows for maintenance agent',
  'completed',
  'urgent',
  'brammolt',
  NULL
),
(
  '20000000-0000-0000-0000-000000000002',
  'b2c3d4e5-f6a7-8901-bcde-f12345678901',
  'Design Sally (Receptionist AI) persona',
  'Define voice, personality, knowledge base, and conversation flows for receptionist agent',
  'completed',
  'urgent',
  'brammolt',
  NULL
),
(
  '20000000-0000-0000-0000-000000000003',
  'b2c3d4e5-f6a7-8901-bcde-f12345678901',
  'Design Leesa (Leasing AI) persona',
  'Define voice, personality, knowledge base, and conversation flows for leasing agent',
  'in_progress',
  'urgent',
  'brammolt',
  '2026-02-05T00:00:00Z'
),
(
  '20000000-0000-0000-0000-000000000004',
  'b2c3d4e5-f6a7-8901-bcde-f12345678901',
  'Build Appolio data integration',
  'Connect to Appfolio API, sync property data, tenant info, maintenance requests',
  'in_progress',
  'high',
  'brammolt',
  '2026-02-10T00:00:00Z'
),
(
  '20000000-0000-0000-0000-000000000005',
  'b2c3d4e5-f6a7-8901-bcde-f12345678901',
  'Create avatar video pipeline',
  'AI agents → avatar videos → multi-platform distribution (YouTube, TikTok, Instagram, LinkedIn)',
  'todo',
  'high',
  NULL,
  '2026-02-15T00:00:00Z'
),
(
  '20000000-0000-0000-0000-000000000006',
  'b2c3d4e5-f6a7-8901-bcde-f12345678901',
  'HDPM proof-of-concept metrics',
  'Track lead conversion, ROI, engagement metrics to validate business model',
  'todo',
  'urgent',
  'brammolt',
  '2026-02-20T00:00:00Z'
),
(
  '20000000-0000-0000-0000-000000000007',
  'b2c3d4e5-f6a7-8901-bcde-f12345678901',
  'Konmashi commercialization roadmap',
  'Plan white-label offering, pricing tiers, go-to-market strategy for Appfolio/Haven AI customers',
  'todo',
  'medium',
  NULL,
  NULL
),

-- HDPM tasks
(
  '30000000-0000-0000-0000-000000000001',
  'c3d4e5f6-a7b8-9012-cdef-123456789012',
  'Implement AI agent team (Max, Sally, Leesa)',
  'Deploy Konmashi agents as brand differentiators for HDPM property management',
  'in_progress',
  'high',
  'brammolt',
  '2026-02-15T00:00:00Z'
),
(
  '30000000-0000-0000-0000-000000000002',
  'c3d4e5f6-a7b8-9012-cdef-123456789012',
  'Optimize HDPM operations',
  'Streamline processes, improve margins, integrate AI automation',
  'in_progress',
  'medium',
  NULL,
  NULL
),

-- Wellifi tasks
(
  '40000000-0000-0000-0000-000000000001',
  'd4e5f6a7-b8c9-0123-def1-234567890123',
  'Feature roadmap planning',
  'Plan next quarter feature releases and prioritization',
  'todo',
  'medium',
  NULL,
  NULL
),

-- BramPlan tasks
(
  '50000000-0000-0000-0000-000000000001',
  'e5f6a7b8-c9d0-1234-ef12-345678901234',
  'Identify acquisition targets',
  'Research potential companies for roll-up strategy in property management and related verticals',
  'in_progress',
  'high',
  'brammolt',
  NULL
),
(
  '50000000-0000-0000-0000-000000000002',
  'e5f6a7b8-c9d0-1234-ef12-345678901234',
  'Build management team playbook',
  'Document processes for scaling acquired companies and building effective teams',
  'todo',
  'medium',
  NULL,
  NULL
);

-- Insert Documentation
INSERT INTO documentation (id, project_id, task_id, title, content, doc_type) VALUES
(
  '60000000-0000-0000-0000-000000000001',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '10000000-0000-0000-0000-000000000001',
  'Supabase Setup Complete',
  '# Database Configuration

Supabase project created and configured successfully.

**Key Details:**
- Project URL: Set in environment variables
- Database schema: Deployed from `supabase-schema.sql`
- Tables created: projects, tasks, documentation, activity_log
- RLS policies: Enabled (currently allow-all for development)

**Next Steps:**
- Deploy to Vercel
- Add authentication if needed
- Create API endpoints for agent automation',
  'completion'
),
(
  '60000000-0000-0000-0000-000000000002',
  'b2c3d4e5-f6a7-8901-bcde-f12345678901',
  NULL,
  'Konmashi Omnichannel Strategy',
  '# Konmashi Platform Architecture

**The Play:**
HDPM is the proof-of-concept. Konmashi is the product.

## AI Agent Team
1. **Max** - Maintenance coordinator
2. **Sally** - Receptionist / customer service
3. **Leesa** - Leasing specialist

## Content Pipeline
Appolio data → AI agents → avatar videos → multi-platform distribution

**Platforms:**
- YouTube (long-form property tours, maintenance tips)
- TikTok (short-form, viral content)
- Instagram (visual storytelling)
- LinkedIn (professional property management content)

## Business Model
- Prove with HDPM operations
- White-label to thousands of Appfolio/Haven AI customers
- SaaS pricing: tiered by features and agent access

**Target Market:**
Property management companies stuck using vanilla Appfolio tools with no differentiation.',
  'technical'
),
(
  '60000000-0000-0000-0000-000000000003',
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  NULL,
  'Agent Hub Tech Stack Decision',
  '# Tech Stack Rationale

**Framework:** Next.js 15 (App Router, TypeScript)
- Latest stable release
- Server components for performance
- Built-in API routes for future expansion

**Database:** Supabase (PostgreSQL + pgvector)
- Real-time subscriptions
- Row-level security
- Vector embeddings ready for future RAG features

**UI:** Tailwind CSS + shadcn/ui
- Apple glassmorphism aesthetic
- Accessible, professional components
- Dark mode built-in

**Deployment:** Vercel
- Optimal Next.js hosting
- Global CDN
- Automatic preview deployments

**Design Philosophy:**
Simpler than Archon, focused specifically on task/project tracking rather than full knowledge base + MCP server complexity.',
  'decision'
),
(
  '60000000-0000-0000-0000-000000000004',
  'b2c3d4e5-f6a7-8901-bcde-f12345678901',
  '20000000-0000-0000-0000-000000000001',
  'Max - Maintenance AI Persona',
  '# Max - Maintenance Coordinator AI

**Voice & Personality:**
- Professional but friendly
- Problem-solver mindset
- Technical expertise in property maintenance
- Proactive communicator

**Knowledge Base:**
- HVAC systems
- Plumbing basics
- Electrical safety
- Property maintenance schedules
- Vendor coordination

**Key Capabilities:**
- Schedule maintenance requests
- Coordinate with vendors
- Send status updates to tenants
- Create maintenance reports
- Preventive maintenance recommendations',
  'note'
);

-- Insert Activity Log entries
INSERT INTO activity_log (project_id, task_id, action, details, created_by) VALUES
(
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  NULL,
  'Project Created',
  '{"message": "Agent Hub project initialized", "github_url": "https://github.com/bramscher/agent-hub"}',
  'brammolt'
),
(
  'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  '10000000-0000-0000-0000-000000000001',
  'Task Completed',
  '{"task": "Set up Supabase database", "status": "completed"}',
  'brammolt'
),
(
  'b2c3d4e5-f6a7-8901-bcde-f12345678901',
  NULL,
  'Project Created',
  '{"message": "Konmashi Platform project created", "strategy": "HDPM proof-of-concept, then commercialize"}',
  'brammolt'
),
(
  'b2c3d4e5-f6a7-8901-bcde-f12345678901',
  '20000000-0000-0000-0000-000000000001',
  'Task Completed',
  '{"task": "Design Max (Maintenance AI) persona", "status": "completed"}',
  'brammolt'
),
(
  'b2c3d4e5-f6a7-8901-bcde-f12345678901',
  '20000000-0000-0000-0000-000000000002',
  'Task Completed',
  '{"task": "Design Sally (Receptionist AI) persona", "status": "completed"}',
  'brammolt'
);

-- Success message
SELECT 
  'Sample data loaded successfully!' as message,
  (SELECT COUNT(*) FROM projects) as projects_count,
  (SELECT COUNT(*) FROM tasks) as tasks_count,
  (SELECT COUNT(*) FROM documentation) as docs_count,
  (SELECT COUNT(*) FROM activity_log) as activity_count;
