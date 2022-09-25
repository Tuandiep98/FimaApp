// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyEntityAdapter extends TypeAdapter<CurrencyEntity> {
  @override
  final int typeId = 2;

  @override
  CurrencyEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyEntity(
      id: fields[0] as String,
      image: fields[3] as String,
      imageBase64: fields[4] as String,
      createdAt: fields[1] as DateTime,
      updatedAt: fields[2] as DateTime,
      acceptCredit: fields[10] as bool,
      baseCurrency: fields[11] as bool,
      availableOnline: fields[8] as bool,
      displayOnDevice: fields[9] as bool,
      code: fields[6] as String,
      name: fields[5] as String,
      symbol: fields[12] as String,
      top: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencyEntity obj) {
    writer
      ..writeByte(13)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.code)
      ..writeByte(7)
      ..write(obj.top)
      ..writeByte(8)
      ..write(obj.availableOnline)
      ..writeByte(9)
      ..write(obj.displayOnDevice)
      ..writeByte(10)
      ..write(obj.acceptCredit)
      ..writeByte(11)
      ..write(obj.baseCurrency)
      ..writeByte(12)
      ..write(obj.symbol)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.imageBase64)
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
      other is CurrencyEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
