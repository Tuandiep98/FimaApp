import 'package:fima/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  final String hint;
  const TitleText({Key key, this.title, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        child: Row(
          children: [
            Image.asset(
              'assets/images/currency_img.PNG',
              width: 35,
              height: 35,
            ),
            const SizedBox(width: 10),
            Text(
              title ?? 'Today',
              style: TextStyleUtils.regular(25),
            ),
            Spacer(),
            Text(
              hint ?? 'All',
              style: TextStyleUtils.thin(20),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
