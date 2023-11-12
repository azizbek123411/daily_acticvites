import 'package:flutter/material.dart';

class ToDoListTile extends StatelessWidget {
  const ToDoListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final String taskName='';
    final bool done;
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.purple.shade400,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: ListTile(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check_box_outline_blank,),
          ),
          title: const Text(
            'Do your homework',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
