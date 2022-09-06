import 'package:fima/core/ui_model/transaction_ui_model.dart';
import 'package:fima/core/utils/text_style_utils.dart';
import 'package:fima/ui/common_widgets/no_data_to_display.dart';
import 'package:fima/ui/home_screen/widgets/transaction_card.dart';
import 'package:flutter/material.dart';

class TodayActivityWidget extends StatelessWidget {
  final List<TransactionUIModel> transactions;
  const TodayActivityWidget({Key key, this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 15,
      height: 270,
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
                  'Today',
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
