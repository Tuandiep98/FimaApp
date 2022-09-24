import 'package:fima/core/ui_model/category_ui_model.dart';
import 'ibase_viewmodel.dart';

abstract class IHomeScreenViewModel extends IBaseViewModel {
  List<CategoryUIModel> categoriesForDisplay;
  void getCategories();
  Future<void> createCategory(
      String categoryName, int codePoint, String fontFamily);
}
