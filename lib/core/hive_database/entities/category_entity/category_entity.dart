import 'package:fima/core/services/interfaces/itransaction_service.dart';
import 'package:fima/core/ui_model/category_ui_model.dart';
import 'package:fima/global/locator.dart';
import 'package:hive/hive.dart';
import '../base_entity_with_image.dart';

part 'category_entity.g.dart';

@HiveType(typeId: 3)
class CategoryEntity extends BaseEntityWithImage {
  @HiveField(3)
  String name;
  @HiveField(4)
  String code;

  CategoryEntity({
    String id,
    String image,
    String imageBase64,
    this.code,
    this.name,
  }) : super(
          id: id,
          image: image,
          imageBase64: imageBase64,
        );

  CategoryUIModel toUIModel() {
    var transactions = locator<ITransactionService>().getTransactions();
    var totalAmount = 0;
    var totalAllMonth = 0;
    if (transactions.length > 0) {
      var transactionOfCurrentMonth = transactions
          .where((x) => this.name == 'Others'
              ? (x.categoryId == '')
              : (x.categoryId == this.id &&
                  x.createdAt.month == DateTime.now().month &&
                  x.createdAt.year == DateTime.now().year))
          .toList();
      for (var transaction in transactionOfCurrentMonth) {
        totalAllMonth += transaction.amount;
        if (transaction.type == 0)
          totalAmount += transaction.amount;
        else
          totalAmount -= transaction.amount;
      }
    }
    return CategoryUIModel(
      code: this.code,
      image: this.image,
      imageBase64: this.imageBase64,
      name: this.name,
      targetOfMonth: 0,
      totalAmount: totalAmount,
      totalAllMonth: totalAllMonth,
      percent: totalAmount / totalAllMonth * 100,
    );
  }
}
