// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'edit_index_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$EditIndexStateTearOff {
  const _$EditIndexStateTearOff();

// ignore: unused_element
  EditIndexStateData call({int value = 0}) {
    return EditIndexStateData(
      value: value,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $EditIndexState = _$EditIndexStateTearOff();

/// @nodoc
mixin _$EditIndexState {
  int get value;

  @JsonKey(ignore: true)
  $EditIndexStateCopyWith<EditIndexState> get copyWith;
}

/// @nodoc
abstract class $EditIndexStateCopyWith<$Res> {
  factory $EditIndexStateCopyWith(
          EditIndexState value, $Res Function(EditIndexState) then) =
      _$EditIndexStateCopyWithImpl<$Res>;
  $Res call({int value});
}

/// @nodoc
class _$EditIndexStateCopyWithImpl<$Res>
    implements $EditIndexStateCopyWith<$Res> {
  _$EditIndexStateCopyWithImpl(this._value, this._then);

  final EditIndexState _value;
  // ignore: unused_field
  final $Res Function(EditIndexState) _then;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed ? _value.value : value as int,
    ));
  }
}

/// @nodoc
abstract class $EditIndexStateDataCopyWith<$Res>
    implements $EditIndexStateCopyWith<$Res> {
  factory $EditIndexStateDataCopyWith(
          EditIndexStateData value, $Res Function(EditIndexStateData) then) =
      _$EditIndexStateDataCopyWithImpl<$Res>;
  @override
  $Res call({int value});
}

/// @nodoc
class _$EditIndexStateDataCopyWithImpl<$Res>
    extends _$EditIndexStateCopyWithImpl<$Res>
    implements $EditIndexStateDataCopyWith<$Res> {
  _$EditIndexStateDataCopyWithImpl(
      EditIndexStateData _value, $Res Function(EditIndexStateData) _then)
      : super(_value, (v) => _then(v as EditIndexStateData));

  @override
  EditIndexStateData get _value => super._value as EditIndexStateData;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(EditIndexStateData(
      value: value == freezed ? _value.value : value as int,
    ));
  }
}

/// @nodoc
class _$EditIndexStateData implements EditIndexStateData {
  const _$EditIndexStateData({this.value = 0}) : assert(value != null);

  @JsonKey(defaultValue: 0)
  @override
  final int value;

  @override
  String toString() {
    return 'EditIndexState(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EditIndexStateData &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  $EditIndexStateDataCopyWith<EditIndexStateData> get copyWith =>
      _$EditIndexStateDataCopyWithImpl<EditIndexStateData>(this, _$identity);
}

abstract class EditIndexStateData implements EditIndexState {
  const factory EditIndexStateData({int value}) = _$EditIndexStateData;

  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  $EditIndexStateDataCopyWith<EditIndexStateData> get copyWith;
}
