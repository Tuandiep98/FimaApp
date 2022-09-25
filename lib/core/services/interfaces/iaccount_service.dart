import 'package:fima/core/hive_database/entities/account_entity/account_entity.dart';

abstract class IAccountService {
  List<Account2Entity> getAccounts();
  Future<void> insertAll(List<Account2Entity> accounts);
}
