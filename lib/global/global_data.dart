import 'package:fima/core/hive_database/entities/currency_entity/currency_entity.dart';

class GlobalData {
  GlobalData();

  CurrencyEntity baseCurrency;
  CurrencyEntity currentCurrency;
  String currencySymbol;
  String logLevel = 'Error';
  bool isSynchronizing = false;
}
