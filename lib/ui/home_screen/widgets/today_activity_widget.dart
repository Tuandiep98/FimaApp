import 'package:fima/core/ui_model/transaction_ui_model.dart';
import 'package:fima/core/utils/text_style_utils.dart';
import 'package:fima/ui/common_widgets/currency_money_display.dart';
import 'package:fima/ui/common_widgets/no_data_to_display.dart';
import 'package:fima/ui/home_screen/widgets/transaction_card.dart';
import 'package:flutter/material.dart';

class TodayActivityWidget extends StatelessWidget {
  final List<TransactionUIModel> transactions;
  const TodayActivityWidget({Key key, this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var expense = transactions
        .where((x) => x.type == 0)
        .reduce((curr, next) => (curr.amount > next.amount) ? curr : next);
    var income = transactions
        .where((x) => x.type == 1)
        .reduce((curr, next) => (curr.amount < next.amount) ? curr : next);
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 15,
      height: 285,
      decoration: BoxDecoration(
        color: Color(0xff1abc9c),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Text(
                  'Today' + '(${transactions.length})',
                  style: TextStyleUtils.bold(30).copyWith(color: Colors.white),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.white,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.asset(
                      'assets/images/notification.png',
                      width: 18,
                      height: 18,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      height: 20,
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_drop_up_rounded,
                            size: 20,
                            color: Colors.green,
                          ),
                          MoneyDisplay(
                            amount: expense.amount,
                            currencySymbol: expense.currencySymbol ?? 'đ',
                            color: Colors.white60,
                          ),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 20,
                            color: Colors.red,
                          ),
                          MoneyDisplay(
                            amount: income.amount,
                            currencySymbol: income.currencySymbol ?? 'đ',
                            color: Colors.white60,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          transactions != null && transactions.length > 0
              ? Container(
                  height: 200,
                  child: SingleChildScrollView(
                    child: Column(
                      children: transactions
                          .map((e) => TransactionCard(transaction: e))
                          .toList(),
                    ),
                  ),
                )
              : NoDataToDisplay(hideImg: true),
        ],
      ),
    );
  }
}
