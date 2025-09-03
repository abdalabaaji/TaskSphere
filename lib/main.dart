import 'package:flutter/material.dart';

void main() {
  runApp(const TaskSphereApp());
}

class TaskSphereApp extends StatelessWidget {
  const TaskSphereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskSphere',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TaskSphereHomePage(title: 'TaskSphere - Task Management'),
    );
  }
}

class TaskSphereHomePage extends StatefulWidget {
  const TaskSphereHomePage({super.key, required this.title});

  final String title;

  @override
  State<TaskSphereHomePage> createState() => _TaskSphereHomePageState();
}

class _TaskSphereHomePageState extends State<TaskSphereHomePage> {
  int _taskCount = 0;

  void _addTask() {
    setState(() {
      _taskCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.task_alt,
              size: 80,
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to TaskSphere!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your productivity companion for task management',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Tasks Created:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '$_taskCount',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _addTask,
              icon: const Icon(Icons.add),
              label: const Text('Add Task'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}