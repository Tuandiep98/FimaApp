import 'package:fima/core/hive_database/entities/category_entity/category_entity.dart';
import 'package:fima/core/hive_database/entities/payment_method_entity/payment_method_entity.dart';
import 'package:fima/core/services/interfaces/icategory_service.dart';
import 'package:fima/core/services/interfaces/ipayment_method_service.dart';
import 'package:fima/core/services/interfaces/itransaction_service.dart';
import 'package:fima/global/global_data.dart';
import 'package:uuid/uuid.dart';
import '../core/hive_database/entities/currency_entity/currency_entity.dart';
import '../core/services/interfaces/icurrency_service.dart';
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
    if (currencyService.getCurrencies().length <= 0) {
      locator<GlobalData>().currentCurrency = currencies.first;
      await locator<ICurrencyService>().insertAll(currencies);
    } else {
      locator<GlobalData>().currentCurrency =
          currencyService.getCurrencies().first;
    }

    var categories = [
      CategoryEntity(
        id: Uuid().v4(),
        name: 'Food & Drinks',
        image: '',
        imageBase64: '',
      ),
      CategoryEntity(
        id: Uuid().v4(),
        name: 'Shopping',
        image: '',
        imageBase64: '',
      ),
      CategoryEntity(
        id: Uuid().v4(),
        name: 'Healthcare',
        image: '',
        imageBase64: '',
      ),
      CategoryEntity(
        id: Uuid().v4(),
        name: 'Travel',
        image: '',
        imageBase64: '',
      ),
      CategoryEntity(
        id: Uuid().v4(),
        name: 'Others',
        image: '',
        imageBase64: '',
      ),
    ];

    var categoryService = locator<ICategoryService>();
    if (categoryService.getCategories().length <= 0) {
      locator<GlobalData>().categorySelected = categories.first.toUIModel();
      await categoryService.insertAll(categories);
    } else {
      locator<GlobalData>().categorySelected =
          categoryService.getCategories().first.toUIModel();
    }

    // List<TransactionEntity> transactionEntities = [
    //   TransactionEntity(
    //     id: 'ID01',
    //     categoryId: categories[0].id,
    //     createdAt: DateTime.now(),
    //     updatedAt: DateTime.now(),
    //     amount: 100000,
    //     type: 0,
    //     currencyId: currencyService.getCurrencies().first.id,
    //     currencySymbol: currencyService.getCurrencies().first.symbol,
    //     note: 'note',
    //     bank: '',
    //   ),
    //   TransactionEntity(
    //     id: 'ID02',
    //     categoryId: categories[0].id,
    //     createdAt: DateTime.now(),
    //     updatedAt: DateTime.now(),
    //     amount: 120000,
    //     type: 1,
    //     currencyId: currencyService.getCurrencies().first.id,
    //     currencySymbol: currencyService.getCurrencies().first.symbol,
    //     note: 'note2',
    //     bank: '',
    //   ),
    //   TransactionEntity(
    //     id: 'ID03',
    //     categoryId: categories[1].id,
    //     createdAt: DateTime.now().add(Duration(days: 1)),
    //     updatedAt: DateTime.now().add(Duration(days: 1)),
    //     amount: 100000,
    //     type: 0,
    //     currencyId: currencyService.getCurrencies().first.id,
    //     currencySymbol: currencyService.getCurrencies().first.symbol,
    //     note: 'note',
    //     bank: '',
    //   ),
    //   TransactionEntity(
    //     id: 'ID04',
    //     categoryId: categories[1].id,
    //     createdAt: DateTime.now().add(Duration(days: 1)),
    //     updatedAt: DateTime.now().add(Duration(days: 1)),
    //     amount: 120000,
    //     type: 1,
    //     currencyId: currencyService.getCurrencies().first.id,
    //     currencySymbol: currencyService.getCurrencies().first.symbol,
    //     note: 'note2',
    //     bank: '',
    //   ),
    //   TransactionEntity(
    //     id: 'ID05',
    //     categoryId: categories[1].id,
    //     createdAt: DateTime.now().add(Duration(days: 1)),
    //     updatedAt: DateTime.now().add(Duration(days: 1)),
    //     amount: 100000,
    //     type: 0,
    //     currencyId: currencyService.getCurrencies().first.id,
    //     currencySymbol: currencyService.getCurrencies().first.symbol,
    //     note: 'note',
    //     bank: '',
    //   ),
    //   TransactionEntity(
    //     id: 'ID06',
    //     categoryId: categories[2].id,
    //     createdAt: DateTime.now().add(Duration(days: 1)),
    //     updatedAt: DateTime.now().add(Duration(days: 1)),
    //     amount: 120000,
    //     type: 1,
    //     currencyId: currencyService.getCurrencies().first.id,
    //     currencySymbol: currencyService.getCurrencies().first.symbol,
    //     note: 'note2',
    //     bank: '',
    //   ),
    //   TransactionEntity(
    //     id: 'ID07',
    //     categoryId: categories[2].id,
    //     createdAt: DateTime.now().add(Duration(days: 1)),
    //     updatedAt: DateTime.now().add(Duration(days: 1)),
    //     amount: 100000,
    //     type: 0,
    //     currencyId: currencyService.getCurrencies().first.id,
    //     currencySymbol: currencyService.getCurrencies().first.symbol,
    //     note: 'note',
    //     bank: '',
    //   ),
    //   TransactionEntity(
    //     id: 'ID08',
    //     categoryId: categories[2].id,
    //     createdAt: DateTime.now().add(Duration(days: 1)),
    //     updatedAt: DateTime.now().add(Duration(days: 1)),
    //     amount: 120000,
    //     type: 1,
    //     currencyId: currencyService.getCurrencies().first.id,
    //     currencySymbol: currencyService.getCurrencies().first.symbol,
    //     note: 'note2',
    //     bank: '',
    //   ),
    //   TransactionEntity(
    //     id: 'ID09',
    //     categoryId: categories[2].id,
    //     createdAt: DateTime.now().add(Duration(days: 1)),
    //     updatedAt: DateTime.now().add(Duration(days: 1)),
    //     amount: 100000,
    //     type: 0,
    //     currencyId: currencyService.getCurrencies().first.id,
    //     currencySymbol: currencyService.getCurrencies().first.symbol,
    //     note: 'note',
    //     bank: '',
    //   ),
    //   TransactionEntity(
    //     id: 'ID10',
    //     categoryId: categories[2].id,
    //     createdAt: DateTime.now().add(Duration(days: 1)),
    //     updatedAt: DateTime.now().add(Duration(days: 1)),
    //     amount: 120000,
    //     type: 1,
    //     currencyId: currencyService.getCurrencies().first.id,
    //     currencySymbol: currencyService.getCurrencies().first.symbol,
    //     note: 'note2',
    //     bank: '',
    //   ),
    //   TransactionEntity(
    //     id: 'ID11',
    //     categoryId: '',
    //     createdAt: DateTime.now().add(Duration(days: 1)),
    //     updatedAt: DateTime.now().add(Duration(days: 1)),
    //     amount: 120000,
    //     type: 1,
    //     currencyId: currencyService.getCurrencies().first.id,
    //     currencySymbol: currencyService.getCurrencies().first.symbol,
    //     note: 'note2',
    //     bank: '',
    //   ),
    //   TransactionEntity(
    //     id: 'ID12',
    //     categoryId: '',
    //     createdAt: DateTime.now().add(Duration(days: 1)),
    //     updatedAt: DateTime.now().add(Duration(days: 1)),
    //     amount: 120000,
    //     type: 1,
    //     currencyId: currencyService.getCurrencies().first.id,
    //     currencySymbol: currencyService.getCurrencies().first.symbol,
    //     note: 'note2',
    //     bank: '',
    //   ),
    //   TransactionEntity(
    //     id: 'ID13',
    //     categoryId: '',
    //     createdAt: DateTime.now().add(Duration(days: 1)),
    //     updatedAt: DateTime.now().add(Duration(days: 1)),
    //     amount: 120000,
    //     type: 1,
    //     currencyId: currencyService.getCurrencies().first.id,
    //     currencySymbol: currencyService.getCurrencies().first.symbol,
    //     note: 'note2',
    //     bank: '',
    //   ),
    // ];
    // var transactionService = locator<ITransactionService>();
    // if (transactionService.getTransactions().length > 0)
    //   await transactionService.clearAll();
    // for (var transactionEntity in transactionEntities) {
    //   await transactionService.insert(transactionEntity);
    // }

    List<PaymentMethodEntity> paymentMethods = [
      PaymentMethodEntity(
        id: Uuid().v4(),
        name: 'Cash',
      ),
      PaymentMethodEntity(
        id: Uuid().v4(),
        name: 'Card',
      ),
      PaymentMethodEntity(
        id: Uuid().v4(),
        name: 'Others',
      ),
    ];

    var paymentMethodService = locator<IPaymentMethodService>();
    if (paymentMethodService.getPaymentMethods().length <= 0) {
      locator<GlobalData>().paymentMethodSelected =
          paymentMethods.first.toUIModel();
      await paymentMethodService.insertAll(paymentMethods);
    } else {
      locator<GlobalData>().paymentMethodSelected =
          paymentMethodService.getPaymentMethods().first.toUIModel();
    }
  }
}
