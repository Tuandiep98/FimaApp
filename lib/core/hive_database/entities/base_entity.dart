import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class BaseEntity extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  DateTime createdAt;
  @HiveField(2)
  DateTime updatedAt;

  BaseEntity({this.id, this.createdAt, this.updatedAt}) {
    if (id == null) {
      id = Uuid().v4();
    }
    if (createdAt == null) {
      createdAt = DateTime.now();
    }
    if (updatedAt == null) {
      updatedAt = DateTime.now();
    }
  }
}
