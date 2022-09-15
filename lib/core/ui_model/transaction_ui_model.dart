import 'package:fima/core/hive_database/entities/transaction_entity/transaction_entity.dart';

class TransactionUIModel {
  String id;
  String categoryId;
  DateTime createdAt;
  DateTime updatedAt;
  int amount;
  int type;
  String currencyId;
  String currencySymbol;
  String note;
  String bank;

  TransactionUIModel({
    this.id,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.amount,
    this.type,
    this.currencyId,
    this.currencySymbol,
    this.note,
    this.bank,
  });

  TransactionEntity toEntity() {
    return TransactionEntity(
      id: this.id,
      categoryId: this.categoryId,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt,
      amount: this.amount,
      type: this.type,
      currencyId: this.currencyId,
      currencySymbol: this.currencySymbol,
      note: this.note,
      bank: this.bank,
    );
  }
}
