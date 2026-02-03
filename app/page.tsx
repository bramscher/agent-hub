'use client';

import { useEffect, useState } from 'react';
import { supabase, type Project, type Task } from '@/lib/supabase';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';

export default function Home() {
  const [projects, setProjects] = useState<Project[]>([]);
  const [tasks, setTasks] = useState<Task[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchData();
  }, []);

  async function fetchData() {
    try {
      const [projectsRes, tasksRes] = await Promise.all([
        supabase.from('projects').select('*').order('updated_at', { ascending: false }),
        supabase.from('tasks').select('*').order('created_at', { ascending: false }).limit(20)
      ]);

      if (projectsRes.data) setProjects(projectsRes.data);
      if (tasksRes.data) setTasks(tasksRes.data);
    } catch (error) {
      console.error('Error fetching data:', error);
    } finally {
      setLoading(false);
    }
  }

  const getStatusColor = (status: string) => {
    const colors = {
      active: 'bg-green-500/20 text-green-700 dark:text-green-300',
      paused: 'bg-yellow-500/20 text-yellow-700 dark:text-yellow-300',
      completed: 'bg-blue-500/20 text-blue-700 dark:text-blue-300',
      archived: 'bg-gray-500/20 text-gray-700 dark:text-gray-300',
      todo: 'bg-gray-500/20 text-gray-700 dark:text-gray-300',
      in_progress: 'bg-blue-500/20 text-blue-700 dark:text-blue-300',
      blocked: 'bg-red-500/20 text-red-700 dark:text-red-300',
      cancelled: 'bg-gray-500/20 text-gray-700 dark:text-gray-300',
    };
    return colors[status as keyof typeof colors] || colors.active;
  };

  const getPriorityColor = (priority: string) => {
    const colors = {
      low: 'bg-gray-500/20 text-gray-700 dark:text-gray-300',
      medium: 'bg-yellow-500/20 text-yellow-700 dark:text-yellow-300',
      high: 'bg-orange-500/20 text-orange-700 dark:text-orange-300',
      urgent: 'bg-red-500/20 text-red-700 dark:text-red-300',
    };
    return colors[priority as keyof typeof colors] || colors.medium;
  };

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-lg">Loading...</div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 via-white to-slate-100 dark:from-slate-950 dark:via-slate-900 dark:to-slate-950">
      {/* Glassmorphic header */}
      <header className="sticky top-0 z-50 backdrop-blur-xl bg-white/60 dark:bg-slate-950/60 border-b border-slate-200/50 dark:border-slate-800/50">
        <div className="container mx-auto px-6 py-6">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-bold bg-gradient-to-r from-slate-900 to-slate-700 dark:from-white dark:to-slate-300 bg-clip-text text-transparent">
                🎭 Agent Hub
              </h1>
              <p className="text-sm text-slate-600 dark:text-slate-400 mt-1">
                AI Agent Task & Project Management
              </p>
            </div>
            <div className="flex items-center gap-4">
              <div className="text-right">
                <div className="text-sm font-medium text-slate-700 dark:text-slate-300">
                  {projects.filter(p => p.status === 'active').length} Active Projects
                </div>
                <div className="text-xs text-slate-500 dark:text-slate-500">
                  {tasks.filter(t => t.status === 'in_progress').length} Tasks In Progress
                </div>
              </div>
            </div>
          </div>
        </div>
      </header>

      <main className="container mx-auto px-6 py-8">
        <Tabs defaultValue="overview" className="space-y-6">
          <TabsList className="backdrop-blur-xl bg-white/60 dark:bg-slate-900/60 border border-slate-200/50 dark:border-slate-800/50">
            <TabsTrigger value="overview">Overview</TabsTrigger>
            <TabsTrigger value="projects">Projects</TabsTrigger>
            <TabsTrigger value="tasks">Tasks</TabsTrigger>
          </TabsList>

          <TabsContent value="overview" className="space-y-6">
            {/* Stats Cards */}
            <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
              <Card className="backdrop-blur-xl bg-white/60 dark:bg-slate-900/60 border-slate-200/50 dark:border-slate-800/50">
                <CardHeader className="pb-3">
                  <CardDescription>Total Projects</CardDescription>
                  <CardTitle className="text-3xl">{projects.length}</CardTitle>
                </CardHeader>
              </Card>
              <Card className="backdrop-blur-xl bg-white/60 dark:bg-slate-900/60 border-slate-200/50 dark:border-slate-800/50">
                <CardHeader className="pb-3">
                  <CardDescription>Active Projects</CardDescription>
                  <CardTitle className="text-3xl text-green-600 dark:text-green-400">
                    {projects.filter(p => p.status === 'active').length}
                  </CardTitle>
                </CardHeader>
              </Card>
              <Card className="backdrop-blur-xl bg-white/60 dark:bg-slate-900/60 border-slate-200/50 dark:border-slate-800/50">
                <CardHeader className="pb-3">
                  <CardDescription>Total Tasks</CardDescription>
                  <CardTitle className="text-3xl">{tasks.length}</CardTitle>
                </CardHeader>
              </Card>
              <Card className="backdrop-blur-xl bg-white/60 dark:bg-slate-900/60 border-slate-200/50 dark:border-slate-800/50">
                <CardHeader className="pb-3">
                  <CardDescription>In Progress</CardDescription>
                  <CardTitle className="text-3xl text-blue-600 dark:text-blue-400">
                    {tasks.filter(t => t.status === 'in_progress').length}
                  </CardTitle>
                </CardHeader>
              </Card>
            </div>

            {/* Recent Projects */}
            <Card className="backdrop-blur-xl bg-white/60 dark:bg-slate-900/60 border-slate-200/50 dark:border-slate-800/50">
              <CardHeader>
                <CardTitle>Active Projects</CardTitle>
                <CardDescription>Currently active projects</CardDescription>
              </CardHeader>
              <CardContent>
                <div className="space-y-3">
                  {projects.filter(p => p.status === 'active').map(project => (
                    <div
                      key={project.id}
                      className="p-4 rounded-lg backdrop-blur-xl bg-white/40 dark:bg-slate-800/40 border border-slate-200/50 dark:border-slate-700/50 hover:bg-white/60 dark:hover:bg-slate-800/60 transition-all"
                    >
                      <div className="flex items-start justify-between">
                        <div className="flex-1">
                          <h3 className="font-semibold text-slate-900 dark:text-white">
                            {project.name}
                          </h3>
                          {project.description && (
                            <p className="text-sm text-slate-600 dark:text-slate-400 mt-1">
                              {project.description}
                            </p>
                          )}
                          <div className="flex items-center gap-2 mt-3">
                            <Badge className={getStatusColor(project.status)}>
                              {project.status}
                            </Badge>
                            <Badge className={getPriorityColor(project.priority)}>
                              {project.priority}
                            </Badge>
                            {project.github_url && (
                              <a
                                href={project.github_url}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="text-xs text-blue-600 dark:text-blue-400 hover:underline"
                              >
                                GitHub
                              </a>
                            )}
                            {project.vercel_url && (
                              <a
                                href={project.vercel_url}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="text-xs text-blue-600 dark:text-blue-400 hover:underline"
                              >
                                Live
                              </a>
                            )}
                          </div>
                        </div>
                      </div>
                    </div>
                  ))}
                  {projects.filter(p => p.status === 'active').length === 0 && (
                    <p className="text-center text-slate-500 py-8">No active projects</p>
                  )}
                </div>
              </CardContent>
            </Card>

            {/* Recent Tasks */}
            <Card className="backdrop-blur-xl bg-white/60 dark:bg-slate-900/60 border-slate-200/50 dark:border-slate-800/50">
              <CardHeader>
                <CardTitle>Recent Tasks</CardTitle>
                <CardDescription>Latest tasks across all projects</CardDescription>
              </CardHeader>
              <CardContent>
                <div className="space-y-2">
                  {tasks.slice(0, 10).map(task => (
                    <div
                      key={task.id}
                      className="p-3 rounded-lg backdrop-blur-xl bg-white/40 dark:bg-slate-800/40 border border-slate-200/50 dark:border-slate-700/50"
                    >
                      <div className="flex items-start justify-between">
                        <div className="flex-1">
                          <p className="font-medium text-slate-900 dark:text-white text-sm">
                            {task.title}
                          </p>
                          {task.description && (
                            <p className="text-xs text-slate-600 dark:text-slate-400 mt-1">
                              {task.description}
                            </p>
                          )}
                        </div>
                        <div className="flex items-center gap-2 ml-4">
                          <Badge className={getStatusColor(task.status)} variant="outline">
                            {task.status.replace('_', ' ')}
                          </Badge>
                          <Badge className={getPriorityColor(task.priority)} variant="outline">
                            {task.priority}
                          </Badge>
                        </div>
                      </div>
                    </div>
                  ))}
                  {tasks.length === 0 && (
                    <p className="text-center text-slate-500 py-8">No tasks yet</p>
                  )}
                </div>
              </CardContent>
            </Card>
          </TabsContent>

          <TabsContent value="projects">
            <Card className="backdrop-blur-xl bg-white/60 dark:bg-slate-900/60 border-slate-200/50 dark:border-slate-800/50">
              <CardHeader>
                <CardTitle>All Projects</CardTitle>
                <CardDescription>Complete list of all projects</CardDescription>
              </CardHeader>
              <CardContent>
                <div className="space-y-3">
                  {projects.map(project => (
                    <div
                      key={project.id}
                      className="p-4 rounded-lg backdrop-blur-xl bg-white/40 dark:bg-slate-800/40 border border-slate-200/50 dark:border-slate-700/50"
                    >
                      <h3 className="font-semibold text-slate-900 dark:text-white">
                        {project.name}
                      </h3>
                      {project.description && (
                        <p className="text-sm text-slate-600 dark:text-slate-400 mt-1">
                          {project.description}
                        </p>
                      )}
                      <div className="flex items-center gap-2 mt-3">
                        <Badge className={getStatusColor(project.status)}>
                          {project.status}
                        </Badge>
                        <Badge className={getPriorityColor(project.priority)}>
                          {project.priority}
                        </Badge>
                      </div>
                    </div>
                  ))}
                  {projects.length === 0 && (
                    <p className="text-center text-slate-500 py-8">No projects yet</p>
                  )}
                </div>
              </CardContent>
            </Card>
          </TabsContent>

          <TabsContent value="tasks">
            <Card className="backdrop-blur-xl bg-white/60 dark:bg-slate-900/60 border-slate-200/50 dark:border-slate-800/50">
              <CardHeader>
                <CardTitle>All Tasks</CardTitle>
                <CardDescription>Complete list of all tasks</CardDescription>
              </CardHeader>
              <CardContent>
                <div className="space-y-2">
                  {tasks.map(task => (
                    <div
                      key={task.id}
                      className="p-4 rounded-lg backdrop-blur-xl bg-white/40 dark:bg-slate-800/40 border border-slate-200/50 dark:border-slate-700/50"
                    >
                      <div className="flex items-start justify-between">
                        <div className="flex-1">
                          <p className="font-medium text-slate-900 dark:text-white">
                            {task.title}
                          </p>
                          {task.description && (
                            <p className="text-sm text-slate-600 dark:text-slate-400 mt-1">
                              {task.description}
                            </p>
                          )}
                          {task.assigned_to && (
                            <p className="text-xs text-slate-500 dark:text-slate-500 mt-2">
                              Assigned to: {task.assigned_to}
                            </p>
                          )}
                        </div>
                        <div className="flex flex-col items-end gap-2 ml-4">
                          <Badge className={getStatusColor(task.status)}>
                            {task.status.replace('_', ' ')}
                          </Badge>
                          <Badge className={getPriorityColor(task.priority)}>
                            {task.priority}
                          </Badge>
                        </div>
                      </div>
                    </div>
                  ))}
                  {tasks.length === 0 && (
                    <p className="text-center text-slate-500 py-8">No tasks yet</p>
                  )}
                </div>
              </CardContent>
            </Card>
          </TabsContent>
        </Tabs>
      </main>
    </div>
  );
}
