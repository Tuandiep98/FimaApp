import 'package:fima/core/ui_model/category_ui_model.dart';
import 'package:hive/hive.dart';
import '../base_entity_with_image.dart';

part 'category_entity.g.dart';

@HiveType(typeId: 3)
class CategoryEntity extends BaseEntityWithImage {
  @HiveField(3)
  String name;
  @HiveField(4)
  int codePoint;
  @HiveField(5)
  String fontFamilly;

  CategoryEntity({
    String id,
    String image,
    String imageBase64,
    this.codePoint,
    this.fontFamilly,
    this.name,
  }) : super(
          id: id,
          image: image,
          imageBase64: imageBase64,
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
    );
  }
}
