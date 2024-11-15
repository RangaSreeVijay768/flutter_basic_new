import 'package:basic/app/escale/request_response/get_all_customers/get_all_customers_response.dart';
import 'package:basic/app/escale/request_response/get_all_trucks/get_all_trucks_response.dart';
import 'package:basic/app/escale/widgets/get_all_customers/get_all_customers.dart';
import 'package:basic/app/escale/widgets/get_all_customers/get_all_customers_controller.dart';
import 'package:basic/app/escale/widgets/get_all_trucks/get_all_trucks.dart';
import 'package:basic/app/escale/widgets/get_all_trucks/get_all_trucks_controller.dart';
import 'package:basic/app/escale/widgets/sell_screen_template/sell_screen_template.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../core/database/boolean_status.dart';
import '../../../core/services/usb_serial.dart';
import '../../../core/widgets/app_scaffold.dart';
import '../../../themes/app_colors.dart';
import '../../widgets/get_all_transactions/get_all_transactions.dart';
import '../../widgets/get_all_transactions/get_all_transactions_controller.dart';
import '../../widgets/sell_screen_template/sell_screen_template_controller.dart';
import '../bluetooth_printer_screen/bluetooth_printer_screen.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'sell_screen_new_controller.dart';
import 'sell_screen_new_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class SellScreenNew extends BaseStatelessWidget<SellScreenNewController,
    SellScreenNewCubit, SellScreenNewState> {
  SellScreenNew({Key? key, super.controller, super.onStateChanged})
      : super(key: key);
  GetAllTransactionsController getAllTransactionsController =
  GetAllTransactionsController();
  final List<SellScreenTemplateController> sellScreenTemplateControllers = [];
  final Map<SellScreenTemplateController, Color> controllerColors = {};
  GetAllTrucksController getAllTrucksController = GetAllTrucksController();
  GetAllCustomersController getAllCustomersController =
  GetAllCustomersController();
  @override
  Widget build(BuildContext context) {
    if (sellScreenTemplateControllers.isEmpty) {
      _addNewControllerWithColor();
      _addNewControllerWithColor();
    }

    return BlocProvider<SellScreenNewCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<SellScreenNewCubit, SellScreenNewState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
          Future<void> fetchTrucks() async {
            List<GetAllTrucksResponse> trucks = await getAllTrucksController.getChildCubit().getAllTrucks(
                getAllTrucksController.getChildCubit().createRequestData());
            getCubit(context).emitState(state.copyWith(getAllTrucksResponse: trucks));
          }
          Future<void> fetchCustomers() async {
            List<GetAllCustomersResponse> customers = await getAllCustomersController.getChildCubit().getAllCustomers(
                getAllCustomersController.getChildCubit().createRequestData());
            getCubit(context).emitState(state.copyWith(getAllCustomersResponse: customers));
          }
          state.getAllTrucksResponse != null ? null : fetchTrucks();
          state.getAllCustomersResponse != null ? null : fetchCustomers();
        },
        builder: (context, state) {
          initializeController(context);
          final largeScreen = MediaQuery.sizeOf(context).width > 600;
          return AppScaffold(
            appBarTitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text("Sell"),
                Container(
                  width: largeScreen
                      ? MediaQuery.sizeOf(context).width / 7
                      : MediaQuery.sizeOf(context).width /4,
                  child: Row(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: usbSerialService.statusNotifier,
                        builder: (context, status, child) => IconButton(
                          onPressed: () {
                            status == "Connected"
                                ? disconnectUsbSerial()
                                : connectUsbSerial();
                          },
                          style: IconButton.styleFrom(
                              side: BorderSide(
                                  color: status == "Connected"
                                      ? AppColors.green
                                      : AppColors.grey1,
                                  width: 2)),
                          icon: status == "Connected"
                              ? Icon(
                            Icons.usb,
                            color: AppColors.green,
                          )
                              : Icon(
                            Icons.usb_off_outlined,
                            color: AppColors.grey1,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: state.printerConnectionStatus == BooleanStatus.pending
                            ? () async {
                          await getCubit(context).printerConnectionStatus();
                        }
                            : () async {
                          // If the connection status is not pending, disconnect the printer
                           getCubit(context).disconnect();
                        },
                        style: IconButton.styleFrom(
                          side: BorderSide(
                            color: state.printerConnectionStatus == BooleanStatus.pending
                                ? AppColors.grey1
                                : AppColors.green,
                            width: 2,
                          ),
                        ),
                        icon: state.printerConnectionStatus == BooleanStatus.pending
                            ? Icon(
                          Icons.print_disabled_outlined,
                          color: AppColors.grey1,
                        )
                            : Icon(
                          Icons.print_outlined,
                          color: AppColors.green,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  GetAllTransactions(
                    controller: getAllTransactionsController,
                    onStateChanged: (getAllTransactionsState) =>
                        getCubit(context).emitState(state.copyWith(
                            getAllTransactionsState: getAllTransactionsState)),
                  ),
                  GetAllCustomersNoTemplate(
                    controller: getAllCustomersController,
                  ),
                  GetAllTrucksNoTemplate(
                    controller:getAllTrucksController ,
                  ),
                  SizedBox(height: 10),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      int columns = constraints.maxWidth > 600 ? 2 : 1;

                      return Wrap(
                        spacing: 12,
                        runSpacing: 10,
                        children: sellScreenTemplateControllers
                            .asMap()
                            .entries
                            .map((entry) {
                          int index = entry.key;
                          SellScreenTemplateController controller = entry.value;

                          return Container(
                            width: constraints.maxWidth / columns - 12,
                            child: SellScreenTemplate(
                              key: ValueKey(controller),
                              customers: state.getAllCustomersResponse ?? [],
                              trucks: state.getAllTrucksResponse ?? [],
                              controller: controller,
                              printerConnectionStatus: state.printerConnectionStatus,
                              closeTemplate: () {
                                sellScreenTemplateControllers
                                    .remove(controller);
                                controllerColors
                                    .remove(controller); // Remove color mapping
                                (context as Element).markNeedsBuild();
                              },
                              onTransactionCreated: () async {
                                await getAllTransactionsController
                                    .getChildCubit()
                                    .getAllTransactions(
                                    getAllTransactionsController
                                        .getChildCubit()
                                        .createRequestData());
                                (context as Element).markNeedsBuild();
                              },
                              color: controllerColors[controller]!,
                              // Retrieve color from map
                              onStateChanged: (sellScreenTemplateState) =>
                                  getCubit(context).emitState(state.copyWith(
                                      sellScreenTemplateState:
                                      sellScreenTemplateState)),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _addNewControllerWithColor();
                (context as Element).markNeedsBuild();
              },
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }

  void _addNewControllerWithColor() {
    var newController = SellScreenTemplateController();
    Color assignedColor = AppColors.formTemplateColors[
    sellScreenTemplateControllers.length %
        AppColors.formTemplateColors.length];
    sellScreenTemplateControllers.add(newController);
    controllerColors[newController] = assignedColor;
  }

  @override
  SellScreenNewCubit createCubitAndAssignToController(BuildContext context) {
    SellScreenNewCubit cubit = SellScreenNewCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
