import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List',
      home: const TaskHelperPage(),
    );
  }
}

class TaskHelperPage extends StatefulWidget {
  const TaskHelperPage({super.key});

  @override
  State<TaskHelperPage> createState() => _TaskHelperPageState();
}

class _TaskHelperPageState extends State<TaskHelperPage> {
  final TextEditingController _taskController = TextEditingController();
  @override
  void dispose() {
  _taskController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List"),
        centerTitle: true,
      ),
     body: Padding(
  padding: const EdgeInsets.all(20),
  child: Column(
    children: [
      TextField(
        controller: _taskController,
        decoration: const InputDecoration(
          labelText: 'Enter Task',
          border: OutlineInputBorder(),
        ),
      ),
    ],
  ),
),
    );
  }
}