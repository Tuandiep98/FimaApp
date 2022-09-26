import 'package:fima/core/hive_database/entities/transaction_entity/transaction_entity.dart';
import 'package:fima/core/services/interfaces/itransaction_service.dart';
import 'package:fima/core/ui_model/transaction_ui_model.dart';
import 'package:fima/core/utils/enum.dart';
import 'package:fima/core/utils/logger_utils.dart';
import 'package:fima/global/global_data.dart';
import 'package:fima/global/locator.dart';
import 'package:uuid/uuid.dart';

import '../interfaces/itransaction_viewmodel.dart';
import 'base_viewmodel.dart';

class TransactionViewModel extends BaseViewModel
    implements ITransactionViewModel {
  var _transactionService = locator<ITransactionService>();
  var _globalData = locator<GlobalData>();

  List<TransactionUIModel> _transactionForDisplays = [];
  @override
  List<TransactionUIModel> transactionForDisplays;

  String _transactionModeLabel = 'Expense';
  @override
  String get transactionModeLabel => _transactionModeLabel;

  int _expenseToday = 0;
  @override
  int get expenseToday => _expenseToday;

  int _incomeToday = 0;
  @override
  int get incomeToday => _incomeToday;

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
    changeState(DataState.FetchingData);
    var transactions = _transactionService
        .getTransactionsByCreatorId(_globalData.currentUser?.id);
    if (transactions.length > 0) {
      _transactionForDisplays = transactions.map((e) => e.toUIModel()).toList();
    }
    transactionForDisplays = _transactionForDisplays
        .where((x) =>
            x.createdAt.day == DateTime.now().day &&
            x.createdAt.month == DateTime.now().month &&
            x.createdAt.year == DateTime.now().year)
        .toList();
    transactionForDisplays.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    if (transactionForDisplays.length > 0) {
      var expenses = transactionForDisplays.where((x) => x.type == 1).toList();
      if (expenses.length > 0) {
        for (var item in expenses) {
          _expenseToday += item.amount;
        }
      }
      var incomes = transactionForDisplays.where((x) => x.type == 0).toList();
      if (incomes.length > 0) {
        for (var item in incomes) {
          _incomeToday += item.amount;
        }
      }
      changeState(DataState.DataFetchedSuccessfully);
    } else {
      changeState(DataState.NoDataToDisplay);
    }
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
  Future<void> createTransaction(double amount, String note) async {
    try {
      var _category = _globalData.categorySelected;
      var _currency = _globalData.currentCurrency;
      TransactionEntity newTransaction = TransactionEntity(
        id: Uuid().v4(),
        categoryId: _category.id,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        amount: amount.toInt() * 1000,
        type: _globalData.getTransactionType(),
        currencyId: _currency.id,
        currencySymbol: _currency.symbol,
        note: note,
        bank: '',
        creatorId: _globalData.currentUser?.id,
      );
      await _transactionService.insert(newTransaction);
      initTransactions();
    } catch (e) {
      await LoggerUtils.logException(e);
    }
  }
}
