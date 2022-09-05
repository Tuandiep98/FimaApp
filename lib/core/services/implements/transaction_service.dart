import 'package:fima/core/hive_database/daos/transaction_dao.dart';
import 'package:fima/core/hive_database/entities/transaction_entity/transaction_entity.dart';
import 'package:fima/core/services/interfaces/itransaction_service.dart';
import 'package:fima/global/locator.dart';

class TransactionService implements ITransactionService {
  var _dao = locator<TransactionDao>();

  @override
  List<TransactionEntity> getTransactions() {
    return _dao.getAll();
  }

  @override
  Future<void> insert(TransactionEntity device) async {
    await _dao.insert(device);
  }
}
