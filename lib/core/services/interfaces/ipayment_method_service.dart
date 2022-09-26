import 'package:fima/core/hive_database/entities/payment_method_entity/payment_method_entity.dart';

abstract class IPaymentMethodService {
  List<PaymentMethodEntity> getPaymentMethods();
  Future<void> insertAll(List<PaymentMethodEntity> paymentMethods);
  Future<void> clearAll();
  Future<void> deleteById(String id);
}
