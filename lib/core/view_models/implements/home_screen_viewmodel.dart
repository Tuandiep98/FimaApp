import 'package:emoji_picker_2/emoji_picker_2.dart';
import 'package:fima/core/hive_database/entities/category_entity/category_entity.dart';
import 'package:fima/core/hive_database/entities/payment_method_entity/payment_method_entity.dart';
import 'package:fima/core/services/interfaces/icategory_service.dart';
import 'package:fima/core/services/interfaces/ipayment_method_service.dart';
import 'package:fima/core/services/interfaces/itransaction_service.dart';
import 'package:fima/core/ui_model/category_ui_model.dart';
import 'package:fima/core/ui_model/payment_method_ui_model.dart';
import 'package:fima/core/utils/enum.dart';
import 'package:fima/core/utils/logger_utils.dart';
import 'package:fima/core/view_models/implements/base_viewmodel.dart';
import 'package:fima/core/view_models/interfaces/ihome_screen_viewmodel.dart';
import 'package:fima/global/global_data.dart';
import 'package:fima/global/locator.dart';
import 'package:uuid/uuid.dart';

class HomeScreenViewModel extends BaseViewModel
    implements IHomeScreenViewModel {
  var categoryService = locator<ICategoryService>();
  var transactionService = locator<ITransactionService>();
  var paymentMethodService = locator<IPaymentMethodService>();

  List<CategoryUIModel> _categoriesForDisplay = [];
  @override
  List<CategoryUIModel> get categoriesForDisplay => _categoriesForDisplay;

  List<PaymentMethodUIModel> _paymentMethodsForDisplay = [];
  @override
  List<PaymentMethodUIModel> get paymentMethodsForDisplay =>
      _paymentMethodsForDisplay;

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
      _categoriesForDisplay
          .sort((a, b) => b.totalAmount.abs().compareTo(a.totalAmount.abs()));
      changeState(DataState.DataFetchedSuccessfully);
    } else {
      changeState(DataState.NoDataToDisplay);
    }
  }

  @override
  Future<void> createCategory(
      String categoryName, Emoji emoji) async {
    changeState(DataState.FetchingData);
    try {
      CategoryEntity newCategory = CategoryEntity(
        id: Uuid().v4(),
        name: categoryName,
        emoji: emoji.emoji,
        emojiCategory: emoji.name,
      );
      await categoryService.insertAll([newCategory]);
      var categoryUIModel = newCategory.toUIModel();
      locator<GlobalData>().categorySelected = categoryUIModel;
      _categoriesForDisplay.add(categoryUIModel);
      _categoriesForDisplay
          .sort((a, b) => b.totalAmount.compareTo(a.totalAmount));
    } catch (e) {
      await LoggerUtils.logException(e);
    }
    changeState(DataState.DataFetchedSuccessfully);
  }

  @override
  Future<void> createPaymentMethod(
      String paymentMethod, Emoji emoji) async {
    changeState(DataState.FetchingData);
    try {
      PaymentMethodEntity newPaymentMethod = PaymentMethodEntity(
        id: Uuid().v4(),
        emoji: emoji.emoji,
        emojiCategory: emoji.name,
        name: paymentMethod,
      );
      await paymentMethodService.insertAll([newPaymentMethod]);
      var paymentMethodUIModel = newPaymentMethod.toUIModel();
      locator<GlobalData>().paymentMethodSelected = paymentMethodUIModel;
      _paymentMethodsForDisplay.add(paymentMethodUIModel);
      _paymentMethodsForDisplay.sort((a, b) => b.name.compareTo(a.name));
    } catch (e) {
      await LoggerUtils.logException(e);
    }
    changeState(DataState.DataFetchedSuccessfully);
  }

  @override
  void initPaymentMethods() {
    _paymentMethodsForDisplay.clear();
    var paymentMethods = paymentMethodService.getPaymentMethods();
    if (paymentMethods.length > 0) {
      _paymentMethodsForDisplay =
          paymentMethods.map((e) => e.toUIModel()).toList();
      _paymentMethodsForDisplay.sort((a, b) => a.name.compareTo(b.name));
      notifyListeners();
    }
  }

  @override
  Future<void> deleteCategories(List<String> categories) async {
    var deleteObjects = categoryService
        .getCategories()
        .where((x) => categories.contains(x.id))
        .toList();
    if (deleteObjects.length > 0) {
      for (var item in deleteObjects) {
        if (locator<GlobalData>().categorySelected?.id == item.id) {
          locator<GlobalData>().categorySelected = null;
        }
        await categoryService.deleteById(item.id);
      }
      getCategories();
    }
  }

  @override
  Future<void> deletePaymentMethods(List<String> paymentMethods) async {
    var deleteObjects = paymentMethodService
        .getPaymentMethods()
        .where((x) => paymentMethods.contains(x.id))
        .toList();
    if (deleteObjects.length > 0) {
      for (var item in deleteObjects) {
        if (locator<GlobalData>().paymentMethodSelected?.id == item.id) {
          locator<GlobalData>().paymentMethodSelected = null;
        }
        await paymentMethodService.deleteById(item.id);
      }
      initPaymentMethods();
    }
  }
}
