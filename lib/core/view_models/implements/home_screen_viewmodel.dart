import 'package:fima/core/services/interfaces/icategory_service.dart';
import 'package:fima/core/ui_model/category_ui_model.dart';
import 'package:fima/core/view_models/interfaces/ihome_screen_viewmodel.dart';
import 'package:fima/global/locator.dart';
import 'package:flutter/material.dart';

class HomeScreenViewModel extends ChangeNotifier
    implements IHomeScreenViewModel {
  var categoryService = locator<ICategoryService>();

  List<CategoryUIModel> _categoriesForDisplay = [];
  @override
  List<CategoryUIModel> categoriesForDisplay;

  @override
  void getCategories() {
    _categoriesForDisplay.clear();
    var categories = categoryService.getCategories();
    if (categories.length > 0) {
      _categoriesForDisplay = categories.map((e) => e.toUIModel()).toList();
      categoriesForDisplay = _categoriesForDisplay;
    }
    notifyListeners();
  }
}
