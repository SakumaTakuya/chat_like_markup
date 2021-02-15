// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'memo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$MemoStateTearOff {
  const _$MemoStateTearOff();

// ignore: unused_element
  MemoStateData call({Memo memo}) {
    return MemoStateData(
      memo: memo,
    );
  }

// ignore: unused_element
  MemoStateLoading loading() {
    return const MemoStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $MemoState = _$MemoStateTearOff();

/// @nodoc
mixin _$MemoState {
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(Memo memo), {
    @required TResult loading(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(Memo memo), {
    TResult loading(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(MemoStateData value), {
    @required TResult loading(MemoStateLoading value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(MemoStateData value), {
    TResult loading(MemoStateLoading value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $MemoStateCopyWith<$Res> {
  factory $MemoStateCopyWith(MemoState value, $Res Function(MemoState) then) =
      _$MemoStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MemoStateCopyWithImpl<$Res> implements $MemoStateCopyWith<$Res> {
  _$MemoStateCopyWithImpl(this._value, this._then);

  final MemoState _value;
  // ignore: unused_field
  final $Res Function(MemoState) _then;
}

/// @nodoc
abstract class $MemoStateDataCopyWith<$Res> {
  factory $MemoStateDataCopyWith(
          MemoStateData value, $Res Function(MemoStateData) then) =
      _$MemoStateDataCopyWithImpl<$Res>;
  $Res call({Memo memo});
}

/// @nodoc
class _$MemoStateDataCopyWithImpl<$Res> extends _$MemoStateCopyWithImpl<$Res>
    implements $MemoStateDataCopyWith<$Res> {
  _$MemoStateDataCopyWithImpl(
      MemoStateData _value, $Res Function(MemoStateData) _then)
      : super(_value, (v) => _then(v as MemoStateData));

  @override
  MemoStateData get _value => super._value as MemoStateData;

  @override
  $Res call({
    Object memo = freezed,
  }) {
    return _then(MemoStateData(
      memo: memo == freezed ? _value.memo : memo as Memo,
    ));
  }
}

/// @nodoc
class _$MemoStateData with DiagnosticableTreeMixin implements MemoStateData {
  const _$MemoStateData({this.memo});

  @override
  final Memo memo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MemoState(memo: $memo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MemoState'))
      ..add(DiagnosticsProperty('memo', memo));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MemoStateData &&
            (identical(other.memo, memo) ||
                const DeepCollectionEquality().equals(other.memo, memo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(memo);

  @JsonKey(ignore: true)
  @override
  $MemoStateDataCopyWith<MemoStateData> get copyWith =>
      _$MemoStateDataCopyWithImpl<MemoStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(Memo memo), {
    @required TResult loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(memo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(Memo memo), {
    TResult loading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(memo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(MemoStateData value), {
    @required TResult loading(MemoStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(MemoStateData value), {
    TResult loading(MemoStateLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class MemoStateData implements MemoState {
  const factory MemoStateData({Memo memo}) = _$MemoStateData;

  Memo get memo;
  @JsonKey(ignore: true)
  $MemoStateDataCopyWith<MemoStateData> get copyWith;
}

/// @nodoc
abstract class $MemoStateLoadingCopyWith<$Res> {
  factory $MemoStateLoadingCopyWith(
          MemoStateLoading value, $Res Function(MemoStateLoading) then) =
      _$MemoStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$MemoStateLoadingCopyWithImpl<$Res> extends _$MemoStateCopyWithImpl<$Res>
    implements $MemoStateLoadingCopyWith<$Res> {
  _$MemoStateLoadingCopyWithImpl(
      MemoStateLoading _value, $Res Function(MemoStateLoading) _then)
      : super(_value, (v) => _then(v as MemoStateLoading));

  @override
  MemoStateLoading get _value => super._value as MemoStateLoading;
}

/// @nodoc
class _$MemoStateLoading
    with DiagnosticableTreeMixin
    implements MemoStateLoading {
  const _$MemoStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MemoState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MemoState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is MemoStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(Memo memo), {
    @required TResult loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(Memo memo), {
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
    TResult $default(MemoStateData value), {
    @required TResult loading(MemoStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(MemoStateData value), {
    TResult loading(MemoStateLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MemoStateLoading implements MemoState {
  const factory MemoStateLoading() = _$MemoStateLoading;
}
