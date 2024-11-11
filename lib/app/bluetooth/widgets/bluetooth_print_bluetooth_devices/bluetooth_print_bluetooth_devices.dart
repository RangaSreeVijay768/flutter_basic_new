import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:basic/app/bluetooth/widgets/bluetooth_auto_connect_device/bluetooth_auto_connect_device.dart';
import 'package:basic/app/bluetooth/widgets/bluetooth_auto_connect_device/bluetooth_auto_connect_device_controller.dart';
import 'package:basic/app/bluetooth/widgets/bluetooth_print_connect_device/bluetooth_print_connect_device.dart';
import 'package:basic/app/bluetooth/widgets/bluetooth_print_connect_device/bluetooth_print_connect_device_controller.dart';
import 'package:basic/app/bluetooth/widgets/bluetooth_print_start_scan/bluetooth_print_start_scan_controller.dart';

import '/app/core/widgets/base_stateless_widget.dart';
import '../../../core/database/boolean_status.dart';
import '../../../core/logger/log.dart';
import '../../state/bluetooth_cubit.dart';
import '../bluetooth_print_start_scan/bluetooth_print_start_scan.dart';
import 'bluetooth_print_bluetooth_devices_controller.dart';
import 'bluetooth_print_bluetooth_devices_cubit.dart';

class BluetoothPrintBluetoothDevices extends BaseStatelessWidget<
    BluetoothPrintBluetoothDevicesController,
    BluetoothPrintBluetoothDevicesCubit,
    BluetoothPrintBluetoothDevicesState> {
  BluetoothDevice? _device;

  BluetoothPrintBluetoothDevices(
      {Key? key, super.controller, super.onStateChanged})
      : super(key: key);
  BluetoothPrintStartScanController bluetoothPrintStartScanController =
      BluetoothPrintStartScanController();
  BluetoothPrintConnectDeviceController bluetoothPrintConnectDeviceController =
      BluetoothPrintConnectDeviceController();
  BluetoothAutoConnectDeviceController bluetoothAutoConnectDeviceController =
      BluetoothAutoConnectDeviceController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BluetoothPrintBluetoothDevicesCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocListener<BluetoothCubit, BluetoothState>(
        listener: (context, state) {
          getCubit(context).emitState(
              getCubit(context).state.copyWith(bluetoothState: state));
        },
        child: BlocConsumer<BluetoothPrintBluetoothDevicesCubit,
            BluetoothPrintBluetoothDevicesState>(
          listener: (context, state) {
            if (onStateChanged != null) {
              onStateChanged!(state);
            }
          },
          builder: (context, state) {
            initializeController(context);


            return Column(
              children: [
                BluetoothAutoConnectDevice(
                  controller: bluetoothAutoConnectDeviceController,
                ),
                BluetoothPrintConnectDevice(
                  controller: bluetoothPrintConnectDeviceController,
                ),
                BluetoothPrintStartScanEmptyWidget(
                  controller: bluetoothPrintStartScanController,
                ),
                StreamBuilder<List<BluetoothDevice>>(
                    stream: getCubit(context)
                        .bluetoothService
                        .bluetoothPrint
                        .scanResults,
                    initialData: [],
                    builder: (c, snapshot) {
                      if (snapshot.data != null) {
                        bluetoothAutoConnectDeviceController
                            .getChildCubit()
                            .updateCurrentDevicesAndConnect(snapshot.data!);
                        return Column(
                          children: snapshot.data!
                              .map((d) => ListTile(
                                    title: Text(d.name ?? ''),
                                    subtitle: state.bluetoothState
                                                ?.bluetoothDevice?.address ==
                                            d.address
                                        ? Text('Connected')
                                        : Text(''),
                                    onTap: (state
                                                .bluetoothPrintConnectDeviceState
                                                ?.bluetoothPrintConnectDeviceStatus ==
                                            BooleanStatus.pending)
                                        ? null
                                        : () async {
                                            bool connected =
                                                await bluetoothPrintConnectDeviceController
                                                    .getChildCubit()
                                                    .connectDevice(
                                                        bluetoothPrintConnectDeviceController
                                                            .getChildCubit()
                                                            .createRequestData(
                                                                bluetoothDevice:
                                                                    d));
                                            if (connected) {
                                              getCubit(context)
                                                  .bluetoothService
                                                  .saveLastConnectionId(
                                                      d.address!);
                                              BluetoothCubit bluetoothCubit =
                                                  BlocProvider.of<
                                                      BluetoothCubit>(context);
                                              BluetoothState bluetoothState =
                                                  bluetoothCubit.state;
                                              bluetoothCubit.emitState(
                                                  bluetoothState.copyWith(
                                                      bluetoothDevice: d,
                                                      bluetoothStatus:
                                                          BooleanStatus
                                                              .success));
                                            } else {
                                              logger.d('not connected');
                                            }
                                          },
                                  ))
                              .toList(),
                        );
                      } else {
                        return Text('No devices found');
                      }
                    })
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  BluetoothPrintBluetoothDevicesCubit createCubitAndAssignToController(
      BuildContext context) {
    BluetoothPrintBluetoothDevicesCubit cubit =
        BluetoothPrintBluetoothDevicesCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
