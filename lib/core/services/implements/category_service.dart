import 'package:fima/core/hive_database/daos/category_dao.dart';
import 'package:fima/core/hive_database/entities/category_entity/category_entity.dart';
import 'package:fima/core/services/interfaces/icategory_service.dart';
import 'package:fima/global/locator.dart';

class CategoryService implements ICategoryService {
  var _dao = locator<CategoryDao>();

  @override
  List<CategoryEntity> getCategories() {
    return _dao.getAll();
  }

  @override
  Future<void> insertAll(List<CategoryEntity> currencies) async {
    await _dao.insertAll(currencies);
  }

  @override
  Future<void> clearAll() async {
    await _dao.clear();
  }
}
