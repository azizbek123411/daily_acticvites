import 'package:daily_acticvites/widgets/todo_utils.dart';
import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  static const String id = 'todolist';

  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple.shade400,
        centerTitle: true,
        title: const Text(
          'To Do List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ToDoListTile(),
      ),
    );
  }
}
