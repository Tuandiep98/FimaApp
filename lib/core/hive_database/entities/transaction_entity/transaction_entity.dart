import 'package:fima/core/ui_model/transaction_ui_model.dart';
import 'package:hive/hive.dart';
import '../base_entity.dart';
part 'transaction_entity.g.dart';

@HiveType(typeId: 1)
class TransactionEntity extends BaseEntity {
  @HiveField(1)
  String categoryId;
  @HiveField(2)
  DateTime createdAt;
  @HiveField(3)
  DateTime updatedAt;
  @HiveField(4)
  int amount;
  @HiveField(5)
  int type;
  @HiveField(6)
  String currencyId;
  @HiveField(7)
  String currencySymbol;
  @HiveField(8)
  String note;
  @HiveField(9)
  String bank;

  TransactionEntity({
    String id,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.amount,
    this.type,
    this.currencyId,
    this.currencySymbol,
    this.note,
    this.bank,
  }) : super(id: id);

  TransactionUIModel toUIModel() {
    return TransactionUIModel(
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
