import 'package:calendar_view/calendar_view.dart';
import 'package:fima/core/utils/text_style_utils.dart';
import 'package:fima/core/view_models/interfaces/itransaction_viewmodel.dart';
import 'package:fima/ui/common_widgets/title_txt.dart';
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 5),
      child: Column(
        children: [
          TitleText(title: 'Month calendar'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: MediaQuery.of(context).size.height / 2.2,
              child:
                  Consumer<ITransactionViewModel>(builder: (_, _viewModel, __) {
                return MonthView(
                  cellAspectRatio: 2,
                  showBorder: false,
                  controller: EventController(),
                  // to provide custom UI for month cells.
                  cellBuilder: (date, events, isToday, isInMonth) {
                    // Return your widget to display as month cell.
                    return Container(
                      color: isInMonth
                          ? Color(_viewModel.getColorActivitiesOfTheDay(date))
                          : Colors.grey[200],
                      child: Stack(
                        children: [
                          Positioned.fill(
                            top: 5,
                            left: 5,
                            child: Text(
                              '${date.day}',
                              style: TextStyleUtils.thin(18).copyWith(
                                  color: isInMonth
                                      ? Colors.black
                                      : Colors.grey[200]),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  onPageChange: (date, pageIndex) => print("$date, $pageIndex"),
                  onCellTap: (events, date) {
                    // Implement callback when user taps on a cell.
                    print(events);
                  },
                  startDay:
                      WeekDays.sunday, // To change the first day of the week.
                  // This callback will only work if cellBuilder is null.
                  onEventTap: (event, date) => print(event),
                  onDateLongPress: (date) => print(date),
                );
              }),
            ),
          ),
          TitleText(title: 'Today'),
          const SizedBox(height: 10),
          Container(
            height: MediaQuery.of(context).size.height / 3.6,
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
        ],
      ),
    );
  }
}
