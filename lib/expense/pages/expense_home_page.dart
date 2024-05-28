import 'package:daily_acticvites/expense/data/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/expense_item.dart';

class Expense extends StatefulWidget {
  static const String id = 'expense';

  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController summController = TextEditingController();

  //add new expense
  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          "Add new expensse",
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// expense name
            TextField(
              decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.white38,
                  ),
                  hintText: "Name"),
              style: const TextStyle(
                color: Colors.white,
              ),
              controller: nameController,
            ),

            ///expense summ
            TextField(
              decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.white38,
                  ),
                  hintText: "Price"),
              style: const TextStyle(
                color: Colors.white,
              ),
              controller: summController,
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white60, fontSize: 19),
            ),
          ),
          MaterialButton(
            onPressed: () {
              save();
              Navigator.pop(context);
            },
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white, fontSize: 19),
            ),
          ),
        ],
      ),
    );
  }

  void save() {
    ExpenseItem newExpense = ExpenseItem(
      name: nameController.text,
      amount: summController.text,
      dateTime: DateTime.now(),
    );
    Provider.of<ExpenseData>(context, listen: false).addExpense(newExpense);
    nameController.clear();
    summController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final newExpenseNameController = TextEditingController();
    final newExpenseAmountController = TextEditingController();

    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.pink.shade800,
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
          backgroundColor: Colors.pinkAccent.shade200,
          title: const Text(
            'Expenses',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addNewExpense,
          backgroundColor: Colors.pinkAccent.shade200,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: ListView.builder(
          itemCount: value.getAllExpense().length,
          itemBuilder: (context, index) => ListTile(
            subtitle: Text(
              value.getAllExpense()[index].dateTime.toString(),
              style: TextStyle(color: Colors.white54),
            ),
            trailing: Text(
              value.getAllExpense()[index].amount + " sum",
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            title: Text(
              value.getAllExpense()[index].name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
