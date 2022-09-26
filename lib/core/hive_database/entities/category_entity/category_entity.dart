import 'package:fima/core/ui_model/category_ui_model.dart';
import 'package:hive/hive.dart';
import '../base_entity_with_image.dart';

part 'category_entity.g.dart';

@HiveType(typeId: 3)
class CategoryEntity extends BaseEntityWithImage {
  @HiveField(5)
  String name;
  @HiveField(6)
  int codePoint;
  @HiveField(7)
  String fontFamilly;
  @HiveField(8)
  String emoji;
  @HiveField(9)
  String emojiCategory;

  CategoryEntity({
    String id,
    String image,
    String imageBase64,
    DateTime createdAt,
    DateTime updatedAt,
    this.codePoint,
    this.fontFamilly,
    this.name,
    this.emoji,
    this.emojiCategory,
  }) : super(
          id: id,
          image: image,
          imageBase64: imageBase64,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  CategoryUIModel toUIModel() {
    return CategoryUIModel(
      id: this.id,
      codePoint: this.codePoint,
      fontFamilly: this.fontFamilly,
      image: this.image,
      imageBase64: this.imageBase64,
      name: this.name,
      targetOfMonth: 0,
      totalAmount: 0,
      totalAllMonth: 0,
      percent: 0,
      emoji: this.emoji,
      emojiCategory: this.emojiCategory,
    );
  }
}
