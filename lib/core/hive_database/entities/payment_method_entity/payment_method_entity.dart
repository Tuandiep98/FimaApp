import 'package:fima/core/ui_model/payment_method_ui_model.dart';
import 'package:hive/hive.dart';
import '../base_entity_with_image.dart';

part 'payment_method_entity.g.dart';

@HiveType(typeId: 4)
class PaymentMethodEntity extends BaseEntityWithImage {
  @HiveField(5)
  String name;
  @HiveField(6)
  int codePoint;
  @HiveField(7)
  String fontFamily;

  PaymentMethodEntity({
    String id,
    String image,
    String imageBase64,
    DateTime createdAt,
    DateTime updatedAt,
    this.codePoint,
    this.fontFamily,
    this.name,
  }) : super(
          id: id,
          image: image,
          imageBase64: imageBase64,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  PaymentMethodUIModel toUIModel() {
    return PaymentMethodUIModel(
      codePoint: this.codePoint,
      image: this.image,
      imageBase64: this.imageBase64,
      name: this.name,
    );
  }
}
