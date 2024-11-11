// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bluetooth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BluetoothState {
  BluetoothDevice? get bluetoothDevice => throw _privateConstructorUsedError;
  BooleanStatus get bluetoothStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BluetoothDevice? bluetoothDevice, BooleanStatus bluetoothStatus)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BluetoothDevice? bluetoothDevice, BooleanStatus bluetoothStatus)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BluetoothDevice? bluetoothDevice, BooleanStatus bluetoothStatus)?
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

  /// Create a copy of BluetoothState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BluetoothStateCopyWith<BluetoothState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothStateCopyWith<$Res> {
  factory $BluetoothStateCopyWith(
          BluetoothState value, $Res Function(BluetoothState) then) =
      _$BluetoothStateCopyWithImpl<$Res, BluetoothState>;
  @useResult
  $Res call({BluetoothDevice? bluetoothDevice, BooleanStatus bluetoothStatus});
}

/// @nodoc
class _$BluetoothStateCopyWithImpl<$Res, $Val extends BluetoothState>
    implements $BluetoothStateCopyWith<$Res> {
  _$BluetoothStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BluetoothState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bluetoothDevice = freezed,
    Object? bluetoothStatus = null,
  }) {
    return _then(_value.copyWith(
      bluetoothDevice: freezed == bluetoothDevice
          ? _value.bluetoothDevice
          : bluetoothDevice // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice?,
      bluetoothStatus: null == bluetoothStatus
          ? _value.bluetoothStatus
          : bluetoothStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $BluetoothStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BluetoothDevice? bluetoothDevice, BooleanStatus bluetoothStatus});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BluetoothStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of BluetoothState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bluetoothDevice = freezed,
    Object? bluetoothStatus = null,
  }) {
    return _then(_$InitialImpl(
      bluetoothDevice: freezed == bluetoothDevice
          ? _value.bluetoothDevice
          : bluetoothDevice // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice?,
      bluetoothStatus: null == bluetoothStatus
          ? _value.bluetoothStatus
          : bluetoothStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.bluetoothDevice, this.bluetoothStatus = BooleanStatus.initial});

  @override
  final BluetoothDevice? bluetoothDevice;
  @override
  @JsonKey()
  final BooleanStatus bluetoothStatus;

  @override
  String toString() {
    return 'BluetoothState.initial(bluetoothDevice: $bluetoothDevice, bluetoothStatus: $bluetoothStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.bluetoothDevice, bluetoothDevice) ||
                other.bluetoothDevice == bluetoothDevice) &&
            (identical(other.bluetoothStatus, bluetoothStatus) ||
                other.bluetoothStatus == bluetoothStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, bluetoothDevice, bluetoothStatus);

  /// Create a copy of BluetoothState
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
            BluetoothDevice? bluetoothDevice, BooleanStatus bluetoothStatus)
        initial,
  }) {
    return initial(bluetoothDevice, bluetoothStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BluetoothDevice? bluetoothDevice, BooleanStatus bluetoothStatus)?
        initial,
  }) {
    return initial?.call(bluetoothDevice, bluetoothStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BluetoothDevice? bluetoothDevice, BooleanStatus bluetoothStatus)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(bluetoothDevice, bluetoothStatus);
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

abstract class _Initial implements BluetoothState {
  const factory _Initial(
      {final BluetoothDevice? bluetoothDevice,
      final BooleanStatus bluetoothStatus}) = _$InitialImpl;

  @override
  BluetoothDevice? get bluetoothDevice;
  @override
  BooleanStatus get bluetoothStatus;

  /// Create a copy of BluetoothState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
