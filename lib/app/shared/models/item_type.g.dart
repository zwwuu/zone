// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemTypeAdapter extends TypeAdapter<ItemType> {
  @override
  final int typeId = 0;

  @override
  ItemType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ItemType.job;
      case 1:
        return ItemType.ask;
      case 2:
        return ItemType.comment;
      case 3:
        return ItemType.story;
      case 4:
        return ItemType.poll;
      case 5:
        return ItemType.pollopt;
      case 6:
        return ItemType.link;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, ItemType obj) {
    switch (obj) {
      case ItemType.job:
        writer.writeByte(0);
        break;
      case ItemType.ask:
        writer.writeByte(1);
        break;
      case ItemType.comment:
        writer.writeByte(2);
        break;
      case ItemType.story:
        writer.writeByte(3);
        break;
      case ItemType.poll:
        writer.writeByte(4);
        break;
      case ItemType.pollopt:
        writer.writeByte(5);
        break;
      case ItemType.link:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
