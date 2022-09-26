import 'package:fima/core/hive_database/entities/category_entity/category_entity.dart';

class CategoryUIModel {
  String id;
  String name;
  int codePoint;
  String image;
  String imageBase64;
  double totalAmount;
  double targetOfMonth;
  double totalAllMonth;
  double percent;
  String fontFamilly;
  String emoji;
  String emojiCategory;

  CategoryUIModel({
    this.id,
    this.name,
    this.codePoint,
    this.image,
    this.imageBase64,
    this.totalAmount = 0,
    this.targetOfMonth = 0,
    this.totalAllMonth = 0,
    this.percent = 0,
    this.fontFamilly = 'CupertinoIcons',
    this.emoji = '',
    this.emojiCategory,
  });

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: this.id,
      codePoint: this.codePoint,
      fontFamilly: this.fontFamilly,
      image: this.image,
      imageBase64: this.imageBase64,
      name: this.name,
    );
  }
}
