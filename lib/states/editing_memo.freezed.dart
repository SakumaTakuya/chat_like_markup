// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'editing_memo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$EditingMemoStateTearOff {
  const _$EditingMemoStateTearOff();

// ignore: unused_element
  EditingMemoStateData call(
      {int key, String title, ListWithHead<Paragraph> sentence}) {
    return EditingMemoStateData(
      key: key,
      title: title,
      sentence: sentence,
    );
  }

// ignore: unused_element
  EditingMemoStateLoading loading() {
    return const EditingMemoStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $EditingMemoState = _$EditingMemoStateTearOff();

/// @nodoc
mixin _$EditingMemoState {
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(int key, String title, ListWithHead<Paragraph> sentence), {
    @required TResult loading(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(int key, String title, ListWithHead<Paragraph> sentence), {
    TResult loading(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(EditingMemoStateData value), {
    @required TResult loading(EditingMemoStateLoading value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(EditingMemoStateData value), {
    TResult loading(EditingMemoStateLoading value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $EditingMemoStateCopyWith<$Res> {
  factory $EditingMemoStateCopyWith(
          EditingMemoState value, $Res Function(EditingMemoState) then) =
      _$EditingMemoStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EditingMemoStateCopyWithImpl<$Res>
    implements $EditingMemoStateCopyWith<$Res> {
  _$EditingMemoStateCopyWithImpl(this._value, this._then);

  final EditingMemoState _value;
  // ignore: unused_field
  final $Res Function(EditingMemoState) _then;
}

/// @nodoc
abstract class $EditingMemoStateDataCopyWith<$Res> {
  factory $EditingMemoStateDataCopyWith(EditingMemoStateData value,
          $Res Function(EditingMemoStateData) then) =
      _$EditingMemoStateDataCopyWithImpl<$Res>;
  $Res call({int key, String title, ListWithHead<Paragraph> sentence});
}

/// @nodoc
class _$EditingMemoStateDataCopyWithImpl<$Res>
    extends _$EditingMemoStateCopyWithImpl<$Res>
    implements $EditingMemoStateDataCopyWith<$Res> {
  _$EditingMemoStateDataCopyWithImpl(
      EditingMemoStateData _value, $Res Function(EditingMemoStateData) _then)
      : super(_value, (v) => _then(v as EditingMemoStateData));

  @override
  EditingMemoStateData get _value => super._value as EditingMemoStateData;

  @override
  $Res call({
    Object key = freezed,
    Object title = freezed,
    Object sentence = freezed,
  }) {
    return _then(EditingMemoStateData(
      key: key == freezed ? _value.key : key as int,
      title: title == freezed ? _value.title : title as String,
      sentence: sentence == freezed
          ? _value.sentence
          : sentence as ListWithHead<Paragraph>,
    ));
  }
}

/// @nodoc
class _$EditingMemoStateData implements EditingMemoStateData {
  const _$EditingMemoStateData({this.key, this.title, this.sentence});

  @override
  final int key;
  @override
  final String title;
  @override
  final ListWithHead<Paragraph> sentence;

  @override
  String toString() {
    return 'EditingMemoState(key: $key, title: $title, sentence: $sentence)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EditingMemoStateData &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.sentence, sentence) ||
                const DeepCollectionEquality()
                    .equals(other.sentence, sentence)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(key) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(sentence);

  @JsonKey(ignore: true)
  @override
  $EditingMemoStateDataCopyWith<EditingMemoStateData> get copyWith =>
      _$EditingMemoStateDataCopyWithImpl<EditingMemoStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(int key, String title, ListWithHead<Paragraph> sentence), {
    @required TResult loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(key, title, sentence);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(int key, String title, ListWithHead<Paragraph> sentence), {
    TResult loading(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(key, title, sentence);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(EditingMemoStateData value), {
    @required TResult loading(EditingMemoStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(EditingMemoStateData value), {
    TResult loading(EditingMemoStateLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class EditingMemoStateData implements EditingMemoState {
  const factory EditingMemoStateData(
      {int key,
      String title,
      ListWithHead<Paragraph> sentence}) = _$EditingMemoStateData;

  int get key;
  String get title;
  ListWithHead<Paragraph> get sentence;
  @JsonKey(ignore: true)
  $EditingMemoStateDataCopyWith<EditingMemoStateData> get copyWith;
}

/// @nodoc
abstract class $EditingMemoStateLoadingCopyWith<$Res> {
  factory $EditingMemoStateLoadingCopyWith(EditingMemoStateLoading value,
          $Res Function(EditingMemoStateLoading) then) =
      _$EditingMemoStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$EditingMemoStateLoadingCopyWithImpl<$Res>
    extends _$EditingMemoStateCopyWithImpl<$Res>
    implements $EditingMemoStateLoadingCopyWith<$Res> {
  _$EditingMemoStateLoadingCopyWithImpl(EditingMemoStateLoading _value,
      $Res Function(EditingMemoStateLoading) _then)
      : super(_value, (v) => _then(v as EditingMemoStateLoading));

  @override
  EditingMemoStateLoading get _value => super._value as EditingMemoStateLoading;
}

/// @nodoc
class _$EditingMemoStateLoading implements EditingMemoStateLoading {
  const _$EditingMemoStateLoading();

  @override
  String toString() {
    return 'EditingMemoState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EditingMemoStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(int key, String title, ListWithHead<Paragraph> sentence), {
    @required TResult loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(int key, String title, ListWithHead<Paragraph> sentence), {
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
    TResult $default(EditingMemoStateData value), {
    @required TResult loading(EditingMemoStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(EditingMemoStateData value), {
    TResult loading(EditingMemoStateLoading value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class EditingMemoStateLoading implements EditingMemoState {
  const factory EditingMemoStateLoading() = _$EditingMemoStateLoading;
}
