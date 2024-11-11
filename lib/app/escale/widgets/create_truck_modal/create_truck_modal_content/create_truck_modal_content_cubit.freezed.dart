// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_truck_modal_content_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateTruckModalContentState {
  bool? get loadingButton => throw _privateConstructorUsedError;
  CreateTruckFormState? get createTruckFormState =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool? loadingButton, CreateTruckFormState? createTruckFormState)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool? loadingButton, CreateTruckFormState? createTruckFormState)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool? loadingButton, CreateTruckFormState? createTruckFormState)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CreateTruckModalContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateTruckModalContentStateCopyWith<CreateTruckModalContentState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTruckModalContentStateCopyWith<$Res> {
  factory $CreateTruckModalContentStateCopyWith(
          CreateTruckModalContentState value,
          $Res Function(CreateTruckModalContentState) then) =
      _$CreateTruckModalContentStateCopyWithImpl<$Res,
          CreateTruckModalContentState>;
  @useResult
  $Res call({bool? loadingButton, CreateTruckFormState? createTruckFormState});

  $CreateTruckFormStateCopyWith<$Res>? get createTruckFormState;
}

/// @nodoc
class _$CreateTruckModalContentStateCopyWithImpl<$Res,
        $Val extends CreateTruckModalContentState>
    implements $CreateTruckModalContentStateCopyWith<$Res> {
  _$CreateTruckModalContentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateTruckModalContentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingButton = freezed,
    Object? createTruckFormState = freezed,
  }) {
    return _then(_value.copyWith(
      loadingButton: freezed == loadingButton
          ? _value.loadingButton
          : loadingButton // ignore: cast_nullable_to_non_nullable
              as bool?,
      createTruckFormState: freezed == createTruckFormState
          ? _value.createTruckFormState
          : createTruckFormState // ignore: cast_nullable_to_non_nullable
              as CreateTruckFormState?,
    ) as $Val);
  }

  /// Create a copy of CreateTruckModalContentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateTruckFormStateCopyWith<$Res>? get createTruckFormState {
    if (_value.createTruckFormState == null) {
      return null;
    }

    return $CreateTruckFormStateCopyWith<$Res>(_value.createTruckFormState!,
        (value) {
      return _then(_value.copyWith(createTruckFormState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $CreateTruckModalContentStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? loadingButton, CreateTruckFormState? createTruckFormState});

  @override
  $CreateTruckFormStateCopyWith<$Res>? get createTruckFormState;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CreateTruckModalContentStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateTruckModalContentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingButton = freezed,
    Object? createTruckFormState = freezed,
  }) {
    return _then(_$InitialImpl(
      loadingButton: freezed == loadingButton
          ? _value.loadingButton
          : loadingButton // ignore: cast_nullable_to_non_nullable
              as bool?,
      createTruckFormState: freezed == createTruckFormState
          ? _value.createTruckFormState
          : createTruckFormState // ignore: cast_nullable_to_non_nullable
              as CreateTruckFormState?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({this.loadingButton, this.createTruckFormState});

  @override
  final bool? loadingButton;
  @override
  final CreateTruckFormState? createTruckFormState;

  @override
  String toString() {
    return 'CreateTruckModalContentState.initial(loadingButton: $loadingButton, createTruckFormState: $createTruckFormState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.loadingButton, loadingButton) ||
                other.loadingButton == loadingButton) &&
            (identical(other.createTruckFormState, createTruckFormState) ||
                other.createTruckFormState == createTruckFormState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, loadingButton, createTruckFormState);

  /// Create a copy of CreateTruckModalContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool? loadingButton, CreateTruckFormState? createTruckFormState)
        initial,
  }) {
    return initial(loadingButton, createTruckFormState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            bool? loadingButton, CreateTruckFormState? createTruckFormState)?
        initial,
  }) {
    return initial?.call(loadingButton, createTruckFormState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool? loadingButton, CreateTruckFormState? createTruckFormState)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(loadingButton, createTruckFormState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CreateTruckModalContentState {
  const factory _Initial(
      {final bool? loadingButton,
      final CreateTruckFormState? createTruckFormState}) = _$InitialImpl;

  @override
  bool? get loadingButton;
  @override
  CreateTruckFormState? get createTruckFormState;

  /// Create a copy of CreateTruckModalContentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
