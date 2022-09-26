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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                child: Text(
                  category?.name ?? '[Category]',
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  style: TextStyleUtils.bold(24).copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(width: 10),
              Spacer(),
              Container(
                alignment: Alignment.centerRight,
                child: MoneyDisplay(
                  amount: category?.totalAmount ?? 0,
                  currencySymbol: currencySymbol ?? '',
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 10,
                width: 100,
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
              const SizedBox(width: 10),
              Spacer(),
              Text(
                '${(category.percent.toInt() > 100) ? 100 : category?.percent?.toInt() ?? 0}%',
                style: TextStyleUtils.thin(22).copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryCardShimmer extends StatelessWidget {
  const CategoryCardShimmer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '',
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  style: TextStyleUtils.bold(24).copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(width: 10),
              Spacer(),
              const SizedBox(width: 5),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 10,
                width: 100,
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
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Spacer(),
              Text(
                '',
                style: TextStyleUtils.thin(22).copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
