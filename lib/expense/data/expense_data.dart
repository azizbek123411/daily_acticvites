import 'package:daily_acticvites/expense/models/expense_item.dart';

class ExpenseData{
  // list of all expenses
  List<Expense> allExpense=[];
  // get expense list
List<Expense> getAllExpense(){
  return allExpense;
}
  // add new expense
void addExpense(Expense newExpense){
  allExpense.add(newExpense);
}
  // delete expense
void deleteExpense(Expense expense){
  allExpense.remove(expense);
}
String? getDayName(DateTime dateTime){
  switch(dateTime.weekday){
    case 1:
      return "Dushanba";
    case 2:
      return "Seshanbe";
    case 3:
      return "Chorshanba";
    case 4:
      return "Payshanbe";
    case 5:
      return "Juma";
    case 6:
      return "Shanba";
    case 7:
      return "Yakshanba";
      default:'';
  }
}
DateTime startOfWeek(){
  DateTime? startOfWeek;
  DateTime today = DateTime.now();
  for(int i=0;i<7;i++){
    if(getDayName(today.subtract(Duration(days: i)))=='Yakshanba'){
      startOfWeek=today.subtract(Duration(days: i));
    }
  }
  return startOfWeek!;
}

}