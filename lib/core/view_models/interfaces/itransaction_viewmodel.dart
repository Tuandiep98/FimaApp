import 'package:fima/core/utils/enum.dart';

import '../../ui_model/transaction_ui_model.dart';
import 'ibase_viewmodel.dart';

abstract class ITransactionViewModel extends IBaseViewModel {
  List<TransactionUIModel> transactionForDisplays;
  String get transactionModeLabel;
  int get expenseToday;
  int get incomeToday;
  void setTransactionModeLabel(TransactionType type);
  void initTransactions();
  int getColorActivitiesOfTheDay(DateTime dateTime);
  Future<void> createTransaction(double amount, String note);
}
