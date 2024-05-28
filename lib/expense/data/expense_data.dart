import 'package:daily_acticvites/expense/data/data_time_helper.dart';
import 'package:daily_acticvites/expense/models/expense_item.dart';
import 'package:flutter/foundation.dart';

class ExpenseData extends ChangeNotifier{
  /// list of all expense

  List <ExpenseItem> allExpense = [];


  /// get expense list

List<ExpenseItem> getAllExpense (){
  return allExpense;
}

  /// add new expense

void addExpense (ExpenseItem newExpense){
  allExpense.add(newExpense);
  notifyListeners();
}

  /// delete expense

void deleteExpense(ExpenseItem deleteExpense){
allExpense.remove(deleteExpense);

notifyListeners();

}

  /// get weekday

String getWeekdayName(DateTime dateTime){
  switch(dateTime.weekday){
    case 1:
      return "Yak";
    case 2:
      return "Du";
    case 3:
      return "Se";
    case 4:
      return "Chor";
    case 5:
      return "Pay";
    case 6:
      return "Ju";
    case 7:
      return "Shan";
      default:
        return "";

  }
}

  /// get start of the weekday
DateTime getStartWeekName(){
  DateTime? startOfWeek;
  DateTime today=DateTime.now();
  for(int i=0;i<7;i++){
    if(getWeekdayName(today.subtract(Duration(days: i)))=="Yak"){
      startOfWeek=today.subtract(Duration(days: i));
    }
  }
  return startOfWeek!;
}
Map calculateDailySumm(){
  Map<String,double> dailySumm={
    //ddmmyyyyy,sum

  };
  for(var expense in allExpense){
    String date=convertDateTimeToString(expense.dateTime);
    double amount=double.parse(expense.amount);

    if(dailySumm.containsKey(date)){
      double currentAmount=dailySumm[date]!;
      currentAmount+=amount;
      dailySumm[date]=currentAmount;
    }else{
      dailySumm.addAll({date:amount});
    }
  }
  return dailySumm;
}
}