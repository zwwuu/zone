// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as int,
      deleted: json['deleted'] as bool? ?? false,
      type: $enumDecode(_$ItemTypeEnumMap, json['type']),
      by: json['by'] as String? ?? '',
      time: json['time'] as int?,
      text: json['text'] as String? ?? '',
      dead: json['dead'] as bool? ?? false,
      parent: json['parent'] as int?,
      poll: json['poll'] as int?,
      kids: (json['kids'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          const [],
      url: json['url'] as String?,
      score: json['score'] as int?,
      title: json['title'] as String? ?? '',
      parts: (json['parts'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          const [],
      descendants: json['descendants'] as int? ?? 0,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'deleted': instance.deleted,
      'type': _$ItemTypeEnumMap[instance.type]!,
      'by': instance.by,
      'time': instance.time,
      'text': instance.text,
      'dead': instance.dead,
      'parent': instance.parent,
      'poll': instance.poll,
      'kids': instance.kids,
      'url': instance.url,
      'score': instance.score,
      'title': instance.title,
      'parts': instance.parts,
      'descendants': instance.descendants,
    };

const _$ItemTypeEnumMap = {
  ItemType.job: 'job',
  ItemType.story: 'story',
  ItemType.comment: 'comment',
  ItemType.poll: 'poll',
  ItemType.pollopt: 'pollopt',
};
