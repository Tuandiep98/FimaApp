import 'package:fima/ui/home_screen/home_screen.dart';
import 'package:fima/ui/setting_screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss_bottom_navbar/ss_bottom_navbar.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  final Widget body;
  const BaseScreen({Key key, this.body}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final _isVisible = true;

  final _screens = [
    HomeScreen(),
    SettingScreen(),
  ];

  final items = [
    SSBottomNavItem(text: 'Home', iconData: Icons.home),
    SSBottomNavItem(text: 'Add', iconData: Icons.add, isIconOnly: true),
    SSBottomNavItem(text: 'Setting', iconData: Icons.settings),
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
              leading: Icon(Icons.camera_alt),
              title: Text('Expense'),
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Income'),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Other'),
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      );
}
