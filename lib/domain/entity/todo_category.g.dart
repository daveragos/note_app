// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskCategoryAdapter extends TypeAdapter<TaskCategory> {
  @override
  final int typeId = 1;

  @override
  TaskCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskCategory.education;
      case 1:
        return TaskCategory.health;
      case 2:
        return TaskCategory.home;
      case 3:
        return TaskCategory.others;
      case 4:
        return TaskCategory.personal;
      case 5:
        return TaskCategory.shopping;
      case 6:
        return TaskCategory.social;
      case 7:
        return TaskCategory.travel;
      case 8:
        return TaskCategory.work;
      default:
        return TaskCategory.education;
    }
  }

  @override
  void write(BinaryWriter writer, TaskCategory obj) {
    switch (obj) {
      case TaskCategory.education:
        writer.writeByte(0);
        break;
      case TaskCategory.health:
        writer.writeByte(1);
        break;
      case TaskCategory.home:
        writer.writeByte(2);
        break;
      case TaskCategory.others:
        writer.writeByte(3);
        break;
      case TaskCategory.personal:
        writer.writeByte(4);
        break;
      case TaskCategory.shopping:
        writer.writeByte(5);
        break;
      case TaskCategory.social:
        writer.writeByte(6);
        break;
      case TaskCategory.travel:
        writer.writeByte(7);
        break;
      case TaskCategory.work:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
