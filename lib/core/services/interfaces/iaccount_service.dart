import 'package:fima/core/hive_database/entities/account_entity/account_entity.dart';

abstract class IAccountService {
  List<AccountEntity> getAccounts();
  Future<void> insertAll(List<AccountEntity> accounts);
}
