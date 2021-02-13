// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'memo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$MemosStateTearOff {
  const _$MemosStateTearOff();

// ignore: unused_element
  MemosStateData call({List<Memo> memos = const []}) {
    return MemosStateData(
      memos: memos,
    );
  }

// ignore: unused_element
  MemosStateLoading loading() {
    return const MemosStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $MemosState = _$MemosStateTearOff();

/// @nodoc
mixin _$MemosState {
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(List<Memo> memos), {
    @required TResult loading(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(List<Memo> memos), {
    TResult loading(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(MemosStateData value), {
    @required TResult loading(MemosStateLoading value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(MemosStateData value), {
    TResult loading(MemosStateLoading value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $MemosStateCopyWith<$Res> {
  factory $MemosStateCopyWith(
          MemosState value, $Res Function(MemosState) then) =
      _$MemosStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MemosStateCopyWithImpl<$Res> implements $MemosStateCopyWith<$Res> {
  _$MemosStateCopyWithImpl(this._value, this._then);

  final MemosState _value;
  // ignore: unused_field
  final $Res Function(MemosState) _then;
}

/// @nodoc
abstract class $MemosStateDataCopyWith<$Res> {
  factory $MemosStateDataCopyWith(
          MemosStateData value, $Res Function(MemosStateData) then) =
      _$MemosStateDataCopyWithImpl<$Res>;
  $Res call({List<Memo> memos});
}

/// @nodoc
class _$MemosStateDataCopyWithImpl<$Res> extends _$MemosStateCopyWithImpl<$Res>
    implements $MemosStateDataCopyWith<$Res> {
  _$MemosStateDataCopyWithImpl(
      MemosStateData _value, $Res Function(MemosStateData) _then)
      : super(_value, (v) => _then(v as MemosStateData));

  @override
  MemosStateData get _value => super._value as MemosStateData;

  @override
  $Res call({
    Object memos = freezed,
  }) {
    return _then(MemosStateData(
      memos: memos == freezed ? _value.memos : memos as List<Memo>,
    ));
  }
}

/// @nodoc
class _$MemosStateData with DiagnosticableTreeMixin implements MemosStateData {
  const _$MemosStateData({this.memos = const []}) : assert(memos != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<Memo> memos;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MemosState(memos: $memos)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MemosState'))
      ..add(DiagnosticsProperty('memos', memos));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MemosStateData &&
            (identical(other.memos, memos) ||
                const DeepCollectionEquality().equals(other.memos, memos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(memos);

  @JsonKey(ignore: true)
  @override
  $MemosStateDataCopyWith<MemosStateData> get copyWith =>
      _$MemosStateDataCopyWithImpl<MemosStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(List<Memo> memos), {
    @required TResult loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(memos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(List<Memo> memos), {
    TResult loading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(memos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(MemosStateData value), {
    @required TResult loading(MemosStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(MemosStateData value), {
    TResult loading(MemosStateLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class MemosStateData implements MemosState {
  const factory MemosStateData({List<Memo> memos}) = _$MemosStateData;

  List<Memo> get memos;
  @JsonKey(ignore: true)
  $MemosStateDataCopyWith<MemosStateData> get copyWith;
}

/// @nodoc
abstract class $MemosStateLoadingCopyWith<$Res> {
  factory $MemosStateLoadingCopyWith(
          MemosStateLoading value, $Res Function(MemosStateLoading) then) =
      _$MemosStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$MemosStateLoadingCopyWithImpl<$Res>
    extends _$MemosStateCopyWithImpl<$Res>
    implements $MemosStateLoadingCopyWith<$Res> {
  _$MemosStateLoadingCopyWithImpl(
      MemosStateLoading _value, $Res Function(MemosStateLoading) _then)
      : super(_value, (v) => _then(v as MemosStateLoading));

  @override
  MemosStateLoading get _value => super._value as MemosStateLoading;
}

/// @nodoc
class _$MemosStateLoading
    with DiagnosticableTreeMixin
    implements MemosStateLoading {
  const _$MemosStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MemosState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MemosState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is MemosStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(List<Memo> memos), {
    @required TResult loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(List<Memo> memos), {
    TResult loading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(MemosStateData value), {
    @required TResult loading(MemosStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(MemosStateData value), {
    TResult loading(MemosStateLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MemosStateLoading implements MemosState {
  const factory MemosStateLoading() = _$MemosStateLoading;
}
