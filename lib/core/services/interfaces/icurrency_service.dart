import 'package:fima/core/hive_database/entities/currency_entity/currency_entity.dart';

abstract class ICurrencyService {
  List<CurrencyEntity> getCurrencies();
  Future<void> insertAll(List<CurrencyEntity> currencies);
}
