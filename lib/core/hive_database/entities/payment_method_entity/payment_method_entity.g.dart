// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaymentMethodEntityAdapter extends TypeAdapter<PaymentMethodEntity> {
  @override
  final int typeId = 4;

  @override
  PaymentMethodEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaymentMethodEntity(
      id: fields[0] as String,
      image: fields[3] as String,
      imageBase64: fields[4] as String,
      createdAt: fields[1] as DateTime,
      updatedAt: fields[2] as DateTime,
      codePoint: fields[6] as int,
      fontFamily: fields[7] as String,
      name: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PaymentMethodEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.codePoint)
      ..writeByte(7)
      ..write(obj.fontFamily)
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
      other is PaymentMethodEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
