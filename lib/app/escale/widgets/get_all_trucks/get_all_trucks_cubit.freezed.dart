// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_trucks_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetAllTrucksState {
  List<GetAllTrucksResponse>? get getAllTrucksResponse =>
      throw _privateConstructorUsedError;
  BooleanStatus get getAllTrucksStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GetAllTrucksResponse>? getAllTrucksResponse,
            BooleanStatus getAllTrucksStatus)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<GetAllTrucksResponse>? getAllTrucksResponse,
            BooleanStatus getAllTrucksStatus)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GetAllTrucksResponse>? getAllTrucksResponse,
            BooleanStatus getAllTrucksStatus)?
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

  /// Create a copy of GetAllTrucksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAllTrucksStateCopyWith<GetAllTrucksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllTrucksStateCopyWith<$Res> {
  factory $GetAllTrucksStateCopyWith(
          GetAllTrucksState value, $Res Function(GetAllTrucksState) then) =
      _$GetAllTrucksStateCopyWithImpl<$Res, GetAllTrucksState>;
  @useResult
  $Res call(
      {List<GetAllTrucksResponse>? getAllTrucksResponse,
      BooleanStatus getAllTrucksStatus});
}

/// @nodoc
class _$GetAllTrucksStateCopyWithImpl<$Res, $Val extends GetAllTrucksState>
    implements $GetAllTrucksStateCopyWith<$Res> {
  _$GetAllTrucksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllTrucksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllTrucksResponse = freezed,
    Object? getAllTrucksStatus = null,
  }) {
    return _then(_value.copyWith(
      getAllTrucksResponse: freezed == getAllTrucksResponse
          ? _value.getAllTrucksResponse
          : getAllTrucksResponse // ignore: cast_nullable_to_non_nullable
              as List<GetAllTrucksResponse>?,
      getAllTrucksStatus: null == getAllTrucksStatus
          ? _value.getAllTrucksStatus
          : getAllTrucksStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $GetAllTrucksStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GetAllTrucksResponse>? getAllTrucksResponse,
      BooleanStatus getAllTrucksStatus});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GetAllTrucksStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllTrucksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllTrucksResponse = freezed,
    Object? getAllTrucksStatus = null,
  }) {
    return _then(_$InitialImpl(
      getAllTrucksResponse: freezed == getAllTrucksResponse
          ? _value._getAllTrucksResponse
          : getAllTrucksResponse // ignore: cast_nullable_to_non_nullable
              as List<GetAllTrucksResponse>?,
      getAllTrucksStatus: null == getAllTrucksStatus
          ? _value.getAllTrucksStatus
          : getAllTrucksStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<GetAllTrucksResponse>? getAllTrucksResponse,
      this.getAllTrucksStatus = BooleanStatus.initial})
      : _getAllTrucksResponse = getAllTrucksResponse;

  final List<GetAllTrucksResponse>? _getAllTrucksResponse;
  @override
  List<GetAllTrucksResponse>? get getAllTrucksResponse {
    final value = _getAllTrucksResponse;
    if (value == null) return null;
    if (_getAllTrucksResponse is EqualUnmodifiableListView)
      return _getAllTrucksResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final BooleanStatus getAllTrucksStatus;

  @override
  String toString() {
    return 'GetAllTrucksState.initial(getAllTrucksResponse: $getAllTrucksResponse, getAllTrucksStatus: $getAllTrucksStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._getAllTrucksResponse, _getAllTrucksResponse) &&
            (identical(other.getAllTrucksStatus, getAllTrucksStatus) ||
                other.getAllTrucksStatus == getAllTrucksStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_getAllTrucksResponse),
      getAllTrucksStatus);

  /// Create a copy of GetAllTrucksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GetAllTrucksResponse>? getAllTrucksResponse,
            BooleanStatus getAllTrucksStatus)
        initial,
  }) {
    return initial(getAllTrucksResponse, getAllTrucksStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<GetAllTrucksResponse>? getAllTrucksResponse,
            BooleanStatus getAllTrucksStatus)?
        initial,
  }) {
    return initial?.call(getAllTrucksResponse, getAllTrucksStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GetAllTrucksResponse>? getAllTrucksResponse,
            BooleanStatus getAllTrucksStatus)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(getAllTrucksResponse, getAllTrucksStatus);
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

abstract class _Initial implements GetAllTrucksState {
  const factory _Initial(
      {final List<GetAllTrucksResponse>? getAllTrucksResponse,
      final BooleanStatus getAllTrucksStatus}) = _$InitialImpl;

  @override
  List<GetAllTrucksResponse>? get getAllTrucksResponse;
  @override
  BooleanStatus get getAllTrucksStatus;

  /// Create a copy of GetAllTrucksState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
