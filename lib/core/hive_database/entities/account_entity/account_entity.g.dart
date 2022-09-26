// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountEntityAdapter extends TypeAdapter<AccountEntity> {
  @override
  final int typeId = 5;

  @override
  AccountEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountEntity(
      id: fields[0] as String,
      createdAt: fields[1] as DateTime,
      updatedAt: fields[2] as DateTime,
      username: fields[3] as String,
      password: fields[4] as String,
      isGuest: fields[5] as bool,
      currencyId: fields[6] as String,
      currencySymbol: fields[7] as String,
      bio: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AccountEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.isGuest)
      ..writeByte(6)
      ..write(obj.currencyId)
      ..writeByte(7)
      ..write(obj.currencySymbol)
      ..writeByte(8)
      ..write(obj.bio)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
