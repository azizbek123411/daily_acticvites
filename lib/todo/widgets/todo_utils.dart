import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoListTile extends StatelessWidget {
  final String taskName;
  final bool done;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoListTile(
      {super.key,
      required this.taskName,
      required this.done,
      required this.onChanged,
      required this.deleteFunction
      });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane:
          ActionPane(motion: const StretchMotion(),
           children: [
             SlidableAction(
               borderRadius:const BorderRadius.only(
                 topLeft: Radius.circular(20),
                 bottomLeft: Radius.circular(20),
               ),
               onPressed: deleteFunction,
             icon: Icons.delete,
               backgroundColor: Colors.red,
             )
           ]),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15,top: 15),
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.purple.shade400,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: ListTile(
            leading: Checkbox(
              value: done,
              onChanged: onChanged,
            ),
            title: Text(
              taskName,
              style: TextStyle(
                color: done ? Colors.red : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                decoration:
                    done ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
