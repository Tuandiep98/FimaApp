import 'package:fima/core/ui_model/payment_method_ui_model.dart';
import 'package:fima/core/utils/enum.dart';

import '../../ui_model/transaction_ui_model.dart';
import 'ibase_viewmodel.dart';

abstract class ITransactionViewModel extends IBaseViewModel {
  List<TransactionUIModel> transactionForDisplays;
  String get transactionModeLabel;
  TransactionUIModel get expense;
  TransactionUIModel get income;
  void setTransactionModeLabel(TransactionType type);
  void initTransactions();
  int getColorActivitiesOfTheDay(DateTime dateTime);
  Future<void> createTransaction(double amount, String note);
  List<PaymentMethodUIModel> getPaymentMethods();
}
