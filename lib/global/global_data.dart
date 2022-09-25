import 'package:fima/core/hive_database/entities/account_entity/account_entity.dart';
import 'package:fima/core/hive_database/entities/currency_entity/currency_entity.dart';
import 'package:fima/core/ui_model/category_ui_model.dart';
import 'package:fima/core/ui_model/payment_method_ui_model.dart';
import 'package:fima/core/utils/enum.dart';

class GlobalData {
  GlobalData();

  CurrencyEntity baseCurrency;
  CurrencyEntity currentCurrency;
  String currencySymbol;
  String logLevel = 'Error';
  bool isSynchronizing = false;
  CategoryUIModel categorySelected;
  TransactionType transactionType;
  PaymentMethodUIModel paymentMethodSelected;
  Account2Entity currentUser;

  String getTransactionTypeLabel() {
    switch (transactionType) {
      case TransactionType.Expense:
        return 'Expense';
        break;
      case TransactionType.Income:
        return 'Income';
      case TransactionType.Others:
        return 'Others';
      default:
        return 'Others';
    }
  }

  int getTransactionType() {
    switch (transactionType) {
      case TransactionType.Expense:
        return 0;
        break;
      case TransactionType.Income:
        return 1;
      case TransactionType.Others:
        return 2;
      default:
        return 2;
    }
  }
}
