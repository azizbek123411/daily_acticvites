import 'package:daily_acticvites/todo/widgets/to_do_buttons.dart';
import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   NewTask({super.key,
  required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple,
      content: SizedBox(
        height: 150,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.purple.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child:  Center(
                child: TextField(
                  controller: controller,
                  style:const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    hintText: 'Enter new task',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ToDoButton(title: 'Cancel', onPressed: onCancel),
                ToDoButton(title: 'Add', onPressed: onSave),
              ],
            )
          ],
        ),
      ),
    );
  }
}
