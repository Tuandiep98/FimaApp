import 'package:fima/core/view_models/interfaces/itransaction_viewmodel.dart';
import 'package:fima/ui/home_screen/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fima/core/utils/list_extension.dart';
import 'package:uuid/uuid.dart';
import 'package:fima/core/hive_database/entities/currency_entity/currency_entity.dart';
import 'package:fima/core/hive_database/entities/transaction_entity/transaction_entity.dart';
import 'package:fima/core/services/interfaces/icurrency_service.dart';
import 'package:fima/core/services/interfaces/itransaction_service.dart';

import '../../global/locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ITransactionViewModel _viewModel;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await initMockData();
    });
    _viewModel = context.read<ITransactionViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _viewModel.initTransactions();
    });
    super.initState();
  }

  Future<void> initMockData() async {
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
    ];
    var transactionService = locator<ITransactionService>();
    var transactionInDb = transactionService.getTransactions();
    if (transactionInDb.length == 0) {
      for (var transactionEntity in transactionEntities) {
        await transactionService.insert(transactionEntity);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Container(
        child: SingleChildScrollView(
          child: Consumer<ITransactionViewModel>(builder: (_, __, ___) {
            return _viewModel.transactionForDisplays != null &&
                    _viewModel.transactionForDisplays.length > 0
                ? Column(
                    children: _viewModel.transactionForDisplays
                        .map((e) => TransactionCard(transaction: e))
                        .toList(),
                  )
                : Center(
                    child: Text('No data to dislpay!'),
                  );
          }),
        ),
      ),
    );
  }
}
