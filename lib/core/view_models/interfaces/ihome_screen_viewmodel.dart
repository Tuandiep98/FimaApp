import 'package:fima/core/ui_model/category_ui_model.dart';
import 'package:fima/core/ui_model/payment_method_ui_model.dart';
import 'ibase_viewmodel.dart';

abstract class IHomeScreenViewModel extends IBaseViewModel {
  List<CategoryUIModel> get categoriesForDisplay;
  List<PaymentMethodUIModel> get paymentMethodsForDisplay;
  void getCategories();
  Future<void> createCategory(
      String categoryName, int codePoint, String fontFamily);
  Future<void> createPaymentMethod(
      String paymentMethod, int codePoint, String fontFamily);
  void initPaymentMethods();
}
