import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'screens/landing_screen.dart';
import './screens/add_todo_screen.dart';
import './data/dummy_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LandingScreen());
  }
}
