import 'package:fima/core/utils/text_style_utils.dart';
import 'package:fima/core/view_models/interfaces/itransaction_viewmodel.dart';
import 'package:fima/global/global_data.dart';
import 'package:fima/global/locator.dart';
import 'package:fima/ui/common_widgets/currency_money_display.dart';
import 'package:fima/ui/common_widgets/no_data_to_display.dart';
import 'package:fima/ui/data_screen.dart';
import 'package:fima/ui/home_screen/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TodayActivityWidget extends StatefulWidget {
  const TodayActivityWidget({Key key}) : super(key: key);

  @override
  _TodayActivityWidgetState createState() => _TodayActivityWidgetState();
}

class _TodayActivityWidgetState extends State<TodayActivityWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ITransactionViewModel>(builder: (_, _viewModel, ___) {
      return DataBuilder(
        arguments: DataBuilderArguments(
          dataFetchedSuccessfullyWidget: Container(
            width: MediaQuery.of(context).size.width / 2 - 15,
            height: 285,
            decoration: BoxDecoration(
              color: Color(0xff1abc9c),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        'Today',
                        style: TextStyleUtils.bold(30)
                            .copyWith(color: Colors.white),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '(${_viewModel.transactionForDisplays?.length ?? 0})',
                            style: TextStyleUtils.regular(22)
                                .copyWith(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white.withOpacity(0.15),
                    ),
                    child: Container(
                      height: 20,
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_drop_up_rounded,
                            size: 20,
                            color: Colors.green,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 6.5,
                            child: MoneyDisplay(
                              amount: _viewModel.expenseToday ?? 0,
                              currencySymbol: locator<GlobalData>()
                                      .currentCurrency
                                      ?.symbol ??
                                  'đ',
                              color: Colors.white60,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 20,
                            color: Colors.red,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 6.5,
                            child: MoneyDisplay(
                              amount: _viewModel.incomeToday ?? 0,
                              currencySymbol: locator<GlobalData>()
                                      .currentCurrency
                                      ?.symbol ??
                                  'đ',
                              color: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _viewModel.transactionForDisplays != null &&
                        _viewModel.transactionForDisplays.length > 0
                    ? Container(
                        height: 200,
                        child: SingleChildScrollView(
                          child: Column(
                            children: _viewModel.transactionForDisplays
                                .map((e) => TransactionCard(transaction: e))
                                .toList(),
                          ),
                        ),
                      )
                    : NoDataToDisplay(hideImg: true),
              ],
            ),
          ),
          fetchingDataWidget: TodayActivityWidgetShimmer(),
          noDataToDisplayWidget: Container(
            width: MediaQuery.of(context).size.width / 2 - 15,
            height: 285,
            decoration: BoxDecoration(
              color: Color(0xffe67e22),
              borderRadius: BorderRadius.circular(5),
            ),
            child: NoDataToDisplay(hideImg: true),
          ),
          state: _viewModel.getScreenState(),
        ),
      );
    });
  }
}

class TodayActivityWidgetShimmer extends StatelessWidget {
  const TodayActivityWidgetShimmer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 15,
      height: 285,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: Container(
          width: MediaQuery.of(context).size.width / 2 - 15,
          height: 285,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text(
                      'Today',
                      style:
                          TextStyleUtils.bold(30).copyWith(color: Colors.white),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '',
                          style: TextStyleUtils.regular(22)
                              .copyWith(color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // TransactionCardShimmer(),
              // ListView.builder(
              //   itemCount: 2,
              //   itemBuilder: (_, __) {
              //     return TransactionCardShimmer();
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
