import 'package:fima/core/ui_model/transaction_ui_model.dart';
import 'package:fima/core/utils/string_extension.dart';
import 'package:fima/core/utils/text_style_utils.dart';
import 'package:fima/ui/common_widgets/currency_money_display.dart';
import 'package:fima/ui/common_widgets/dot.dart';
import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class TransactionCard extends StatelessWidget {
  final TransactionUIModel transaction;
  const TransactionCard({Key key, this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: transaction.note.isNullOrEmpty() ? 61 : 75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Dot(color: transaction.type == 1 ? Colors.green : Colors.red),
                const SizedBox(width: 10),
                Text(
                  transaction.categoryName ?? '[category-name]',
                  style: TextStyleUtils.regular(28),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 15),
                !transaction.note.isNullOrEmpty()
                    ? Container(
                        width: 140,
                        child: TextScroll(
                          '- ' + transaction.note ?? '[note]',
                          style: TextStyleUtils.thin(20)
                              .copyWith(fontStyle: FontStyle.italic),
                          velocity: Velocity(pixelsPerSecond: Offset(60, 0)),
                          pauseBetween: Duration(milliseconds: 5000),
                          mode: TextScrollMode.bouncing,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 15),
                Text(
                  transaction.type == 1 ? '+' : '-',
                  style: TextStyleUtils.regular(22).copyWith(
                    color: transaction.type == 1 ? Colors.green : Colors.red,
                  ),
                ),
                MoneyDisplay(
                  amount: transaction.amount,
                  currencySymbol: transaction.currencySymbol,
                  color: transaction.type == 1 ? Colors.green : Colors.red,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Divider(),
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
