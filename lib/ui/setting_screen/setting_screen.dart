import 'package:fima/core/utils/dialog_utils.dart';
import 'package:fima/core/utils/text_style_utils.dart';
import 'package:fima/global/global_data.dart';
import 'package:fima/global/locator.dart';
import 'package:fima/global/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isShowMembership = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 180,
              child: SettingsList(
                sections: [
                  SettingsSection(
                    title: Text('Accounts'),
                    tiles: <SettingsTile>[
                      SettingsTile.navigation(
                        leading: Icon(Icons.person),
                        title: Text(
                          locator<GlobalData>().currentUser?.username ??
                              'Current Account',
                          style: TextStyleUtils.regular(30),
                        ),
                        value: Text(
                          locator<GlobalData>().currentUser?.bio ?? 'As Guest',
                          style: TextStyleUtils.regular(25).copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      SettingsTile.navigation(
                        leading: Icon(Icons.logout_rounded, color: Colors.red),
                        title: Text(
                          'Logout',
                          style: TextStyleUtils.regular(30).copyWith(
                            color: Colors.red,
                          ),
                        ),
                        onPressed: (context) async {
                          await DialogUtils.showOkCancelDialog(
                              title: 'Accounts',
                              body: 'Do you want to logout!',
                              onOK: () {
                                locator<GlobalData>().currentUser = null;
                                Get.offAllNamed(MyRouter.splash);
                              });
                        },
                      ),
                    ],
                  ),
                  SettingsSection(
                    title: Text('Common'),
                    tiles: <SettingsTile>[
                      SettingsTile.navigation(
                        leading: Icon(Icons.language),
                        title:
                            Text('Language', style: TextStyleUtils.regular(30)),
                        value: Text('English'),
                      ),
                      SettingsTile.switchTile(
                        onToggle: (value) {},
                        initialValue: true,
                        leading: Icon(Icons.sync),
                        title: Text(
                          'Auto sync data',
                          style: TextStyleUtils.regular(30),
                        ),
                        activeSwitchColor: Colors.black,
                      ),
                      SettingsTile.switchTile(
                        onToggle: (value) {},
                        initialValue: false,
                        leading: Icon(Icons.format_paint),
                        title: Text(
                          'Enable custom theme',
                          style: TextStyleUtils.regular(30),
                        ),
                        activeSwitchColor: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          isShowMembership
              ? Container(
                  color: Colors.white.withOpacity(0.7),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/notification.png',
                                width: 50,
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Continue as Membership',
                          style: TextStyleUtils.thin(28).copyWith(
                            color: Colors.grey[500],
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            isShowMembership = false;
                            setState(() {});
                          },
                          child: Icon(
                            Icons.close_rounded,
                            size: 30,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
