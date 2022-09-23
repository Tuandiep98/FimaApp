import 'package:fima/core/utils/enum.dart';
import 'package:flutter/material.dart';

abstract class IBaseViewModel extends ChangeNotifier {
  List<DataStateObject> get screenState;
  void changeState(DataState newState);
  DataState getScreenState();
}

class DataStateObject {
  String key;
  DataState state;

  DataStateObject({this.key, this.state});
}
