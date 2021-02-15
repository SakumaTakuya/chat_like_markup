// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'memo_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$MemoListStateTearOff {
  const _$MemoListStateTearOff();

// ignore: unused_element
  MemoListStateData call({List<Memo> memos = const []}) {
    return MemoListStateData(
      memos: memos,
    );
  }

// ignore: unused_element
  MemoListStateLoading loading() {
    return const MemoListStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $MemoListState = _$MemoListStateTearOff();

/// @nodoc
mixin _$MemoListState {
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
    TResult $default(MemoListStateData value), {
    @required TResult loading(MemoListStateLoading value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(MemoListStateData value), {
    TResult loading(MemoListStateLoading value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $MemoListStateCopyWith<$Res> {
  factory $MemoListStateCopyWith(
          MemoListState value, $Res Function(MemoListState) then) =
      _$MemoListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MemoListStateCopyWithImpl<$Res>
    implements $MemoListStateCopyWith<$Res> {
  _$MemoListStateCopyWithImpl(this._value, this._then);

  final MemoListState _value;
  // ignore: unused_field
  final $Res Function(MemoListState) _then;
}

/// @nodoc
abstract class $MemoListStateDataCopyWith<$Res> {
  factory $MemoListStateDataCopyWith(
          MemoListStateData value, $Res Function(MemoListStateData) then) =
      _$MemoListStateDataCopyWithImpl<$Res>;
  $Res call({List<Memo> memos});
}

/// @nodoc
class _$MemoListStateDataCopyWithImpl<$Res>
    extends _$MemoListStateCopyWithImpl<$Res>
    implements $MemoListStateDataCopyWith<$Res> {
  _$MemoListStateDataCopyWithImpl(
      MemoListStateData _value, $Res Function(MemoListStateData) _then)
      : super(_value, (v) => _then(v as MemoListStateData));

  @override
  MemoListStateData get _value => super._value as MemoListStateData;

  @override
  $Res call({
    Object memos = freezed,
  }) {
    return _then(MemoListStateData(
      memos: memos == freezed ? _value.memos : memos as List<Memo>,
    ));
  }
}

/// @nodoc
class _$MemoListStateData
    with DiagnosticableTreeMixin
    implements MemoListStateData {
  const _$MemoListStateData({this.memos = const []}) : assert(memos != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<Memo> memos;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MemoListState(memos: $memos)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MemoListState'))
      ..add(DiagnosticsProperty('memos', memos));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MemoListStateData &&
            (identical(other.memos, memos) ||
                const DeepCollectionEquality().equals(other.memos, memos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(memos);

  @JsonKey(ignore: true)
  @override
  $MemoListStateDataCopyWith<MemoListStateData> get copyWith =>
      _$MemoListStateDataCopyWithImpl<MemoListStateData>(this, _$identity);

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
    TResult $default(MemoListStateData value), {
    @required TResult loading(MemoListStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(MemoListStateData value), {
    TResult loading(MemoListStateLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class MemoListStateData implements MemoListState {
  const factory MemoListStateData({List<Memo> memos}) = _$MemoListStateData;

  List<Memo> get memos;
  @JsonKey(ignore: true)
  $MemoListStateDataCopyWith<MemoListStateData> get copyWith;
}

/// @nodoc
abstract class $MemoListStateLoadingCopyWith<$Res> {
  factory $MemoListStateLoadingCopyWith(MemoListStateLoading value,
          $Res Function(MemoListStateLoading) then) =
      _$MemoListStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$MemoListStateLoadingCopyWithImpl<$Res>
    extends _$MemoListStateCopyWithImpl<$Res>
    implements $MemoListStateLoadingCopyWith<$Res> {
  _$MemoListStateLoadingCopyWithImpl(
      MemoListStateLoading _value, $Res Function(MemoListStateLoading) _then)
      : super(_value, (v) => _then(v as MemoListStateLoading));

  @override
  MemoListStateLoading get _value => super._value as MemoListStateLoading;
}

/// @nodoc
class _$MemoListStateLoading
    with DiagnosticableTreeMixin
    implements MemoListStateLoading {
  const _$MemoListStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MemoListState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MemoListState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is MemoListStateLoading);
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
    TResult $default(MemoListStateData value), {
    @required TResult loading(MemoListStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(MemoListStateData value), {
    TResult loading(MemoListStateLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MemoListStateLoading implements MemoListState {
  const factory MemoListStateLoading() = _$MemoListStateLoading;
}
