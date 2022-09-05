import 'package:hive/hive.dart';

import 'base_entity.dart';

class BaseEntityWithImage extends BaseEntity {
  @HiveField(1)
  String image;
  @HiveField(2)
  String imageBase64;

  BaseEntityWithImage({String id, this.image, this.imageBase64})
      : super(id: id);
}
