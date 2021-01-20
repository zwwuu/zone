// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemAdapter extends TypeAdapter<Item> {
  @override
  final int typeId = 2;

  @override
  Item read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Item(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
      fields[3] as String,
      fields[4] as int,
      fields[5] as String,
      fields[6] as ItemType,
      (fields[10] as List)?.cast<Item>(),
      fields[11] as int,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.points)
      ..writeByte(3)
      ..write(obj.user)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.timeAgo)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.url)
      ..writeByte(8)
      ..write(obj.domain)
      ..writeByte(9)
      ..write(obj.content)
      ..writeByte(10)
      ..write(obj.comments)
      ..writeByte(11)
      ..write(obj.commentsCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    json['id'] as int,
    json['title'] as String,
    json['points'] as int,
    json['user'] as String,
    json['time'] as int,
    json['time_ago'] as String,
    _$enumDecodeNullable(_$ItemTypeEnumMap, json['type']),
    (json['comments'] as List)
        ?.map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['comments_count'] as int,
    json['url'] as String,
    json['domain'] as String,
    json['content'] as String,
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'points': instance.points,
      'user': instance.user,
      'time': instance.time,
      'time_ago': instance.timeAgo,
      'type': _$ItemTypeEnumMap[instance.type],
      'url': instance.url,
      'domain': instance.domain,
      'content': instance.content,
      'comments': instance.comments?.map((e) => e?.toJson())?.toList(),
      'comments_count': instance.commentsCount,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ItemTypeEnumMap = {
  ItemType.job: 'job',
  ItemType.ask: 'ask',
  ItemType.comment: 'comment',
  ItemType.story: 'story',
  ItemType.poll: 'poll',
  ItemType.pollopt: 'pollopt',
  ItemType.link: 'link',
};
