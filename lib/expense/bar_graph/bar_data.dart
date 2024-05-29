import 'package:daily_acticvites/expense/bar_graph/individual.dart';

class BarData{
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wenAmount;
  final double thuAMount;
  final double friAmount;
  final double satAmount;
  BarData({
   required this.sunAmount,
   required this.monAmount,
   required this.tueAmount,
   required this.wenAmount,
   required this.thuAMount,
   required this.friAmount,
   required this.satAmount
});

  List<Individual>barData=[];

  /// initialize bar data

void initializeData(){
  barData=[
    /// sun
    Individual(x: 0, y: sunAmount),
    /// mon
    Individual(x: 0, y: monAmount),
    /// tue
    Individual(x: 0, y: tueAmount),
    /// wen
    Individual(x: 0, y: wenAmount),
    /// thu
    Individual(x: 0, y: thuAMount),
    /// fri
    Individual(x: 0, y: friAmount),
    /// sat
    Individual(x: 0, y: satAmount),
  ];

}

}