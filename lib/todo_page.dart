import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Map<String, dynamic>> todos = [];
  TextEditingController todoController = TextEditingController();

  final border = OutlineInputBorder(
    borderSide: const BorderSide(
      width: 2.0,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.circular(5),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: todoController,
              decoration: InputDecoration(
                hintText: 'Enter a todo',
                hintStyle: const TextStyle(fontSize: 20),
                focusedBorder: border,
                enabledBorder: border,
              ),
              style: const TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (todoController.text.isNotEmpty) {
                setState(() {
                  todos.add({"text": todoController.text, "isDone": false});
                  todoController.clear();
                });
              }
            },
            child: const Text(
              'Add Todo',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index]["text"],
                      style: TextStyle(
                        decoration: todos[index]["isDone"]
                            ? TextDecoration.lineThrough
                            : null,
                        fontSize: 18,
                      )),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () {
                          setState(() {
                            todos[index]["isDone"] = !todos[index]["isDone"];
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            todos.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
