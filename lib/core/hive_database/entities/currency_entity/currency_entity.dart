import 'package:hive/hive.dart';
import '../base_entity_with_image.dart';

part 'currency_entity.g.dart';

@HiveType(typeId: 2)
class CurrencyEntity extends BaseEntityWithImage {
  @HiveField(5)
  String name;
  @HiveField(6)
  String code;
  @HiveField(7)
  int top;
  @HiveField(8)
  bool availableOnline;
  @HiveField(9)
  bool displayOnDevice;
  @HiveField(10)
  bool acceptCredit;
  @HiveField(11)
  bool baseCurrency;
  @HiveField(12)
  String symbol;

  CurrencyEntity({
    String id,
    String image,
    String imageBase64,
    DateTime createdAt,
    DateTime updatedAt,
    this.acceptCredit,
    this.baseCurrency,
    this.availableOnline,
    this.displayOnDevice,
    this.code,
    this.name,
    this.symbol,
    this.top,
  }) : super(
          id: id,
          image: image,
          imageBase64: imageBase64,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
}
