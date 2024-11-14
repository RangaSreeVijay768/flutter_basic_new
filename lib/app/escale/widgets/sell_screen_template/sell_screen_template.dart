import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../bluetooth/widgets/bluetooth_print_print_receipt/bluetooth_print_print_receipt.dart';
import '../../../bluetooth/widgets/bluetooth_print_print_receipt/bluetooth_print_print_receipt_controller.dart';
import '../../../core/database/boolean_status.dart';
import '../../../core/services/usb_serial.dart';
import '../../../core/utils/bluetooth_receipt/bluetooth_receipt_utils.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/fonts.dart';
import '../../../themes/input_styles.dart';
import '../../models/customer_models.dart';
import '../../models/truck_models.dart';
import '../../request_response/get_transactions_by_customer_id/get_transactions_by_customer_id_response.dart';
import '../customer_dropdown/customer_dropdown.dart';
import '../get_transactions_by_customer_id/get_transactions_by_customer_id.dart';
import '../get_transactions_by_customer_id/get_transactions_by_customer_id_controller.dart';
import '../get_transactions_by_truck_customer/get_transactions_by_truck_customer.dart';
import '../items_dropdown/items_dropdown.dart';
import '../sell_template_purchase_type/sell_template_purchase_type.dart';
import '../trucks_dropdown/trucks_dropdown.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'sell_screen_template_controller.dart';
import 'sell_screen_template_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class SellScreenTemplate
    extends BaseStatelessWidget<SellScreenTemplateController,
        SellScreenTemplateCubit,
        SellScreenTemplateState> {
  final VoidCallback? onTransactionCreated;
  final VoidCallback? closeTemplate;
  final Color? color;
  List<Trucks> trucks;
  List<Customers> customers;

  SellScreenTemplate(
      {Key? key,
        super.controller,
        super.onStateChanged,
        this.onTransactionCreated,
        this.closeTemplate,
        this.color,
        required this.customers,
        required this.trucks})
      : super(key: key);

  GetTransactionsByCustomerIdController getTransactionsByCustomerIdController =
  GetTransactionsByCustomerIdController();
  BluetoothPrintPrintReceiptController bluetoothPrintPrintReceiptController =
  BluetoothPrintPrintReceiptController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SellScreenTemplateCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<SellScreenTemplateCubit, SellScreenTemplateState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final cubit = getCubit(context);

          return ValueListenableBuilder<String>(
            valueListenable: usbSerialService.statusNotifier,
            builder: (context, status, child) {
              if (status == "Connected") {
                cubit.setLotSize(1);
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
                                    cubit.setSelectedTruck(truck);
                                  },
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: ItemsDropdown(
                                  onChanged: (item) =>
                                      cubit.setSelectedItem(item),
                                  selectedTruck: state.selectedTruck,
                                  selectedItem: state.selectedItem,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: edge_insets_t_4,
                          child: Row(
                            children: [
                              CustomerDropdown(
                                onChanged: (customer) {
                                  cubit.setSelectedCustomer(customer);
                                },
                                customers: customers,
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputStyles.formTemplateInput(
                                    hintText: 'price',
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) => cubit
                                      .setConstPrice(double.tryParse(value)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GetTransactionsByTruckCustomer(
                                key: ValueKey(
                                    "${state.selectedTruck?.id!}_${state.selectedCustomer?.id!}"),
                                truckId: state.selectedTruck?.id! ?? 0,
                                customerId: state.selectedCustomer?.id! ?? 0,
                              ),
                            ),
                            BluetoothPrintPrintReceipt(
                              controller: bluetoothPrintPrintReceiptController,
                              onStateChanged: (bluetoothPrintPrintReceiptState) {},
                            ),
                            state.selectedCustomer != null
                                ? Container(
                              height: 30,
                              child: GetTransactionsByCustomerId(
                                  key: ValueKey(state.selectedCustomer!.id!),
                                  controller:
                                  getTransactionsByCustomerIdController,
                                  customerId: state.selectedCustomer!.id!),
                            )
                                : SizedBox(),
                            IconButton(
                                style: IconButton.styleFrom(
                                    backgroundColor: AppColors.bgPrimary,
                                    side: BorderSide(
                                        color: AppColors.grey1
                                    )
                                ),
                                onPressed:
                                (state.bluetoothState?.bluetoothStatus ==
                                    BooleanStatus.pending ||
                                    state.selectedCustomer == null)
                                    ? null
                                    : () async {
                                  List<GetTransactionsByCustomerIdResponse> transactions = await getTransactionsByCustomerIdController
                                      .getChildCubit()
                                      .getTransactionsByCustomerId(
                                      getTransactionsByCustomerIdController
                                          .getChildCubit()
                                          .createRequestData());
                                  await bluetoothPrintPrintReceiptController
                                      .getChildCubit()
                                      .printReceipt(bluetoothPrintPrintReceiptController
                                      .getChildCubit()
                                      .createRequestData(
                                      data: BluetoothReceiptUtils
                                          .getPrintReceiptText(
                                          state
                                              .selectedCustomer!
                                              .name!,
                                          transactions,
                                          BluetoothReceiptUtils
                                              .generateBarcodeContent(state
                                              .selectedCustomer!
                                              .id!))));
                                },
                                icon: Icon(Icons.print_outlined)),
                          ],
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: status == "Connected"
                                    ? isLargeScreen
                                    ? MediaQuery.sizeOf(context).width * 0.075
                                    : MediaQuery.sizeOf(context).width * 0.15
                                    : isLargeScreen
                                    ? MediaQuery.sizeOf(context).width * 0.15
                                    : MediaQuery.sizeOf(context).width * 0.3,
                                child: Row(
                                  children: [
                                    status == "Connected"
                                        ? SizedBox()
                                        : Expanded(
                                      child: TextFormField(
                                        initialValue:
                                        state.lotSize?.toString() ?? "",
                                        decoration:
                                        InputStyles.formTemplateInput(
                                          hintText: 'bags',
                                        ),
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) =>
                                            cubit.setLotSize(
                                                int.tryParse(value)),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    status == "Connected"
                                        ? Expanded(
                                        child: StreamBuilder<double>(
                                          stream: usbSerialService.weightStream,
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              cubit
                                                  .setItemWeight(snapshot.data!);
                                              return Container(
                                                padding: edge_insets_y_4,
                                                decoration: BoxDecoration(
                                                    borderRadius: borderRadius.br_5,
                                                    border: borders.b_1px_bgPrimary,
                                                    color: AppColors.white09),
                                                child: Text(
                                                  snapshot.data!
                                                      .toStringAsFixed(0),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: Fonts.fontSize16),
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                  child: Text("No data"));
                                            }
                                          },
                                        ))
                                        : Expanded(
                                      child: TextFormField(
                                        decoration: InputStyles.formTemplateInput(
                                            hintText: 'weight'),
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) => cubit
                                            .setItemWeight(double.tryParse(value)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 5),
                              Flexible(
                                  child: Wrap(
                                    spacing: 8,
                                    runSpacing: 4,
                                    alignment: WrapAlignment.end,
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    children: [
                                      SellTemplatePurchaseType(
                                        onPurchaseTypeChange: (purchaseType) =>
                                            cubit.setPurchaseType(purchaseType),
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
                                              await cubit.createTransaction(
                                                  cubit.createRequestData());
                                              onTransactionCreated?.call();
                                            },
                                            child: Text(
                                              "Submit",
                                              style: TextStyle(
                                                  color: AppColors.white),
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
          );
        },
      ),
    );
  }

  @override
  SellScreenTemplateCubit createCubitAndAssignToController(
      BuildContext context) {
    SellScreenTemplateCubit cubit = SellScreenTemplateCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
