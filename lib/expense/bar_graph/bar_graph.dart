import 'package:daily_acticvites/expense/bar_graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraph extends StatelessWidget {
  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wenAmount;
  final double thuAMount;
  final double friAmount;
  final double satAmount;

  const BarGraph(
      {super.key,
      required this.satAmount,
      required this.friAmount,
      required this.thuAMount,
      required this.wenAmount,
      required this.tueAmount,
      required this.monAmount,
      required this.sunAmount,
      required this.maxY});

  @override
  Widget build(BuildContext context) {
    /// initialize bardate
    BarData myBarData = BarData(
      sunAmount: sunAmount,
      monAmount: monAmount,
      tueAmount: tueAmount,
      wenAmount: wenAmount,
      thuAMount: thuAMount,
      friAmount: friAmount,
      satAmount: satAmount,
    );
    myBarData.initializeData();

    return BarChart(
      BarChartData(
        maxY: maxY,
        minY: 0,
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
