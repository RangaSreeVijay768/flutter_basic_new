import 'package:basic/app/bluetooth/utils/bluetooth_utils.dart';
import 'package:basic/app/bluetooth/widgets/bluetooth_print_print_receipt/bluetooth_print_print_receipt_controller.dart';
import 'package:basic/app/escale/models/truck_models.dart';
import 'package:basic/app/escale/widgets/get_transactions_by_customer_id/get_transactions_by_customer_id.dart';
import 'package:basic/app/escale/widgets/get_transactions_by_customer_id/get_transactions_by_customer_id_controller.dart';
import 'package:basic/app/escale/widgets/trucks_dropdown/trucks_dropdown.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/input_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';

import '../../../bluetooth/widgets/bluetooth_print_print_receipt/bluetooth_print_print_receipt.dart';
import '../../../core/database/boolean_status.dart';
import '../../../core/logger/log.dart';
import '../../../core/services/usb_serial.dart';
import '../../../core/utils/bluetooth_receipt/bluetooth_receipt_utils.dart';
import '../../models/customer_models.dart';
import '../customer_dropdown/customer_dropdown.dart';
import '../get_transactions_by_truck_customer/get_transactions_by_truck_customer.dart';
import '../items_dropdown/items_dropdown.dart';
import '../sell_template_purchase_type/sell_template_purchase_type.dart';
import 'sell_form_template_controller.dart';
import 'sell_form_template_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class SellFormTemplate extends BaseStatelessWidget<SellFormTemplateController,
    SellFormTemplateCubit, SellFormTemplateState> {
  final VoidCallback? onTransactionCreated;
  final VoidCallback? closeTemplate;
  final Color? color;
  List<Trucks> trucks;
  List<Customers> customers;

  SellFormTemplate(
      {Key? key,
      super.controller,
      super.onStateChanged,
      this.onTransactionCreated,
      this.closeTemplate,
      this.color,
      required this.customers,
      required this.trucks})
      : super(key: key);
  GetTransactionsByCustomerIdController getTransactionsByCustomerIdController = GetTransactionsByCustomerIdController();
  BluetoothPrintPrintReceiptController bluetoothPrintPrintReceiptController = BluetoothPrintPrintReceiptController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SellFormTemplateCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<SellFormTemplateCubit, SellFormTemplateState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          if (usbSerialService.status == "Connected") {
            getCubit(context).setLotSize(1);
          }
          final isLargeScreen = MediaQuery.of(context).size.width > 600;
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: edge_insets_t_12,
                padding: edge_insets_x_8_t_16_b_6,
                decoration: BoxDecoration(
                  color: color,
                  border: borders.b_1px_bgPrimary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TrucksDropdown(
                              trucks: trucks,
                              onChanged: (truck) {
                                getCubit(context).setSelectedTruck(truck);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: ItemsDropdown(
                              onChanged: (item) =>
                                  getCubit(context).setSelectedItem(item),
                              selectedTruck: state.selectedTruck,
                              selectedItem: state.selectedItem,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // state.selectedTruck != null ?
                    Container(
                      margin: edge_insets_t_4,
                      height: 83,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          state.selectedTruck != null
                              ? Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.white09,
                                      ),
                                      height: 83,
                                      width: isLargeScreen
                                          ? MediaQuery.sizeOf(context).width *
                                              0.3 // Adjust width for large screens
                                          : MediaQuery.sizeOf(context).width *
                                              0.6, // Adjust width for small screens
                                      child: Table(
                                        border: TableBorder.all(
                                            color: AppColors.grey4, width: 1),
                                        children: [
                                          TableRow(
                                            children: [
                                              TableCell(
                                                child: Icon(
                                                  Icons.fire_truck,
                                                  size: 25,
                                                ),
                                              ),
                                              TableCell(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text("Weight",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              Fonts.f600)),
                                                ),
                                              ),
                                              TableCell(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text("Lotsize",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              Fonts.f600)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          TableRow(
                                            children: [
                                              TableCell(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text("Actual",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              Fonts.f600)),
                                                ),
                                              ),
                                              TableCell(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                      "${state.selectedTruck!.weight} kg", style: TextStyle(
                                                  ),),
                                                ),
                                              ),
                                              TableCell(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                      "${state.selectedTruck!.lotsize}"),
                                                ),
                                              ),
                                            ],
                                          ),
                                          TableRow(
                                            children: [
                                              TableCell(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text("Current",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              Fonts.f600)),
                                                ),
                                              ),
                                              TableCell(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                      "${state.selectedTruck!.currentweight} kg"),
                                                ),
                                              ),
                                              TableCell(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                      "${state.selectedTruck!.currentlotsize}"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Container(
                                  child: Text(
                                    "🚚",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(fontSize: 60),
                                  ),
                                ),
                          SizedBox(width: 10),
                          Flexible(
                            child: Container(
                              child: state.selectedTruck != null &&
                                      state.selectedCustomer != null
                                  ? GetTransactionsByTruckCustomer(
                                      key: ValueKey(
                                          "${state.selectedTruck!.id!}_${state.selectedCustomer!.id!}"),
                                      truckId: state.selectedTruck!.id!,
                                      customerId: state.selectedCustomer!.id!,
                                    )
                                  : SizedBox(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // : SizedBox(),
                    Container(
                      // margin: edge_insets_t_4,
                      child: Row(
                        children: [
                          CustomerDropdown(
                            onChanged: (customer) {
                              getCubit(context).setSelectedCustomer(customer);
                            },
                            customers: customers,
                          ),
                          SizedBox(width: 5),
                          usbSerialService.status == "Connected"
                              ? Expanded(
                              child: StreamBuilder<double>(
                                stream: usbSerialService.weightStream,
                                // Listen to the weight stream
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    getCubit(context)
                                        .setItemWeight(snapshot.data!);
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: borderRadius.br_5,
                                        border: borders.b_1px_bgPrimary,
                                        color: AppColors.white09
                                      ),
                                      child: Text(snapshot.data!.toStringAsFixed(2), style: TextStyle(fontSize: Fonts.fontSize16),),
                                    );
                                  } else {
                                    return Container(
                                        child: Text("No data"));
                                  }
                                },
                              )
                          )
                              : Expanded(
                                  child: TextFormField(
                                    decoration: InputStyles.formTemplateInput(
                                        hintText: 'weight'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) => getCubit(context)
                                        .setItemWeight(double.tryParse(value)),
                                  ),
                                ),

                          BluetoothPrintPrintReceipt(
                            controller:
                            bluetoothPrintPrintReceiptController,
                            onStateChanged:
                                (bluetoothPrintPrintReceiptState) {},
                          ),
                          state.selectedCustomer != null?
                          GetTransactionsByCustomerId(
                            key: ValueKey(state.selectedCustomer!.id!),
                            controller: getTransactionsByCustomerIdController,
                              customerId: state.selectedCustomer!.id!
                          ): SizedBox(),
                          IconButton(
                              style: IconButton.styleFrom(
                                backgroundColor: AppColors.bgPrimary,
                              ),
                              onPressed: (state.bluetoothState
                                  ?.bluetoothStatus ==
                                  BooleanStatus.pending || state.selectedCustomer == null)
                                  ? null
                                  : () async {
                                await bluetoothPrintPrintReceiptController
                                    .getChildCubit()
                                    .printReceipt(bluetoothPrintPrintReceiptController
                                    .getChildCubit()
                                    .createRequestData(
                                    data: BluetoothReceiptUtils.getPrintReceiptText(
                                        state.selectedCustomer!.name!,
                                        state.getTransactionsByCustomerIdResponse ?? [],
                                        BluetoothReceiptUtils.generateBarcodeContent(state.selectedCustomer!.id!)
                                    )));
                              },
                              icon: Icon(Icons.print_outlined)),
                        ],
                      ),
                    ),
                    Container(
                      // padding: edge_insets_t_4,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: isLargeScreen
                                ? MediaQuery.sizeOf(context).width * 0.15
                                : MediaQuery.sizeOf(context).width * 0.3,
                            child: Row(
                              children: [
                                usbSerialService.status == "Connected"
                                ? Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: borderRadius.br_5,
                                        border: borders.b_1px_bgPrimary,
                                        color: AppColors.white09
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '1',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                )
                                : Expanded(
                                  child: TextFormField(
                                    initialValue:
                                    state.lotSize?.toString() ?? "",
                                    decoration: InputStyles.formTemplateInput(
                                      hintText: 'bags',
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) => getCubit(context)
                                        .setLotSize(int.tryParse(value)),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputStyles.formTemplateInput(
                                      hintText: 'price',
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) => getCubit(context)
                                        .setConstPrice(double.tryParse(value)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                              child: Wrap(
                            spacing: 8,
                            runSpacing: 4,
                            alignment: WrapAlignment.end,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              SellTemplatePurchaseType(
                                onPurchaseTypeChange: (purchaseType) =>
                                    getCubit(context)
                                        .setPurchaseType(purchaseType),
                                purchaseType: state.purchaseType,
                              ),
                              Container(
                                height: 35,
                                child: ElevatedButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: AppColors.bgPrimary,
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: borderRadius.br_5),
                                        padding: edge_insets_x_24),
                                    onPressed: () async {
                                      await getCubit(context).createTransaction(
                                          getCubit(context)
                                              .createRequestData());
                                      onTransactionCreated?.call();
                                      getCubit(context).clearFormFields();
                                      logger.d("clear");
                                    },
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(color: AppColors.white),
                                    )),
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                  onTap: () {
                    closeTemplate?.call();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: borderRadius.br_100,
                        color: AppColors.white09),
                    child: Icon(
                      Icons.cancel_outlined,
                      color: AppColors.bgPrimary,
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }

  @override
  SellFormTemplateCubit createCubitAndAssignToController(BuildContext context) {
    SellFormTemplateCubit cubit = SellFormTemplateCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
