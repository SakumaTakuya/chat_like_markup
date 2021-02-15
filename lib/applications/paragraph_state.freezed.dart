// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'paragraph_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ParagraphsStateTearOff {
  const _$ParagraphsStateTearOff();

// ignore: unused_element
  ParagraphsStateData call({List<String> paragraphs = const []}) {
    return ParagraphsStateData(
      paragraphs: paragraphs,
    );
  }

// ignore: unused_element
  ParagraphsStateLoading loading() {
    return const ParagraphsStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $ParagraphsState = _$ParagraphsStateTearOff();

/// @nodoc
mixin _$ParagraphsState {
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
    TResult $default(ParagraphsStateData value), {
    @required TResult loading(ParagraphsStateLoading value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(ParagraphsStateData value), {
    TResult loading(ParagraphsStateLoading value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ParagraphsStateCopyWith<$Res> {
  factory $ParagraphsStateCopyWith(
          ParagraphsState value, $Res Function(ParagraphsState) then) =
      _$ParagraphsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ParagraphsStateCopyWithImpl<$Res>
    implements $ParagraphsStateCopyWith<$Res> {
  _$ParagraphsStateCopyWithImpl(this._value, this._then);

  final ParagraphsState _value;
  // ignore: unused_field
  final $Res Function(ParagraphsState) _then;
}

/// @nodoc
abstract class $ParagraphsStateDataCopyWith<$Res> {
  factory $ParagraphsStateDataCopyWith(
          ParagraphsStateData value, $Res Function(ParagraphsStateData) then) =
      _$ParagraphsStateDataCopyWithImpl<$Res>;
  $Res call({List<String> paragraphs});
}

/// @nodoc
class _$ParagraphsStateDataCopyWithImpl<$Res>
    extends _$ParagraphsStateCopyWithImpl<$Res>
    implements $ParagraphsStateDataCopyWith<$Res> {
  _$ParagraphsStateDataCopyWithImpl(
      ParagraphsStateData _value, $Res Function(ParagraphsStateData) _then)
      : super(_value, (v) => _then(v as ParagraphsStateData));

  @override
  ParagraphsStateData get _value => super._value as ParagraphsStateData;

  @override
  $Res call({
    Object paragraphs = freezed,
  }) {
    return _then(ParagraphsStateData(
      paragraphs: paragraphs == freezed
          ? _value.paragraphs
          : paragraphs as List<String>,
    ));
  }
}

/// @nodoc
class _$ParagraphsStateData
    with DiagnosticableTreeMixin
    implements ParagraphsStateData {
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
        (other is ParagraphsStateData &&
            (identical(other.paragraphs, paragraphs) ||
                const DeepCollectionEquality()
                    .equals(other.paragraphs, paragraphs)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(paragraphs);

  @JsonKey(ignore: true)
  @override
  $ParagraphsStateDataCopyWith<ParagraphsStateData> get copyWith =>
      _$ParagraphsStateDataCopyWithImpl<ParagraphsStateData>(this, _$identity);

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
    TResult $default(ParagraphsStateData value), {
    @required TResult loading(ParagraphsStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(ParagraphsStateData value), {
    TResult loading(ParagraphsStateLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class ParagraphsStateData implements ParagraphsState {
  const factory ParagraphsStateData({List<String> paragraphs}) =
      _$ParagraphsStateData;

  List<String> get paragraphs;
  @JsonKey(ignore: true)
  $ParagraphsStateDataCopyWith<ParagraphsStateData> get copyWith;
}

/// @nodoc
abstract class $ParagraphsStateLoadingCopyWith<$Res> {
  factory $ParagraphsStateLoadingCopyWith(ParagraphsStateLoading value,
          $Res Function(ParagraphsStateLoading) then) =
      _$ParagraphsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ParagraphsStateLoadingCopyWithImpl<$Res>
    extends _$ParagraphsStateCopyWithImpl<$Res>
    implements $ParagraphsStateLoadingCopyWith<$Res> {
  _$ParagraphsStateLoadingCopyWithImpl(ParagraphsStateLoading _value,
      $Res Function(ParagraphsStateLoading) _then)
      : super(_value, (v) => _then(v as ParagraphsStateLoading));

  @override
  ParagraphsStateLoading get _value => super._value as ParagraphsStateLoading;
}

/// @nodoc
class _$ParagraphsStateLoading
    with DiagnosticableTreeMixin
    implements ParagraphsStateLoading {
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
    return identical(this, other) || (other is ParagraphsStateLoading);
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
    TResult $default(ParagraphsStateData value), {
    @required TResult loading(ParagraphsStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(ParagraphsStateData value), {
    TResult loading(ParagraphsStateLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ParagraphsStateLoading implements ParagraphsState {
  const factory ParagraphsStateLoading() = _$ParagraphsStateLoading;
}
