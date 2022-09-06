import 'package:fima/core/utils/list_extension.dart';
import 'package:uuid/uuid.dart';

import '../core/hive_database/entities/currency_entity/currency_entity.dart';
import '../core/hive_database/entities/transaction_entity/transaction_entity.dart';
import '../core/services/interfaces/icurrency_service.dart';
import '../core/services/interfaces/itransaction_service.dart';
import 'locator.dart';

class MockData {
  static Future<void> initMockData() async {
    List<CurrencyEntity> currencies = [
      CurrencyEntity(
        id: Uuid().v4(),
        image: '',
        imageBase64: '',
        acceptCredit: false,
        baseCurrency: true,
        availableOnline: true,
        displayOnDevice: true,
        code: 'VND',
        name: 'VietNam dong',
        symbol: 'đ',
        top: 0,
      ),
    ];
    var currencyService = locator<ICurrencyService>();
    var currenciesInDb =
        currencyService.getCurrencies().firstOrDefault((x) => x.code == 'VND');
    if (currenciesInDb == null)
      await locator<ICurrencyService>().insertAll(currencies);
    List<TransactionEntity> transactionEntities = [
      TransactionEntity(
        id: 'ID01',
        categoryId: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        amount: 100000,
        type: 0,
        currencyId: currencyService.getCurrencies().first.id,
        currencySymbol: currencyService.getCurrencies().first.symbol,
        note: 'note',
        bank: '',
      ),
      TransactionEntity(
        id: 'ID02',
        categoryId: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        amount: 120000,
        type: 1,
        currencyId: currencyService.getCurrencies().first.id,
        currencySymbol: currencyService.getCurrencies().first.symbol,
        note: 'note2',
        bank: '',
      ),
      TransactionEntity(
        id: 'ID03',
        categoryId: '',
        createdAt: DateTime.now().add(Duration(days: 1)),
        updatedAt: DateTime.now().add(Duration(days: 1)),
        amount: 100000,
        type: 0,
        currencyId: currencyService.getCurrencies().first.id,
        currencySymbol: currencyService.getCurrencies().first.symbol,
        note: 'note',
        bank: '',
      ),
      TransactionEntity(
        id: 'ID04',
        categoryId: '',
        createdAt: DateTime.now().add(Duration(days: 1)),
        updatedAt: DateTime.now().add(Duration(days: 1)),
        amount: 120000,
        type: 1,
        currencyId: currencyService.getCurrencies().first.id,
        currencySymbol: currencyService.getCurrencies().first.symbol,
        note: 'note2',
        bank: '',
      ),
      TransactionEntity(
        id: 'ID05',
        categoryId: '',
        createdAt: DateTime.now().add(Duration(days: 1)),
        updatedAt: DateTime.now().add(Duration(days: 1)),
        amount: 100000,
        type: 0,
        currencyId: currencyService.getCurrencies().first.id,
        currencySymbol: currencyService.getCurrencies().first.symbol,
        note: 'note',
        bank: '',
      ),
      TransactionEntity(
        id: 'ID06',
        categoryId: '',
        createdAt: DateTime.now().add(Duration(days: 1)),
        updatedAt: DateTime.now().add(Duration(days: 1)),
        amount: 120000,
        type: 1,
        currencyId: currencyService.getCurrencies().first.id,
        currencySymbol: currencyService.getCurrencies().first.symbol,
        note: 'note2',
        bank: '',
      ),
      TransactionEntity(
        id: 'ID07',
        categoryId: '',
        createdAt: DateTime.now().add(Duration(days: 1)),
        updatedAt: DateTime.now().add(Duration(days: 1)),
        amount: 100000,
        type: 0,
        currencyId: currencyService.getCurrencies().first.id,
        currencySymbol: currencyService.getCurrencies().first.symbol,
        note: 'note',
        bank: '',
      ),
      TransactionEntity(
        id: 'ID08',
        categoryId: '',
        createdAt: DateTime.now().add(Duration(days: 1)),
        updatedAt: DateTime.now().add(Duration(days: 1)),
        amount: 120000,
        type: 1,
        currencyId: currencyService.getCurrencies().first.id,
        currencySymbol: currencyService.getCurrencies().first.symbol,
        note: 'note2',
        bank: '',
      ),
      TransactionEntity(
        id: 'ID09',
        categoryId: '',
        createdAt: DateTime.now().add(Duration(days: 1)),
        updatedAt: DateTime.now().add(Duration(days: 1)),
        amount: 100000,
        type: 0,
        currencyId: currencyService.getCurrencies().first.id,
        currencySymbol: currencyService.getCurrencies().first.symbol,
        note: 'note',
        bank: '',
      ),
      TransactionEntity(
        id: 'ID10',
        categoryId: '',
        createdAt: DateTime.now().add(Duration(days: 1)),
        updatedAt: DateTime.now().add(Duration(days: 1)),
        amount: 120000,
        type: 1,
        currencyId: currencyService.getCurrencies().first.id,
        currencySymbol: currencyService.getCurrencies().first.symbol,
        note: 'note2',
        bank: '',
      ),
      TransactionEntity(
        id: 'ID11',
        categoryId: '',
        createdAt: DateTime.now().add(Duration(days: 1)),
        updatedAt: DateTime.now().add(Duration(days: 1)),
        amount: 120000,
        type: 1,
        currencyId: currencyService.getCurrencies().first.id,
        currencySymbol: currencyService.getCurrencies().first.symbol,
        note: 'note2',
        bank: '',
      ),
      TransactionEntity(
        id: 'ID12',
        categoryId: '',
        createdAt: DateTime.now().add(Duration(days: 1)),
        updatedAt: DateTime.now().add(Duration(days: 1)),
        amount: 120000,
        type: 1,
        currencyId: currencyService.getCurrencies().first.id,
        currencySymbol: currencyService.getCurrencies().first.symbol,
        note: 'note2',
        bank: '',
      ),
      TransactionEntity(
        id: 'ID13',
        categoryId: '',
        createdAt: DateTime.now().add(Duration(days: 1)),
        updatedAt: DateTime.now().add(Duration(days: 1)),
        amount: 120000,
        type: 1,
        currencyId: currencyService.getCurrencies().first.id,
        currencySymbol: currencyService.getCurrencies().first.symbol,
        note: 'note2',
        bank: '',
      ),
    ];
    var transactionService = locator<ITransactionService>();
    await transactionService.clearAll();
    var transactionInDb = transactionService.getTransactions();
    if (transactionInDb.length == 0) {
      for (var transactionEntity in transactionEntities) {
        await transactionService.insert(transactionEntity);
      }
    }
  }
}
