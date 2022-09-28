import 'package:fima/core/ui_model/transaction_ui_model.dart';
import 'package:fima/core/utils/string_extension.dart';
import 'package:fima/core/utils/text_style_utils.dart';
import 'package:fima/ui/common_widgets/currency_money_display.dart';
import 'package:fima/ui/common_widgets/dot.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:text_scroll/text_scroll.dart';

class TransactionExpanded extends StatelessWidget {
  final TransactionUIModel transaction;
  const TransactionExpanded({Key key, this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.67,
                  child: Row(
                    children: [
                      Dot(
                          color: transaction.type == 1
                              ? Colors.green
                              : Colors.red),
                      const SizedBox(width: 10),
                      Text(
                        transaction.categoryName ?? '[category-name]',
                        style: TextStyleUtils.regular(28),
                      ),
                      Spacer(),
                      Text(
                        '${DateFormat('HH:mm').format(transaction.createdAt)}',
                        style: TextStyleUtils.regular(20),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(width: 15),
                    !transaction.note.isNullOrEmpty()
                        ? Container(
                            width: 145,
                            child: TextScroll(
                              '- ' + transaction.note ?? '[note]',
                              style: TextStyleUtils.thin(20)
                                  .copyWith(fontStyle: FontStyle.italic),
                              velocity:
                                  Velocity(pixelsPerSecond: Offset(60, 0)),
                              pauseBetween: Duration(milliseconds: 5000),
                              mode: TextScrollMode.bouncing,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 15),
                    Text(
                      transaction.type == 1 ? '+' : '-',
                      style: TextStyleUtils.regular(28).copyWith(
                          color: transaction.type == 1
                              ? Colors.green
                              : Colors.red),
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
        ],
      ),
    );
  }
}

class TransactionExpandedShimmer extends StatelessWidget {
  const TransactionExpandedShimmer({Key key}) : super(key: key);

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
