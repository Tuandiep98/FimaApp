// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyEntityAdapter extends TypeAdapter<CurrencyEntity> {
  @override
  final int typeId = 29;

  @override
  CurrencyEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyEntity(
      id: fields[0] as String,
      image: fields[1] as String,
      imageBase64: fields[2] as String,
      acceptCredit: fields[8] as bool,
      baseCurrency: fields[9] as bool,
      availableOnline: fields[6] as bool,
      displayOnDevice: fields[7] as bool,
      code: fields[4] as String,
      name: fields[3] as String,
      symbol: fields[10] as String,
      top: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencyEntity obj) {
    writer
      ..writeByte(11)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.code)
      ..writeByte(5)
      ..write(obj.top)
      ..writeByte(6)
      ..write(obj.availableOnline)
      ..writeByte(7)
      ..write(obj.displayOnDevice)
      ..writeByte(8)
      ..write(obj.acceptCredit)
      ..writeByte(9)
      ..write(obj.baseCurrency)
      ..writeByte(10)
      ..write(obj.symbol)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.imageBase64)
      ..writeByte(0)
      ..write(obj.id);
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
