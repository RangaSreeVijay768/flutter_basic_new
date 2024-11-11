// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluetooth_print_start_scan_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BluetoothPrintStartScanRequest _$BluetoothPrintStartScanRequestFromJson(
        Map<String, dynamic> json) =>
    BluetoothPrintStartScanRequest(
      timeout: json['timeout'] == null
          ? null
          : Duration(microseconds: (json['timeout'] as num).toInt()),
    );

Map<String, dynamic> _$BluetoothPrintStartScanRequestToJson(
        BluetoothPrintStartScanRequest instance) =>
    <String, dynamic>{
      'timeout': instance.timeout?.inMicroseconds,
    };
