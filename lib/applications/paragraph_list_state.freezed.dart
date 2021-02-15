// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'paragraph_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ParagraphsStateTearOff {
  const _$ParagraphsStateTearOff();

// ignore: unused_element
  ParagraphListStateData call({List<String> paragraphs = const []}) {
    return ParagraphListStateData(
      paragraphs: paragraphs,
    );
  }

// ignore: unused_element
  ParagraphListStateLoading loading() {
    return const ParagraphListStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $ParagraphsState = _$ParagraphsStateTearOff();

/// @nodoc
mixin _$ParagraphListState {
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(List<String> paragraphs), {
    @required TResult loading(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(List<String> paragraphs), {
    TResult loading(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(ParagraphListStateData value), {
    @required TResult loading(ParagraphListStateLoading value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(ParagraphListStateData value), {
    TResult loading(ParagraphListStateLoading value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ParagraphsStateCopyWith<$Res> {
  factory $ParagraphsStateCopyWith(
          ParagraphListState value, $Res Function(ParagraphListState) then) =
      _$ParagraphsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ParagraphsStateCopyWithImpl<$Res>
    implements $ParagraphsStateCopyWith<$Res> {
  _$ParagraphsStateCopyWithImpl(this._value, this._then);

  final ParagraphListState _value;
  // ignore: unused_field
  final $Res Function(ParagraphListState) _then;
}

/// @nodoc
abstract class $ParagraphsStateDataCopyWith<$Res> {
  factory $ParagraphsStateDataCopyWith(ParagraphListStateData value,
          $Res Function(ParagraphListStateData) then) =
      _$ParagraphsStateDataCopyWithImpl<$Res>;
  $Res call({List<String> paragraphs});
}

/// @nodoc
class _$ParagraphsStateDataCopyWithImpl<$Res>
    extends _$ParagraphsStateCopyWithImpl<$Res>
    implements $ParagraphsStateDataCopyWith<$Res> {
  _$ParagraphsStateDataCopyWithImpl(ParagraphListStateData _value,
      $Res Function(ParagraphListStateData) _then)
      : super(_value, (v) => _then(v as ParagraphListStateData));

  @override
  ParagraphListStateData get _value => super._value as ParagraphListStateData;

  @override
  $Res call({
    Object paragraphs = freezed,
  }) {
    return _then(ParagraphListStateData(
      paragraphs: paragraphs == freezed
          ? _value.paragraphs
          : paragraphs as List<String>,
    ));
  }
}

/// @nodoc
class _$ParagraphsStateData
    with DiagnosticableTreeMixin
    implements ParagraphListStateData {
  const _$ParagraphsStateData({this.paragraphs = const []})
      : assert(paragraphs != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<String> paragraphs;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ParagraphsState(paragraphs: $paragraphs)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ParagraphsState'))
      ..add(DiagnosticsProperty('paragraphs', paragraphs));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParagraphListStateData &&
            (identical(other.paragraphs, paragraphs) ||
                const DeepCollectionEquality()
                    .equals(other.paragraphs, paragraphs)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(paragraphs);

  @JsonKey(ignore: true)
  @override
  $ParagraphsStateDataCopyWith<ParagraphListStateData> get copyWith =>
      _$ParagraphsStateDataCopyWithImpl<ParagraphListStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(List<String> paragraphs), {
    @required TResult loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(paragraphs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(List<String> paragraphs), {
    TResult loading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(paragraphs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(ParagraphListStateData value), {
    @required TResult loading(ParagraphListStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(ParagraphListStateData value), {
    TResult loading(ParagraphListStateLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class ParagraphListStateData implements ParagraphListState {
  const factory ParagraphListStateData({List<String> paragraphs}) =
      _$ParagraphsStateData;

  List<String> get paragraphs;
  @JsonKey(ignore: true)
  $ParagraphsStateDataCopyWith<ParagraphListStateData> get copyWith;
}

/// @nodoc
abstract class $ParagraphsStateLoadingCopyWith<$Res> {
  factory $ParagraphsStateLoadingCopyWith(ParagraphListStateLoading value,
          $Res Function(ParagraphListStateLoading) then) =
      _$ParagraphsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ParagraphsStateLoadingCopyWithImpl<$Res>
    extends _$ParagraphsStateCopyWithImpl<$Res>
    implements $ParagraphsStateLoadingCopyWith<$Res> {
  _$ParagraphsStateLoadingCopyWithImpl(ParagraphListStateLoading _value,
      $Res Function(ParagraphListStateLoading) _then)
      : super(_value, (v) => _then(v as ParagraphListStateLoading));

  @override
  ParagraphListStateLoading get _value =>
      super._value as ParagraphListStateLoading;
}

/// @nodoc
class _$ParagraphsStateLoading
    with DiagnosticableTreeMixin
    implements ParagraphListStateLoading {
  const _$ParagraphsStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ParagraphsState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ParagraphsState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ParagraphListStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(List<String> paragraphs), {
    @required TResult loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(List<String> paragraphs), {
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
    TResult $default(ParagraphListStateData value), {
    @required TResult loading(ParagraphListStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(ParagraphListStateData value), {
    TResult loading(ParagraphListStateLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ParagraphListStateLoading implements ParagraphListState {
  const factory ParagraphListStateLoading() = _$ParagraphsStateLoading;
}
