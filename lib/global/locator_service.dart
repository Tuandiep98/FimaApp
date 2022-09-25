import 'package:fima/core/services/implements/account_service.dart';
import 'package:fima/core/services/implements/category_service.dart';
import 'package:fima/core/services/implements/currency_service.dart';
import 'package:fima/core/services/implements/payment_method_service.dart';
import 'package:fima/core/services/implements/transaction_service.dart';
import 'package:fima/core/services/interfaces/icategory_service.dart';
import 'package:fima/core/services/interfaces/icurrency_service.dart';
import 'package:fima/core/services/interfaces/ipayment_method_service.dart';
import 'package:fima/core/services/interfaces/itransaction_service.dart';
import 'package:fima/core/services/interfaces/iaccount_service.dart';
import 'package:get_it/get_it.dart';

void registerServiceSingletons(GetIt locator) {
  locator
      .registerLazySingleton<ITransactionService>(() => TransactionService());
  locator.registerLazySingleton<ICurrencyService>(() => CurrencyService());
  locator.registerLazySingleton<ICategoryService>(() => CategoryService());
  locator.registerLazySingleton<IPaymentMethodService>(
      () => PaymentMethodService());
  locator.registerLazySingleton<IAccountService>(() => AccountService());
}
