// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeedItemAdapter extends TypeAdapter<FeedItem> {
  @override
  final int typeId = 1;

  @override
  FeedItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeedItem(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
      fields[3] as String,
      fields[4] as int,
      fields[5] as String,
      fields[6] as int,
      fields[7] as ItemType,
      fields[8] as String,
      fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FeedItem obj) {
    writer
      ..writeByte(10)
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
      ..write(obj.commentsCount)
      ..writeByte(7)
      ..write(obj.type)
      ..writeByte(8)
      ..write(obj.url)
      ..writeByte(9)
      ..write(obj.domain);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedItem _$FeedItemFromJson(Map<String, dynamic> json) {
  return FeedItem(
    json['id'] as int,
    json['title'] as String,
    json['points'] as int,
    json['user'] as String,
    json['time'] as int,
    json['time_ago'] as String,
    json['comments_count'] as int,
    _$enumDecodeNullable(_$ItemTypeEnumMap, json['type']),
    json['url'] as String,
    json['domain'] as String,
  );
}

Map<String, dynamic> _$FeedItemToJson(FeedItem instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'points': instance.points,
      'user': instance.user,
      'time': instance.time,
      'time_ago': instance.timeAgo,
      'comments_count': instance.commentsCount,
      'type': _$ItemTypeEnumMap[instance.type],
      'url': instance.url,
      'domain': instance.domain,
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
