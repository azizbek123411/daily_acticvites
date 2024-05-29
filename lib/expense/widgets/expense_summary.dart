import 'package:daily_acticvites/expense/bar_graph/bar_graph.dart';
import 'package:daily_acticvites/expense/data/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;

  const ExpenseSummary({
    super.key,
    required this.startOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: BarGraph(
          satAmount: 88,
          friAmount: 56,
          thuAMount: 12,
          wenAmount: 78,
          tueAmount: 53,
          monAmount: 35,
          sunAmount: 50,
          maxY: 100,
        ),
      ),
    );
  }
}
