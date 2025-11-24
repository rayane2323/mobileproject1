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
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 152, 112, 159), // soft purple
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 152, 112, 159),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(
              255,
              152,
              112,
              159,
            ), // soft purple
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
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
  final List<String> _categories = ['Work', 'School', 'Personal', 'sport'];
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
      appBar: AppBar(
        title: const Text(
          "To-Do List",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(
          255,
          144,
          114,
          149,
        ), // soft purple
        elevation: 5,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                if (_tasks.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("No Tasks"),
                        content: const Text("There are no tasks to clear!"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  setState(() {
                    _tasks.clear();
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade300,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text("Clear All Tasks"),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: _tasks.isEmpty
                  ? const Center(child: Text("No tasks yet"))
                  : ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: const Color(0xFFE1BEE7), // light purple card
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            title: Text(
                              _tasks[index],
                              style: const TextStyle(fontSize: 16),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  _tasks.removeAt(index);
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
