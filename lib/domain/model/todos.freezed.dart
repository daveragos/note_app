// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Todos _$TodosFromJson(Map<String, dynamic> json) {
  return _Todos.fromJson(json);
}

/// @nodoc
mixin _$Todos {
  List<Todo> get values => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodosCopyWith<Todos> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodosCopyWith<$Res> {
  factory $TodosCopyWith(Todos value, $Res Function(Todos) then) =
      _$TodosCopyWithImpl<$Res, Todos>;
  @useResult
  $Res call({List<Todo> values});
}

/// @nodoc
class _$TodosCopyWithImpl<$Res, $Val extends Todos>
    implements $TodosCopyWith<$Res> {
  _$TodosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
  }) {
    return _then(_value.copyWith(
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodosImplCopyWith<$Res> implements $TodosCopyWith<$Res> {
  factory _$$TodosImplCopyWith(
          _$TodosImpl value, $Res Function(_$TodosImpl) then) =
      __$$TodosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Todo> values});
}

/// @nodoc
class __$$TodosImplCopyWithImpl<$Res>
    extends _$TodosCopyWithImpl<$Res, _$TodosImpl>
    implements _$$TodosImplCopyWith<$Res> {
  __$$TodosImplCopyWithImpl(
      _$TodosImpl _value, $Res Function(_$TodosImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
  }) {
    return _then(_$TodosImpl(
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodosImpl with DiagnosticableTreeMixin implements _Todos {
  const _$TodosImpl({final List<Todo> values = const []}) : _values = values;

  factory _$TodosImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodosImplFromJson(json);

  final List<Todo> _values;
  @override
  @JsonKey()
  List<Todo> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Todos(values: $values)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Todos'))
      ..add(DiagnosticsProperty('values', values));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodosImpl &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodosImplCopyWith<_$TodosImpl> get copyWith =>
      __$$TodosImplCopyWithImpl<_$TodosImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodosImplToJson(
      this,
    );
  }
}

abstract class _Todos implements Todos {
  const factory _Todos({final List<Todo> values}) = _$TodosImpl;

  factory _Todos.fromJson(Map<String, dynamic> json) = _$TodosImpl.fromJson;

  @override
  List<Todo> get values;
  @override
  @JsonKey(ignore: true)
  _$$TodosImplCopyWith<_$TodosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
