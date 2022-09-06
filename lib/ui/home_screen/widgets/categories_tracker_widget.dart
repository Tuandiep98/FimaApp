import 'package:fima/ui/home_screen/widgets/category_card.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/text_style_utils.dart';

class CategoriesTrackerWidget extends StatelessWidget {
  const CategoriesTrackerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 15,
      height: 270,
      decoration: BoxDecoration(
        color: Color(0xffe67e22),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Text(
                  'Categories',
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
          Container(
            height: 195,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CategoryCard(categoryName: 'Food', percent: 55, amount: 700),
                  CategoryCard(
                      categoryName: 'Health', percent: 20, amount: 100),
                  CategoryCard(
                      categoryName: 'Shopping', percent: 70, amount: 900),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
