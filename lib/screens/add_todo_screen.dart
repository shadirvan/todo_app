import 'package:flutter/material.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var todoTextController = TextEditingController();
    String inputText = '';
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: TextField(
              controller: todoTextController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'What Todo?'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                inputText = todoTextController.text;
                todoTextController.clear();
                Navigator.of(context).pop(inputText);
              },
              child: Text('Save'))
        ],
      ),
    );
  }
}
