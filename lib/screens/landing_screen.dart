import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import '../data/dummy_data.dart';
import './add_todo_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: buildListViewItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddTodoScreen()))
              .then((value) {
            setState(() {
              todoList.add(
                Todo(
                    id: DateTime.now().toString(), title: value, status: false),
              );
            });
          });
        },
      ),
    );
  }

  ListView buildListViewItems() {
    return ListView.builder(
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
                  color: todoList[index].status ? Colors.grey : Colors.black,
                  decoration: todoList[index].status
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            trailing:
                const IconButton(onPressed: null, icon: Icon(Icons.delete)),
          );
        });
  }
}
