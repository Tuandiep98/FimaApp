import 'package:fima/core/services/interfaces/icategory_service.dart';
import 'package:fima/core/ui_model/transaction_ui_model.dart';
import 'package:fima/core/utils/list_extension.dart';
import 'package:fima/global/locator.dart';
import 'package:hive/hive.dart';
import '../base_entity.dart';
part 'transaction_entity.g.dart';

@HiveType(typeId: 1)
class TransactionEntity extends BaseEntity {
  @HiveField(3)
  String categoryId;
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
  @HiveField(10)
  String creatorId;

  TransactionEntity({
    String id,
    DateTime createdAt,
    DateTime updatedAt,
    this.categoryId,
    this.amount,
    this.type,
    this.currencyId,
    this.currencySymbol,
    this.note,
    this.bank,
    this.creatorId,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  TransactionUIModel toUIModel() {
    var categoryName = locator<ICategoryService>()
        .getCategories()
        .firstOrDefault((x) => x.id == this.categoryId)
        ?.name;
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
      categoryName: categoryName,
    );
  }
}
