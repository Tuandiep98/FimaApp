import 'package:fima/core/hive_database/entities/transaction_entity/transaction_entity.dart';

abstract class ITransactionService {
  List<TransactionEntity> getTransactions();
  Future<void> insert(TransactionEntity transactionEntity);
}
