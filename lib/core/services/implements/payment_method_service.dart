import 'package:fima/core/hive_database/daos/payment_method_dao.dart';
import 'package:fima/core/hive_database/entities/payment_method_entity/payment_method_entity.dart';
import 'package:fima/core/services/interfaces/ipayment_method_service.dart';
import 'package:fima/global/locator.dart';

class PaymentMethodService implements IPaymentMethodService {
  var _dao = locator<PaymentMethodDao>();

  @override
  List<PaymentMethodEntity> getPaymentMethods() {
    return _dao.getAll();
  }

  @override
  Future<void> insertAll(List<PaymentMethodEntity> paymentMethods) async {
    await _dao.insertAll(paymentMethods);
  }

  @override
  Future<void> clearAll() async {
    await _dao.clear();
  }
}
