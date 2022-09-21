import 'package:fima/core/hive_database/entities/transaction_entity/transaction_entity.dart';
import 'package:fima/core/services/interfaces/icategory_service.dart';
import 'package:fima/core/services/interfaces/ipayment_method_service.dart';
import 'package:fima/core/services/interfaces/itransaction_service.dart';
import 'package:fima/core/ui_model/category_ui_model.dart';
import 'package:fima/core/ui_model/payment_method_ui_model.dart';
import 'package:fima/core/ui_model/transaction_ui_model.dart';
import 'package:fima/core/utils/enum.dart';
import 'package:fima/core/utils/logger_utils.dart';
import 'package:fima/global/global_data.dart';
import 'package:fima/global/locator.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../interfaces/itransaction_viewmodel.dart';

class TransactionViewModel extends ChangeNotifier
    implements ITransactionViewModel {
  var _categoryService = locator<ICategoryService>();
  var _transactionService = locator<ITransactionService>();
  var _paymentMethodService = locator<IPaymentMethodService>();
  var _globalData = locator<GlobalData>();

  List<TransactionUIModel> _transactionForDisplays = [];
  @override
  List<TransactionUIModel> transactionForDisplays;

  String _transactionModeLabel = 'Expense';
  @override
  String get transactionModeLabel => _transactionModeLabel;

  var _colors = [
    0xffDEEDCF,
    0xffBFE1B0,
    0xff99D492,
    0xff74C67A,
    0xff56B870,
    0xff39A96B,
    0xff1D9A6C,
    0xff188977,
    0xff137177,
    0xff0E4D64,
    0xff0A2F51,
  ];

  @override
  void initTransactions() {
    _transactionForDisplays.clear();
    var transactions = locator<ITransactionService>().getTransactions();
    if (transactions.length > 0) {
      _transactionForDisplays = transactions.map((e) => e.toUIModel()).toList();
    }
    transactionForDisplays = _transactionForDisplays;
    transactionForDisplays.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    notifyListeners();
  }

  @override
  int getColorActivitiesOfTheDay(DateTime dateTime) {
    var transactionByDate = _transactionForDisplays
        .where((x) =>
            x.createdAt.day == dateTime.day &&
            x.createdAt.month == dateTime.month &&
            x.createdAt.year == dateTime.year)
        .toList();

    if (transactionByDate.length > 0) {
      try {
        var length = transactionByDate.length;
        var range = [1, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
        for (var i = 0; i < range.length - 1; i++) {
          if (range[i] < length && length < range[i + 1]) {
            return _colors[i];
          }
        }
        return _colors[0];
      } catch (e) {
        return 0xffffffff;
      }
    } else {
      return 0xffffffff;
    }
  }

  @override
  void setTransactionModeLabel(TransactionType type) {
    locator<GlobalData>().transactionType = type;
    _transactionModeLabel = locator<GlobalData>().getTransactionTypeLabel();
    notifyListeners();
  }

  @override
  List<CategoryUIModel> getCategories() {
    return _categoryService.getCategories().map((e) => e.toUIModel()).toList();
  }

  @override
  Future<void> createTransaction(double amount, String note) async {
    try {
      var _category = _globalData.categorySelected;
      TransactionEntity newTransaction = TransactionEntity(
        id: Uuid().v4(),
        categoryId: _category.id,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        amount: amount.toInt() * 1000,
        type: _globalData.getTransactionType(),
        currencyId: _globalData.currentCurrency.id,
        currencySymbol: _globalData.currentCurrency.symbol,
        note: note,
        bank: '',
      );
      await _transactionService.insert(newTransaction);
      initTransactions();
    } catch (e) {
      await LoggerUtils.logException(e);
    }
  }

  @override
  List<PaymentMethodUIModel> getPaymentMethods() {
    return _paymentMethodService
        .getPaymentMethods()
        .map((e) => e.toUIModel())
        .toList();
  }
}
