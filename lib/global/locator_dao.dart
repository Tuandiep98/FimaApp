import 'package:fima/core/hive_database/daos/category_dao.dart';
import 'package:fima/core/hive_database/daos/currency_dao.dart';
import 'package:fima/core/hive_database/daos/transaction_dao.dart';
import 'package:get_it/get_it.dart';

void registerDaoSingletons(GetIt locator) {
  locator.registerLazySingleton(() => TransactionDao());
  locator.registerLazySingleton(() => CurrencyDao());
  locator.registerLazySingleton(() => CategoryDao());
}
