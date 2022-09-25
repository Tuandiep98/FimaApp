import 'package:hive/hive.dart';

import 'base_entity.dart';

class BaseEntityWithImage extends BaseEntity {
  @HiveField(3)
  String image;
  @HiveField(4)
  String imageBase64;

  BaseEntityWithImage(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      this.image,
      this.imageBase64})
      : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
}
