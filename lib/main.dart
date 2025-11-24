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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Welcome to Task Helper!"),
      ),
    );
  }
}