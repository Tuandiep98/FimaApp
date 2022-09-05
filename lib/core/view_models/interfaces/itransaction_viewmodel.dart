import 'package:flutter/material.dart';

import '../../ui_model/transaction_ui_model.dart';

abstract class ITransactionViewModel implements ChangeNotifier {
  List<TransactionUIModel> transactionForDisplays;
  void initTransactions();
}
