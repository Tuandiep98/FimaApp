// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryEntityAdapter extends TypeAdapter<CategoryEntity> {
  @override
  final int typeId = 3;

  @override
  CategoryEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryEntity(
      id: fields[0] as String,
      image: fields[1] as String,
      imageBase64: fields[2] as String,
      codePoint: fields[4] as int,
      fontFamilly: fields[5] as String,
      name: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.codePoint)
      ..writeByte(5)
      ..write(obj.fontFamilly)
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
      other is CategoryEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
