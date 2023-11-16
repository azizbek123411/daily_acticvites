import 'package:flutter/material.dart';

class ToDoButton extends StatelessWidget {
  final String title;
  VoidCallback onPressed;

  ToDoButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ));
  }
}
