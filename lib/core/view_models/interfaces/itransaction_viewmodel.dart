import 'package:fima/core/ui_model/category_ui_model.dart';
import 'package:fima/core/utils/enum.dart';
import 'package:flutter/material.dart';

import '../../ui_model/transaction_ui_model.dart';

abstract class ITransactionViewModel implements ChangeNotifier {
  List<TransactionUIModel> transactionForDisplays;
  String get transactionModeLabel;
  void setTransactionModeLabel(TransactionType type);
  void initTransactions();
  int getColorActivitiesOfTheDay(DateTime dateTime);
  List<CategoryUIModel> getCategories();
  Future<void> createTransaction(double amount, String note);
}
