// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoImpl _$$TodoImplFromJson(Map<String, dynamic> json) => _$TodoImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      time: json['time'] as String,
      date: json['date'] as String,
      category: $enumDecode(_$TaskCategoryEnumMap, json['category']),
      completed: json['completed'] as bool? ?? false,
    );

Map<String, dynamic> _$$TodoImplToJson(_$TodoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'time': instance.time,
      'date': instance.date,
      'category': _$TaskCategoryEnumMap[instance.category]!,
      'completed': instance.completed,
    };

const _$TaskCategoryEnumMap = {
  TaskCategory.education: 'education',
  TaskCategory.health: 'health',
  TaskCategory.home: 'home',
  TaskCategory.others: 'others',
  TaskCategory.personal: 'personal',
  TaskCategory.shopping: 'shopping',
  TaskCategory.social: 'social',
  TaskCategory.travel: 'travel',
  TaskCategory.work: 'work',
};
