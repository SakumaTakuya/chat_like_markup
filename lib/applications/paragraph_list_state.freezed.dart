// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'paragraph_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ParagraphListStateTearOff {
  const _$ParagraphListStateTearOff();

// ignore: unused_element
  ParagraphListStateData call(
      {List<Paragraph> paragraphs = const [const Paragraph('')]}) {
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
const $ParagraphListState = _$ParagraphListStateTearOff();

/// @nodoc
mixin _$ParagraphListState {
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(List<Paragraph> paragraphs), {
    @required TResult loading(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(List<Paragraph> paragraphs), {
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
abstract class $ParagraphListStateCopyWith<$Res> {
  factory $ParagraphListStateCopyWith(
          ParagraphListState value, $Res Function(ParagraphListState) then) =
      _$ParagraphListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ParagraphListStateCopyWithImpl<$Res>
    implements $ParagraphListStateCopyWith<$Res> {
  _$ParagraphListStateCopyWithImpl(this._value, this._then);

  final ParagraphListState _value;
  // ignore: unused_field
  final $Res Function(ParagraphListState) _then;
}

/// @nodoc
abstract class $ParagraphListStateDataCopyWith<$Res> {
  factory $ParagraphListStateDataCopyWith(ParagraphListStateData value,
          $Res Function(ParagraphListStateData) then) =
      _$ParagraphListStateDataCopyWithImpl<$Res>;
  $Res call({List<Paragraph> paragraphs});
}

/// @nodoc
class _$ParagraphListStateDataCopyWithImpl<$Res>
    extends _$ParagraphListStateCopyWithImpl<$Res>
    implements $ParagraphListStateDataCopyWith<$Res> {
  _$ParagraphListStateDataCopyWithImpl(ParagraphListStateData _value,
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
          : paragraphs as List<Paragraph>,
    ));
  }
}

/// @nodoc
class _$ParagraphListStateData
    with DiagnosticableTreeMixin
    implements ParagraphListStateData {
  const _$ParagraphListStateData(
      {this.paragraphs = const [const Paragraph('')]})
      : assert(paragraphs != null);

  @JsonKey(defaultValue: const [const Paragraph('')])
  @override
  final List<Paragraph> paragraphs;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ParagraphListState(paragraphs: $paragraphs)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ParagraphListState'))
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
  $ParagraphListStateDataCopyWith<ParagraphListStateData> get copyWith =>
      _$ParagraphListStateDataCopyWithImpl<ParagraphListStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(List<Paragraph> paragraphs), {
    @required TResult loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(paragraphs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(List<Paragraph> paragraphs), {
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
  const factory ParagraphListStateData({List<Paragraph> paragraphs}) =
      _$ParagraphListStateData;

  List<Paragraph> get paragraphs;
  @JsonKey(ignore: true)
  $ParagraphListStateDataCopyWith<ParagraphListStateData> get copyWith;
}

/// @nodoc
abstract class $ParagraphListStateLoadingCopyWith<$Res> {
  factory $ParagraphListStateLoadingCopyWith(ParagraphListStateLoading value,
          $Res Function(ParagraphListStateLoading) then) =
      _$ParagraphListStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ParagraphListStateLoadingCopyWithImpl<$Res>
    extends _$ParagraphListStateCopyWithImpl<$Res>
    implements $ParagraphListStateLoadingCopyWith<$Res> {
  _$ParagraphListStateLoadingCopyWithImpl(ParagraphListStateLoading _value,
      $Res Function(ParagraphListStateLoading) _then)
      : super(_value, (v) => _then(v as ParagraphListStateLoading));

  @override
  ParagraphListStateLoading get _value =>
      super._value as ParagraphListStateLoading;
}

/// @nodoc
class _$ParagraphListStateLoading
    with DiagnosticableTreeMixin
    implements ParagraphListStateLoading {
  const _$ParagraphListStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ParagraphListState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ParagraphListState.loading'));
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
    TResult $default(List<Paragraph> paragraphs), {
    @required TResult loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(List<Paragraph> paragraphs), {
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
  const factory ParagraphListStateLoading() = _$ParagraphListStateLoading;
}
