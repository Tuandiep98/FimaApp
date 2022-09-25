import 'package:flutter/material.dart';

abstract class ISplashScreenViewModel implements ChangeNotifier {
  Future<void> continueAsGuest({bool asBackgroundCheck = false});
}
