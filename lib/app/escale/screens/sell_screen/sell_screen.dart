import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/logger/log.dart';
import 'package:basic/app/core/services/usb_serial.dart';
import 'package:basic/app/escale/screens/bluetooth_printer_screen/bluetooth_printer_screen.dart';
import 'package:basic/app/escale/screens/sell_page.dart';
import 'package:basic/app/escale/widgets/get_all_transactions/get_all_transactions.dart';
import 'package:basic/app/escale/widgets/get_all_transactions/get_all_transactions_controller.dart';
import 'package:basic/app/escale/widgets/sell_form_template/sell_form_template.dart';
import 'package:basic/app/escale/widgets/sell_form_template/sell_form_template_controller.dart';
import 'package:basic/app/themes/shadows.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';

import '../../../core/widgets/app_scaffold.dart';
import 'sell_screen_controller.dart';
import 'sell_screen_cubit.dart';
import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class SellScreen extends BaseStatelessWidget<SellScreenController, SellScreenCubit, SellScreenState> {
  SellScreen({Key? key, super.controller, super.onStateChanged}) : super(key: key);

  GetAllTransactionsController getAllTransactionsController = GetAllTransactionsController();
  final List<SellFormTemplateController> sellFormTemplateControllers = [];
  final Map<SellFormTemplateController, Color> controllerColors = {};

  @override
  Widget build(BuildContext context) {
    if (sellFormTemplateControllers.isEmpty) {
      _addNewControllerWithColor();
      _addNewControllerWithColor();
    }

    return BlocProvider<SellScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<SellScreenCubit, SellScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return AppScaffold(
            appBarTitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text("Sell"),
                Container(
                  width: MediaQuery.sizeOf(context).width/7,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: (){},
                          style: IconButton.styleFrom(
                            side: BorderSide(
                              color: usbSerialService.status == "Connected"
                                  ? AppColors.green : AppColors.grey1,
                              width: 2
                            )
                          ),
                          icon: (usbSerialService.status == "Connected"
                              ? Icon(Icons.usb, color: AppColors.green,) : Icon(Icons.usb_off_outlined, color: AppColors.grey1,)),
                      ),
                      IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BluetoothPrinterScreen()));
                        },
                        style: IconButton.styleFrom(
                            side: BorderSide(
                                color: state.bluetoothState?.bluetoothPrintConnectDeviceStatus == BooleanStatus.pending
                                    ? AppColors.grey1 : AppColors.green,
                                width: 2
                            )
                        ),
                        icon: (state.bluetoothState?.bluetoothPrintConnectDeviceStatus == BooleanStatus.pending
                            ? Icon(Icons.print_disabled_outlined, color: AppColors.grey1,) : Icon(Icons.print_outlined, color: AppColors.green,)),
                      ),
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
                  SizedBox(height: 10),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      int columns = constraints.maxWidth > 600 ? 2 : 1;

                      return Wrap(
                        spacing: 12,
                        runSpacing: 10,
                        children: sellFormTemplateControllers.asMap().entries.map((entry) {
                          int index = entry.key;
                          SellFormTemplateController controller = entry.value;

                          return Container(
                            width: constraints.maxWidth / columns - 12,
                            child: SellFormTemplate(
                              key: ValueKey(controller),
                              customers: state.getAllCustomersResponse ?? [],
                              trucks: state.getAllTrucksResponse ?? [],
                              controller: controller,
                              closeTemplate: () {
                                sellFormTemplateControllers.remove(controller);
                                controllerColors.remove(controller); // Remove color mapping
                                (context as Element).markNeedsBuild();
                              },
                              onTransactionCreated: () async {
                                await getAllTransactionsController
                                    .getChildCubit()
                                    .getAllTransactions(getAllTransactionsController.getChildCubit().createRequestData());
                                sellFormTemplateControllers.remove(controller);
                                sellFormTemplateControllers.add(controller);
                                (context as Element).markNeedsBuild();
                              },
                              color: controllerColors[controller]!, // Retrieve color from map
                              onStateChanged: (sellFormTemplateState) => getCubit(context).emitState(
                                  state.copyWith(sellFormTemplateState: sellFormTemplateState)),
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
    var newController = SellFormTemplateController();
    Color assignedColor = AppColors.formTemplateColors[sellFormTemplateControllers.length % AppColors.formTemplateColors.length];
    sellFormTemplateControllers.add(newController);
    controllerColors[newController] = assignedColor;
  }

  @override
  SellScreenCubit createCubitAndAssignToController(BuildContext context) {
    SellScreenCubit cubit = SellScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
