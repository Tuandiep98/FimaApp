import 'package:emoji_picker_2/emoji_picker_2.dart';
import 'package:fima/core/ui_model/category_ui_model.dart';
import 'package:fima/core/ui_model/payment_method_ui_model.dart';
import 'ibase_viewmodel.dart';

abstract class IHomeScreenViewModel extends IBaseViewModel {
  List<CategoryUIModel> get categoriesForDisplay;
  List<PaymentMethodUIModel> get paymentMethodsForDisplay;
  void getCategories();
  Future<void> createCategory(
      String categoryName, Emoji emoji);
  Future<void> createPaymentMethod(
      String paymentMethod, Emoji emoji);
  void initPaymentMethods();
  Future<void> deleteCategories(List<String> categories);
  Future<void> deletePaymentMethods(List<String> paymentMethods);
}
