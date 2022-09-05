import 'package:hive/hive.dart';
import '../base_entity_with_image.dart';

part 'currency_entity.g.dart';

@HiveType(typeId: 29)
class CurrencyEntity extends BaseEntityWithImage {
  @HiveField(3)
  String name;
  @HiveField(4)
  String code;
  @HiveField(5)
  int top;
  @HiveField(6)
  bool availableOnline;
  @HiveField(7)
  bool displayOnDevice;
  @HiveField(8)
  bool acceptCredit;
  @HiveField(9)
  bool baseCurrency;
  @HiveField(10)
  String symbol;

  CurrencyEntity({
    String id,
    String image,
    String imageBase64,
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
        );
}
