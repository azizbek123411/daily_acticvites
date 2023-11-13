import 'package:daily_acticvites/todo/services/database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/new_task.dart';
import '../widgets/todo_utils.dart';

class ToDoList extends StatefulWidget {
  static const String id = 'todolist';

  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      db.crateInitialDatabase();
    } else {
      db.loadDatabase();
    }
    // TODO: implement initState
    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
    });
    Navigator.pop(context);
    _controller.clear();
    db.updateDatabase();
  }

  void newTask() {
    showDialog(
        context: context,
        builder: (context) {
          return NewTask(
            controller: _controller,
            onCancel: () {
              Navigator.pop(context);
            },
            onSave: saveNewTask,
          );
        });
  }

  void delete(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  void clearAll() {
    setState(() {
      db.toDoList.clear();
    });
    db.updateDatabase();
  }

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
        actions: [
          TextButton(
            onPressed: clearAll,
            child: const Text(
              'Clear All',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ],
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
        padding: const EdgeInsets.all(20),
        child: db.toDoList.isEmpty
            ? const Center(
                child: Image(
                  image: AssetImage('assets/images/zzz.png'),
                ),
              )
            : ListView.builder(
                itemCount: db.toDoList.length,
                itemBuilder: (context, index) {
                  return ToDoListTile(
                    taskName: db.toDoList[index][0],
                    done: db.toDoList[index][1],
                    onChanged: (value) {
                      checkBoxTapped(value, index);
                    },
                    deleteFunction: (BuildContext) => delete(index),
                  );
                }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple.shade300,
        onPressed: newTask,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
