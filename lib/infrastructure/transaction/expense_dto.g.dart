// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenseDtoAdapter extends TypeAdapter<_$_ExpenseDto> {
  @override
  final int typeId = 0;

  @override
  _$_ExpenseDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ExpenseDto(
      expenseName: fields[3] as String,
      category: fields[4] as int,
      amount: fields[0] as double,
      date: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ExpenseDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.expenseName)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
