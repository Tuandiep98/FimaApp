import 'package:fima/core/hive_database/entities/category_entity/category_entity.dart';

abstract class ICategoryService {
  List<CategoryEntity> getCategories();
  Future<void> insertAll(List<CategoryEntity> currencies);
  Future<void> clearAll();
  Future<void> deleteById(String id);
}
