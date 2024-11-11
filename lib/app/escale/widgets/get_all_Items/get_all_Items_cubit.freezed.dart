// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_Items_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetAllItemsState {
  List<GetAllItemsResponse>? get getAllItemsResponse =>
      throw _privateConstructorUsedError;
  BooleanStatus get getAllItemsStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GetAllItemsResponse>? getAllItemsResponse,
            BooleanStatus getAllItemsStatus)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<GetAllItemsResponse>? getAllItemsResponse,
            BooleanStatus getAllItemsStatus)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GetAllItemsResponse>? getAllItemsResponse,
            BooleanStatus getAllItemsStatus)?
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

  /// Create a copy of GetAllItemsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAllItemsStateCopyWith<GetAllItemsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllItemsStateCopyWith<$Res> {
  factory $GetAllItemsStateCopyWith(
          GetAllItemsState value, $Res Function(GetAllItemsState) then) =
      _$GetAllItemsStateCopyWithImpl<$Res, GetAllItemsState>;
  @useResult
  $Res call(
      {List<GetAllItemsResponse>? getAllItemsResponse,
      BooleanStatus getAllItemsStatus});
}

/// @nodoc
class _$GetAllItemsStateCopyWithImpl<$Res, $Val extends GetAllItemsState>
    implements $GetAllItemsStateCopyWith<$Res> {
  _$GetAllItemsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllItemsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllItemsResponse = freezed,
    Object? getAllItemsStatus = null,
  }) {
    return _then(_value.copyWith(
      getAllItemsResponse: freezed == getAllItemsResponse
          ? _value.getAllItemsResponse
          : getAllItemsResponse // ignore: cast_nullable_to_non_nullable
              as List<GetAllItemsResponse>?,
      getAllItemsStatus: null == getAllItemsStatus
          ? _value.getAllItemsStatus
          : getAllItemsStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $GetAllItemsStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GetAllItemsResponse>? getAllItemsResponse,
      BooleanStatus getAllItemsStatus});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GetAllItemsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllItemsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllItemsResponse = freezed,
    Object? getAllItemsStatus = null,
  }) {
    return _then(_$InitialImpl(
      getAllItemsResponse: freezed == getAllItemsResponse
          ? _value._getAllItemsResponse
          : getAllItemsResponse // ignore: cast_nullable_to_non_nullable
              as List<GetAllItemsResponse>?,
      getAllItemsStatus: null == getAllItemsStatus
          ? _value.getAllItemsStatus
          : getAllItemsStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<GetAllItemsResponse>? getAllItemsResponse,
      this.getAllItemsStatus = BooleanStatus.initial})
      : _getAllItemsResponse = getAllItemsResponse;

  final List<GetAllItemsResponse>? _getAllItemsResponse;
  @override
  List<GetAllItemsResponse>? get getAllItemsResponse {
    final value = _getAllItemsResponse;
    if (value == null) return null;
    if (_getAllItemsResponse is EqualUnmodifiableListView)
      return _getAllItemsResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final BooleanStatus getAllItemsStatus;

  @override
  String toString() {
    return 'GetAllItemsState.initial(getAllItemsResponse: $getAllItemsResponse, getAllItemsStatus: $getAllItemsStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._getAllItemsResponse, _getAllItemsResponse) &&
            (identical(other.getAllItemsStatus, getAllItemsStatus) ||
                other.getAllItemsStatus == getAllItemsStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_getAllItemsResponse),
      getAllItemsStatus);

  /// Create a copy of GetAllItemsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GetAllItemsResponse>? getAllItemsResponse,
            BooleanStatus getAllItemsStatus)
        initial,
  }) {
    return initial(getAllItemsResponse, getAllItemsStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<GetAllItemsResponse>? getAllItemsResponse,
            BooleanStatus getAllItemsStatus)?
        initial,
  }) {
    return initial?.call(getAllItemsResponse, getAllItemsStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GetAllItemsResponse>? getAllItemsResponse,
            BooleanStatus getAllItemsStatus)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(getAllItemsResponse, getAllItemsStatus);
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

abstract class _Initial implements GetAllItemsState {
  const factory _Initial(
      {final List<GetAllItemsResponse>? getAllItemsResponse,
      final BooleanStatus getAllItemsStatus}) = _$InitialImpl;

  @override
  List<GetAllItemsResponse>? get getAllItemsResponse;
  @override
  BooleanStatus get getAllItemsStatus;

  /// Create a copy of GetAllItemsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
