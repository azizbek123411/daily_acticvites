import 'package:flutter/material.dart';

class ExpenseListTile extends StatelessWidget {
  final String name;
  final String sum;
  final DateTime date;

  const ExpenseListTile(
      {super.key, required this.name, required this.date, required this.sum});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(
        "${date.day}/${date.month}/${date.year}",
        style: const TextStyle(
          color: Colors.white54,
        ),
      ),
      trailing: Text(
        sum + " sum",
        style: const TextStyle(
          color: Colors.white54,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
