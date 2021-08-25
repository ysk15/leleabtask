// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empresmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmpResModelAdapter extends TypeAdapter<EmpResModel> {
  @override
  final int typeId = 1;

  @override
  EmpResModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmpResModel()
      .._id = fields[0] as int?
      .._name = fields[1] as String?
      .._username = fields[2] as String?
      .._email = fields[3] as String?
      .._phone = fields[4] as String?
      .._website = fields[5] as String?
      .._companyString = fields[6] as String?
      .._addressString = fields[7] as String?;
  }

  @override
  void write(BinaryWriter writer, EmpResModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._name)
      ..writeByte(2)
      ..write(obj._username)
      ..writeByte(3)
      ..write(obj._email)
      ..writeByte(4)
      ..write(obj._phone)
      ..writeByte(5)
      ..write(obj._website)
      ..writeByte(6)
      ..write(obj._companyString)
      ..writeByte(7)
      ..write(obj._addressString);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmpResModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
