import 'package:fima/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';

class NoDataToDisplay extends StatelessWidget {
  final bool hideImg;
  const NoDataToDisplay({Key key, this.hideImg = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          !hideImg
              ? Image.asset(
                  'assets/images/analyz.png',
                  width: 50,
                  height: 50,
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 20),
          Text(
            'No data to display!',
            style: TextStyleUtils.thin(20),
          ),
        ],
      ),
    );
  }
}
