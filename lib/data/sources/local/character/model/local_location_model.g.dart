// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_location_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalLocationModelAdapter extends TypeAdapter<LocalLocationModel> {
  @override
  final int typeId = 2;

  @override
  LocalLocationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalLocationModel(
      name: fields[0] as String?,
      url: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalLocationModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalLocationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
