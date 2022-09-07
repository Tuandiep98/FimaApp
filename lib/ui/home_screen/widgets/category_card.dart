import 'package:fima/core/ui_model/category_ui_model.dart';
import 'package:fima/ui/common_widgets/currency_money_display.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/text_style_utils.dart';

class CategoryCard extends StatelessWidget {
  final CategoryUIModel category;
  final String currencySymbol;
  const CategoryCard({Key key, this.category, this.currencySymbol = 'đ'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          // Container(
          //   height: 40,
          //   width: 40,
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: Colors.white,
          //   ),
          //   child: Icon(
          //     Icons.access_time_filled_sharp,
          //     color: Color(0xffe67e22),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category?.name ?? '[Category]',
                  style: TextStyleUtils.bold(26).copyWith(color: Colors.white),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 10,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300].withOpacity(0.5),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Container(
                          height: 10,
                          width: category?.percent ?? 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MoneyDisplay(
                  amount: category?.totalAmount ?? 0,
                  currencySymbol: currencySymbol ?? '',
                  color: Colors.white,
                ),
                const SizedBox(height: 12),
                Text(
                  '${category?.percent?.toInt() ?? 0}%',
                  style: TextStyleUtils.thin(26).copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
