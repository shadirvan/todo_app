import 'package:flutter/material.dart';
import './models/todo.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var todoList = [
    Todo(id: DateTime.now().toString(), title: "Test Task 1", status: false),
    Todo(id: DateTime.now().toString(), title: "Test Task 2", status: false),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Checkbox(
                    value: todoList[index].status,
                    onChanged: (value) {
                      setState(() {
                        todoList[index].status = value as bool;
                      });
                    },
                  ),
                  title: Text(
                    todoList[index].title,
                    style: TextStyle(
                        color:
                            todoList[index].status ? Colors.grey : Colors.black,
                        decoration: todoList[index].status
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  trailing:
                      IconButton(onPressed: null, icon: Icon(Icons.delete)),
                );
              })),
    );
  }
}
