import 'package:fima/core/services/interfaces/itransaction_service.dart';
import 'package:fima/core/ui_model/transaction_ui_model.dart';
import 'package:fima/global/locator.dart';
import 'package:flutter/material.dart';

import '../interfaces/itransaction_viewmodel.dart';

class TransactionViewModel extends ChangeNotifier
    implements ITransactionViewModel {
  List<TransactionUIModel> _transactionForDisplays = [];
  @override
  List<TransactionUIModel> transactionForDisplays;

  @override
  void initTransactions() {
    _transactionForDisplays.clear();
    var transactions = locator<ITransactionService>().getTransactions();
    if (transactions.length > 0) {
      _transactionForDisplays = transactions.map((e) => e.toUIModel()).toList();
    }
    transactionForDisplays = _transactionForDisplays;
    notifyListeners();
  }
}
