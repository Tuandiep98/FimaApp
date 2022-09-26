import 'package:fima/core/hive_database/daos/account_dao.dart';
import 'package:fima/core/hive_database/entities/account_entity/account_entity.dart';
import 'package:fima/core/services/interfaces/iaccount_service.dart';
import 'package:fima/global/locator.dart';

class AccountService implements IAccountService {
  var _dao = locator<AccountDao>();

  @override
  List<AccountEntity> getAccounts() {
    return _dao.getAll();
  }

  @override
  Future<void> insertAll(List<AccountEntity> accounts) async {
    await _dao.insertAll(accounts);
  }
}
