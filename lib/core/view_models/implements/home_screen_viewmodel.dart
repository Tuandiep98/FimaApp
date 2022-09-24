import 'package:fima/core/hive_database/entities/category_entity/category_entity.dart';
import 'package:fima/core/services/interfaces/icategory_service.dart';
import 'package:fima/core/services/interfaces/itransaction_service.dart';
import 'package:fima/core/ui_model/category_ui_model.dart';
import 'package:fima/core/utils/enum.dart';
import 'package:fima/core/view_models/implements/base_viewmodel.dart';
import 'package:fima/core/view_models/interfaces/ihome_screen_viewmodel.dart';
import 'package:fima/global/global_data.dart';
import 'package:fima/global/locator.dart';
import 'package:uuid/uuid.dart';

class HomeScreenViewModel extends BaseViewModel
    implements IHomeScreenViewModel {
  var categoryService = locator<ICategoryService>();
  var transactionService = locator<ITransactionService>();

  List<CategoryUIModel> _categoriesForDisplay = [];
  @override
  List<CategoryUIModel> categoriesForDisplay;

  @override
  void getCategories() {
    changeState(DataState.FetchingData);
    _categoriesForDisplay.clear();
    var categories = categoryService.getCategories();
    if (categories.length > 0) {
      var transactions = transactionService.getTransactions();
      _categoriesForDisplay = categories.map((e) => e.toUIModel()).toList();
      for (var _category in _categoriesForDisplay) {
        var transactionsOfCategory =
            transactions.where((x) => x.categoryId == _category.id).toList();
        if (transactionsOfCategory.length > 0) {
          double totalAmount = 0;
          double totalAllMonth = 0;
          for (var transaction in transactionsOfCategory) {
            totalAllMonth += transaction.amount;
            if (transaction.type == 1)
              totalAmount += transaction.amount;
            else
              totalAmount -= transaction.amount;
          }
          _category.totalAllMonth = totalAllMonth;
          _category.totalAmount = totalAmount;
          _category.percent = (totalAllMonth == 0 || totalAmount == 0)
              ? 0
              : totalAmount.abs() / totalAllMonth.abs() * 100;
        }
      }
      categoriesForDisplay = _categoriesForDisplay;
      categoriesForDisplay
          .sort((a, b) => b.totalAmount.compareTo(a.totalAmount));
      changeState(DataState.DataFetchedSuccessfully);
    } else {
      changeState(DataState.NoDataToDisplay);
    }
  }

  @override
  Future<void> createCategory(
      String categoryName, int codePoint, String fontFamily) async {
    changeState(DataState.FetchingData);
    CategoryEntity newCategory = CategoryEntity(
      id: Uuid().v4(),
      codePoint: codePoint,
      name: categoryName,
      fontFamilly: fontFamily,
    );
    await categoryService.insertAll([newCategory]);
    var categoryUIModel = newCategory.toUIModel();
    locator<GlobalData>().categorySelected = categoryUIModel;
    _categoriesForDisplay.add(categoryUIModel);
    categoriesForDisplay = _categoriesForDisplay;
    categoriesForDisplay.sort((a, b) => b.totalAmount.compareTo(a.totalAmount));
    changeState(DataState.DataFetchedSuccessfully);
  }
}
