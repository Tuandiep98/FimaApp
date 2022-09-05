import 'package:fima/core/hive_database/daos/currency_dao.dart';
import 'package:fima/core/hive_database/entities/currency_entity/currency_entity.dart';
import 'package:fima/core/services/interfaces/icurrency_service.dart';
import 'package:fima/global/locator.dart';

class CurrencyService implements ICurrencyService {
  var _dao = locator<CurrencyDao>();

  @override
  List<CurrencyEntity> getCurrencies() {
    return _dao.getAll();
  }

  @override
  Future<void> insertAll(List<CurrencyEntity> currencies) async {
    await _dao.insertAll(currencies);
  }
}
