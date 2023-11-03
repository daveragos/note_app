// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodosImpl _$$TodosImplFromJson(Map<String, dynamic> json) => _$TodosImpl(
      values: (json['values'] as List<dynamic>?)
              ?.map((e) => Todo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TodosImplToJson(_$TodosImpl instance) =>
    <String, dynamic>{
      'values': instance.values,
    };
