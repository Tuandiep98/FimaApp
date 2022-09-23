import 'package:fima/core/utils/text_style_utils.dart';
import 'package:fima/global/app_text.dart';
import 'package:fima/global/mock_data.dart';
import 'package:fima/global/router.dart';
import 'package:fima/ui/common_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await MockData.initMockData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Container(
          child: Column(
            children: [
              const SizedBox(height: 55),
              Image.asset('assets/images/logo.PNG'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.link_rounded, size: 20),
                  Text(
                    'Powered by TuanDiep',
                    style: TextStyleUtils.regular(25),
                  ),
                ],
              ),
              Spacer(),
              CustomButton(
                onPressed: () {},
                btnColor: const Color(0xffdfe6e9),
                child: Text(
                  AppText.lblEmail,
                  style: TextStyleUtils.regular(35),
                ),
              ),
              CustomButton(
                onPressed: () {
                  Get.offAllNamed(MyRouter.base);
                },
                btnColor: const Color(0xff55efc4),
                child: Text(
                  AppText.lblContinueAsGuest,
                  style: TextStyleUtils.regular(35),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
