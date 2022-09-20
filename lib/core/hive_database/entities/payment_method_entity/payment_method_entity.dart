import 'package:fima/core/ui_model/payment_method_ui_model.dart';
import 'package:hive/hive.dart';
import '../base_entity_with_image.dart';

part 'payment_method_entity.g.dart';

@HiveType(typeId: 4)
class PaymentMethodEntity extends BaseEntityWithImage {
  @HiveField(3)
  String name;
  @HiveField(4)
  String code;

  PaymentMethodEntity({
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

  PaymentMethodUIModel toUIModel() {
    return PaymentMethodUIModel(
      code: this.code,
      image: this.image,
      imageBase64: this.imageBase64,
      name: this.name,
    );
  }
}
