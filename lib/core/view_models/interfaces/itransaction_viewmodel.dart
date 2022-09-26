import 'package:fima/core/utils/enum.dart';

import '../../ui_model/transaction_ui_model.dart';
import 'ibase_viewmodel.dart';

abstract class ITransactionViewModel extends IBaseViewModel {
  List<TransactionUIModel> get transactionForDisplays;
  List<TransactionUIModel> get transactionByDateForDisplays;
  String get transactionModeLabel;
  int get expenseToday;
  int get incomeToday;
  int get expenseForDate;
  int get incomeForDate;
  void setTransactionModeLabel(TransactionType type);
  void initTransactions();
  void initTransactionsByDate(DateTime date);
  int getColorActivitiesOfTheDay(DateTime dateTime);
  Future<void> createTransaction(double amount, String note);
}
