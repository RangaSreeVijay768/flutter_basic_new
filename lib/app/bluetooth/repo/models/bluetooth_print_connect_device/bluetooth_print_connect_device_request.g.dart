// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluetooth_print_connect_device_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BluetoothPrintConnectDeviceRequest _$BluetoothPrintConnectDeviceRequestFromJson(
        Map<String, dynamic> json) =>
    BluetoothPrintConnectDeviceRequest(
      bluetoothDevice: BluetoothDevice.fromJson(
          json['bluetooth_device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BluetoothPrintConnectDeviceRequestToJson(
        BluetoothPrintConnectDeviceRequest instance) =>
    <String, dynamic>{
      'bluetooth_device': instance.bluetoothDevice,
    };
