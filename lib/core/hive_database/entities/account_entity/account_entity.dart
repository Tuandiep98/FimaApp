import 'package:hive/hive.dart';
import '../base_entity.dart';
part 'account_entity.g.dart';

@HiveType(typeId: 5)
class AccountEntity extends BaseEntity {
  @HiveField(3)
  String username;
  @HiveField(4)
  String password;
  @HiveField(5)
  bool isGuest;
  @HiveField(6)
  String currencyId;
  @HiveField(7)
  String currencySymbol;
  @HiveField(8)
  String bio;

  AccountEntity({
    String id,
    DateTime createdAt,
    DateTime updatedAt,
    this.username,
    this.password,
    this.isGuest,
    this.currencyId,
    this.currencySymbol,
    this.bio,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
}
