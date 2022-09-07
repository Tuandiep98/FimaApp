import 'package:fima/core/ui_model/category_ui_model.dart';
import 'package:flutter/material.dart';

abstract class IHomeScreenViewModel implements ChangeNotifier {
  List<CategoryUIModel> categoriesForDisplay;
  void getCategories();
}
