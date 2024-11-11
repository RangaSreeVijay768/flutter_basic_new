// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_accounts_login_form_widget_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserAccountsLoginFormWidgetState {
  ControlStatus? get formValid => throw _privateConstructorUsedError;
  UserLoginResponse? get userLoginResponse =>
      throw _privateConstructorUsedError;
  BooleanStatus get userLoginStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ControlStatus? formValid,
            UserLoginResponse? userLoginResponse, BooleanStatus userLoginStatus)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ControlStatus? formValid,
            UserLoginResponse? userLoginResponse,
            BooleanStatus userLoginStatus)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ControlStatus? formValid,
            UserLoginResponse? userLoginResponse,
            BooleanStatus userLoginStatus)?
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

  /// Create a copy of UserAccountsLoginFormWidgetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAccountsLoginFormWidgetStateCopyWith<UserAccountsLoginFormWidgetState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountsLoginFormWidgetStateCopyWith<$Res> {
  factory $UserAccountsLoginFormWidgetStateCopyWith(
          UserAccountsLoginFormWidgetState value,
          $Res Function(UserAccountsLoginFormWidgetState) then) =
      _$UserAccountsLoginFormWidgetStateCopyWithImpl<$Res,
          UserAccountsLoginFormWidgetState>;
  @useResult
  $Res call(
      {ControlStatus? formValid,
      UserLoginResponse? userLoginResponse,
      BooleanStatus userLoginStatus});
}

/// @nodoc
class _$UserAccountsLoginFormWidgetStateCopyWithImpl<$Res,
        $Val extends UserAccountsLoginFormWidgetState>
    implements $UserAccountsLoginFormWidgetStateCopyWith<$Res> {
  _$UserAccountsLoginFormWidgetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAccountsLoginFormWidgetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formValid = freezed,
    Object? userLoginResponse = freezed,
    Object? userLoginStatus = null,
  }) {
    return _then(_value.copyWith(
      formValid: freezed == formValid
          ? _value.formValid
          : formValid // ignore: cast_nullable_to_non_nullable
              as ControlStatus?,
      userLoginResponse: freezed == userLoginResponse
          ? _value.userLoginResponse
          : userLoginResponse // ignore: cast_nullable_to_non_nullable
              as UserLoginResponse?,
      userLoginStatus: null == userLoginStatus
          ? _value.userLoginStatus
          : userLoginStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $UserAccountsLoginFormWidgetStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ControlStatus? formValid,
      UserLoginResponse? userLoginResponse,
      BooleanStatus userLoginStatus});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$UserAccountsLoginFormWidgetStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAccountsLoginFormWidgetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formValid = freezed,
    Object? userLoginResponse = freezed,
    Object? userLoginStatus = null,
  }) {
    return _then(_$InitialImpl(
      formValid: freezed == formValid
          ? _value.formValid
          : formValid // ignore: cast_nullable_to_non_nullable
              as ControlStatus?,
      userLoginResponse: freezed == userLoginResponse
          ? _value.userLoginResponse
          : userLoginResponse // ignore: cast_nullable_to_non_nullable
              as UserLoginResponse?,
      userLoginStatus: null == userLoginStatus
          ? _value.userLoginStatus
          : userLoginStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.formValid,
      this.userLoginResponse,
      this.userLoginStatus = BooleanStatus.initial});

  @override
  final ControlStatus? formValid;
  @override
  final UserLoginResponse? userLoginResponse;
  @override
  @JsonKey()
  final BooleanStatus userLoginStatus;

  @override
  String toString() {
    return 'UserAccountsLoginFormWidgetState.initial(formValid: $formValid, userLoginResponse: $userLoginResponse, userLoginStatus: $userLoginStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.formValid, formValid) ||
                other.formValid == formValid) &&
            (identical(other.userLoginResponse, userLoginResponse) ||
                other.userLoginResponse == userLoginResponse) &&
            (identical(other.userLoginStatus, userLoginStatus) ||
                other.userLoginStatus == userLoginStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, formValid, userLoginResponse, userLoginStatus);

  /// Create a copy of UserAccountsLoginFormWidgetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ControlStatus? formValid,
            UserLoginResponse? userLoginResponse, BooleanStatus userLoginStatus)
        initial,
  }) {
    return initial(formValid, userLoginResponse, userLoginStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ControlStatus? formValid,
            UserLoginResponse? userLoginResponse,
            BooleanStatus userLoginStatus)?
        initial,
  }) {
    return initial?.call(formValid, userLoginResponse, userLoginStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ControlStatus? formValid,
            UserLoginResponse? userLoginResponse,
            BooleanStatus userLoginStatus)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(formValid, userLoginResponse, userLoginStatus);
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

abstract class _Initial implements UserAccountsLoginFormWidgetState {
  const factory _Initial(
      {final ControlStatus? formValid,
      final UserLoginResponse? userLoginResponse,
      final BooleanStatus userLoginStatus}) = _$InitialImpl;

  @override
  ControlStatus? get formValid;
  @override
  UserLoginResponse? get userLoginResponse;
  @override
  BooleanStatus get userLoginStatus;

  /// Create a copy of UserAccountsLoginFormWidgetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
