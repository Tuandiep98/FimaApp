import 'package:fima/core/ui_model/transaction_ui_model.dart';
import 'package:fima/core/utils/text_style_utils.dart';
import 'package:fima/ui/common_widgets/currency_money_display.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final TransactionUIModel transaction;
  const TransactionCard({Key key, this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(3),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 7,
                height: 30,
                decoration: BoxDecoration(
                  color: transaction.type == 1 ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (transaction.type == 1 ? 'Income' : 'Expense') +
                      '(${transaction.currencySymbol})',
                  style: TextStyleUtils.regular(28),
                ),
                MoneyDisplay(
                  amount: transaction.amount,
                  currencySymbol: transaction.currencySymbol,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionCardShimmer extends StatelessWidget {
  const TransactionCardShimmer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(''),
      ),
    );
  }
}
