import 'package:fima/core/utils/enum.dart';
import 'package:fima/core/utils/list_extension.dart';
import 'package:fima/core/view_models/interfaces/ibase_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BaseViewModel with ChangeNotifier implements IBaseViewModel {
  List<DataStateObject> _screenState = [];
  List<DataStateObject> get screenState => _screenState;

  void changeState(DataState newState, {String routeIn = ''}) {
    var routeName = routeIn == '' ? Get.currentRoute : routeIn;
    if (_screenState == null) {
      _screenState = [];
    }
    var route = screenState
        .firstOrDefault((x) => x.key.toLowerCase() == routeName.toLowerCase());
    if (route == null) {
      DataStateObject newScreenState =
          DataStateObject(key: routeName, state: newState);
      _screenState.add(newScreenState);
    } else {
      route.state = newState;
    }
    notifyListeners();
  }

  DataState getScreenState() {
    var routeName = Get.currentRoute;
    var route = screenState
        .firstOrDefault((x) => x.key.toLowerCase() == routeName.toLowerCase());
    if (route == null) {
      DataStateObject newScreenState =
          DataStateObject(key: routeName, state: DataState.NoDataToDisplay);
      _screenState.add(newScreenState);
      return newScreenState.state;
    } else {
      return route.state;
    }
  }
}
