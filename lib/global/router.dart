import 'package:fima/ui/common_widgets/bottom_nav_bar.dart';
import 'package:fima/ui/setting_screen/setting_screen.dart';
import 'package:fima/ui/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static const String splash = '/splash';
  static const String base = '/base';
  static const String setting = '/setting';

  static PageRouteBuilder _buildRouteNavigationWithoutEffect(
      RouteSettings settings, Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      transitionDuration: Duration.zero,
      settings: settings,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const SplashScreen(),
        );
      case base:
        return _buildRouteNavigationWithoutEffect(
          settings,
          BaseScreen(),
        );
      case setting:
        return _buildRouteNavigationWithoutEffect(
          settings,
          SettingScreen(),
        );
      default:
        return _buildRouteNavigationWithoutEffect(
          settings,
          Scaffold(
            body: Center(
              child: Text('No route found: ${settings.name}.'),
            ),
          ),
        );
    }
  }

  static void onRouteChanged(String screenName) {
    if (['', null].contains(screenName)) {
      return;
    }
  }
}
