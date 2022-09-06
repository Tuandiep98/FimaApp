import 'package:fima/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final oCcy = new NumberFormat("#,##0.00", "en_US");
final vCcy = new NumberFormat("#,##0", "vi_VN");

class MoneyDisplay extends StatelessWidget {
  final int amount;
  final String currencySymbol;
  const MoneyDisplay({Key key, this.amount = 0, this.currencySymbol = '\$'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${vCcy.format(amount)}' + currencySymbol,
      style: TextStyleUtils.regular(22),
    );
  }
}
