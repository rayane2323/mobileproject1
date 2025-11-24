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
  final List<String> _categories = ['Work', 'School', 'Personal'];
  String _selectedCategory = 'Work';
  List<String> _tasks = [];

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To-Do List"), centerTitle: true),
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
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedCategory,
              onChanged: (String? value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
              items: _categories
                  .map<DropdownMenuItem<String>>(
                    (cat) =>
                        DropdownMenuItem<String>(value: cat, child: Text(cat)),
                  )
                  .toList(),
            ),
            const SizedBox(height: 10), // add space before button

            ElevatedButton(
              onPressed: () {
                if (_taskController.text.isNotEmpty) {
                  setState(() {
                    _tasks.add("${_taskController.text} [$_selectedCategory]");
                    _taskController.clear();
                  });
                }
              },
              child: const Text("Add Task"),
            ),
          ],
        ),
      ),
    );
  }
}
