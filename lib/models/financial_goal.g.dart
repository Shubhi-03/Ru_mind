// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_goal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FinancialGoalAdapter extends TypeAdapter<FinancialGoal> {
  @override
  final int typeId = 0;

  @override
  FinancialGoal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FinancialGoal(
      title: fields[0] as String,
      targetAmount: fields[1] as double,
      userId: fields[4] as String,
      createdAt: fields[5] as DateTime,
      savedAmount: fields[2] as double,
      completed: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, FinancialGoal obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.targetAmount)
      ..writeByte(2)
      ..write(obj.savedAmount)
      ..writeByte(3)
      ..write(obj.completed)
      ..writeByte(4)
      ..write(obj.userId)
      ..writeByte(5)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinancialGoalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
