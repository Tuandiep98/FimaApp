import 'package:fima/core/view_models/interfaces/itransaction_viewmodel.dart';
import 'package:fima/ui/home_screen/home_screen.dart';
import 'package:fima/ui/setting_screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss_bottom_navbar/ss_bottom_navbar.dart';
import 'package:provider/provider.dart';

import '../add_transaction_screen/add_transaction_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final _isVisible = true;

  final _screens = [HomeScreen(), AddTransactionScreen(), SettingScreen()];
  final items = [
    SSBottomNavItem(text: 'Home', iconData: Icons.home, iconSize: 22),
    SSBottomNavItem(
        text: 'Add', iconData: Icons.add, iconSize: 22, isIconOnly: true),
    SSBottomNavItem(text: 'Profile', iconData: Icons.person, iconSize: 22)
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SSBottomBarState(),
      child: Consumer<SSBottomBarState>(
        builder: (context, state, _) {
          return Scaffold(
            backgroundColor: Colors.grey[100],
            body: IndexedStack(
              index: state.selected,
              children: _buildPages(),
            ),
            bottomNavigationBar: SSBottomNav(
              items: items,
              state: state,
              color: Colors.black,
              selectedColor: Colors.white,
              unselectedColor: Colors.black,
              visible: _isVisible,
              bottomSheetWidget: _bottomSheet(),
              showBottomSheetAt: 1,
            ),
          );
        },
      ),
    );
  }

  Widget _page(Widget screen) => screen;

  List<Widget> _buildPages() =>
      _screens.map((screen) => _page(screen)).toList();

  Widget _bottomSheet() => Container(
        color: Colors.white,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.arrow_upward_rounded),
              title: Text('Expense'),
              onTap: () {
                context
                    .read<ITransactionViewModel>()
                    .setTransactionModeLabel('Expense');
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_downward_rounded),
              title: Text('Income'),
              onTap: () {
                context
                    .read<ITransactionViewModel>()
                    .setTransactionModeLabel('Income');
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.devices_other),
              title: Text('Other'),
              onTap: () {
                context
                    .read<ITransactionViewModel>()
                    .setTransactionModeLabel('Other');
                Get.back();
              },
            ),
          ],
        ),
      );
}
