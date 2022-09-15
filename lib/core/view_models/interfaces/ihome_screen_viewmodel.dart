import 'package:fima/core/ui_model/category_ui_model.dart';
import 'package:fima/core/utils/enum.dart';
import 'package:flutter/material.dart';

abstract class IHomeScreenViewModel implements ChangeNotifier {
  DataState get state;
  List<CategoryUIModel> categoriesForDisplay;
  void getCategories();
}
