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
  MemosStateData<M> call<M extends Memo>({List<M> memos = const []}) {
    return MemosStateData<M>(
      memos: memos,
    );
  }

// ignore: unused_element
  MemosStateLoading<M> loading<M extends Memo>() {
    return MemosStateLoading<M>();
  }
}

/// @nodoc
// ignore: unused_element
const $MemosState = _$MemosStateTearOff();

/// @nodoc
mixin _$MemosState<M extends Memo> {
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(List<M> memos), {
    @required TResult loading(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(List<M> memos), {
    TResult loading(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(MemosStateData<M> value), {
    @required TResult loading(MemosStateLoading<M> value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(MemosStateData<M> value), {
    TResult loading(MemosStateLoading<M> value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $MemosStateCopyWith<M extends Memo, $Res> {
  factory $MemosStateCopyWith(
          MemosState<M> value, $Res Function(MemosState<M>) then) =
      _$MemosStateCopyWithImpl<M, $Res>;
}

/// @nodoc
class _$MemosStateCopyWithImpl<M extends Memo, $Res>
    implements $MemosStateCopyWith<M, $Res> {
  _$MemosStateCopyWithImpl(this._value, this._then);

  final MemosState<M> _value;
  // ignore: unused_field
  final $Res Function(MemosState<M>) _then;
}

/// @nodoc
abstract class $MemosStateDataCopyWith<M extends Memo, $Res> {
  factory $MemosStateDataCopyWith(
          MemosStateData<M> value, $Res Function(MemosStateData<M>) then) =
      _$MemosStateDataCopyWithImpl<M, $Res>;
  $Res call({List<M> memos});
}

/// @nodoc
class _$MemosStateDataCopyWithImpl<M extends Memo, $Res>
    extends _$MemosStateCopyWithImpl<M, $Res>
    implements $MemosStateDataCopyWith<M, $Res> {
  _$MemosStateDataCopyWithImpl(
      MemosStateData<M> _value, $Res Function(MemosStateData<M>) _then)
      : super(_value, (v) => _then(v as MemosStateData<M>));

  @override
  MemosStateData<M> get _value => super._value as MemosStateData<M>;

  @override
  $Res call({
    Object memos = freezed,
  }) {
    return _then(MemosStateData<M>(
      memos: memos == freezed ? _value.memos : memos as List<M>,
    ));
  }
}

/// @nodoc
class _$MemosStateData<M extends Memo>
    with DiagnosticableTreeMixin
    implements MemosStateData<M> {
  const _$MemosStateData({this.memos = const []}) : assert(memos != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<M> memos;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MemosState<$M>(memos: $memos)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MemosState<$M>'))
      ..add(DiagnosticsProperty('memos', memos));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MemosStateData<M> &&
            (identical(other.memos, memos) ||
                const DeepCollectionEquality().equals(other.memos, memos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(memos);

  @JsonKey(ignore: true)
  @override
  $MemosStateDataCopyWith<M, MemosStateData<M>> get copyWith =>
      _$MemosStateDataCopyWithImpl<M, MemosStateData<M>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(List<M> memos), {
    @required TResult loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(memos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(List<M> memos), {
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
    TResult $default(MemosStateData<M> value), {
    @required TResult loading(MemosStateLoading<M> value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(MemosStateData<M> value), {
    TResult loading(MemosStateLoading<M> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class MemosStateData<M extends Memo> implements MemosState<M> {
  const factory MemosStateData({List<M> memos}) = _$MemosStateData<M>;

  List<M> get memos;
  @JsonKey(ignore: true)
  $MemosStateDataCopyWith<M, MemosStateData<M>> get copyWith;
}

/// @nodoc
abstract class $MemosStateLoadingCopyWith<M extends Memo, $Res> {
  factory $MemosStateLoadingCopyWith(MemosStateLoading<M> value,
          $Res Function(MemosStateLoading<M>) then) =
      _$MemosStateLoadingCopyWithImpl<M, $Res>;
}

/// @nodoc
class _$MemosStateLoadingCopyWithImpl<M extends Memo, $Res>
    extends _$MemosStateCopyWithImpl<M, $Res>
    implements $MemosStateLoadingCopyWith<M, $Res> {
  _$MemosStateLoadingCopyWithImpl(
      MemosStateLoading<M> _value, $Res Function(MemosStateLoading<M>) _then)
      : super(_value, (v) => _then(v as MemosStateLoading<M>));

  @override
  MemosStateLoading<M> get _value => super._value as MemosStateLoading<M>;
}

/// @nodoc
class _$MemosStateLoading<M extends Memo>
    with DiagnosticableTreeMixin
    implements MemosStateLoading<M> {
  const _$MemosStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MemosState<$M>.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MemosState<$M>.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is MemosStateLoading<M>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(List<M> memos), {
    @required TResult loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(List<M> memos), {
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
    TResult $default(MemosStateData<M> value), {
    @required TResult loading(MemosStateLoading<M> value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(MemosStateData<M> value), {
    TResult loading(MemosStateLoading<M> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MemosStateLoading<M extends Memo> implements MemosState<M> {
  const factory MemosStateLoading() = _$MemosStateLoading<M>;
}
