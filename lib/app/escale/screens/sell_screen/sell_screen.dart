import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/logger/log.dart';
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

  @override
  Widget build(BuildContext context) {
    if (sellFormTemplateControllers.isEmpty) {
      sellFormTemplateControllers.add(SellFormTemplateController());
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
            appBarTitle: Text("Sell"),
            body: SingleChildScrollView(
              // padding: edge_insets_16,
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
                            width: constraints.maxWidth / columns-12,
                            child: SellFormTemplate(
                              key: ValueKey(controller),
                              customers: state.getAllCustomersResponse ?? [],
                              trucks: state.getAllTrucksResponse ?? [],
                              controller: controller,
                              closeTemplate: () {
                                sellFormTemplateControllers.remove(controller);
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
                              color: (AppColors.formTemplateColors)[index % (AppColors.formTemplateColors).length],
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
                var newController = SellFormTemplateController();
                sellFormTemplateControllers.add(newController);
                (context as Element).markNeedsBuild();
              },
              child: Icon(Icons.add),
            ),
            // bottomNavigationBar: Container(
            //   padding: edge_insets_y_10,
            //   decoration: const BoxDecoration(
            //       color: AppColors.white,
            //       boxShadow: [shadows.bs_primary]),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Container(
            //         width: MediaQuery.of(context).size.width / 2,
            //         child: TextButton(
            //           style: TextButton.styleFrom(
            //             backgroundColor: AppColors.bgPrimary,
            //           ),
            //           onPressed: (state.loadingButton == true)
            //               ? null
            //               : () async {
            //             getCubit(context).setLoadingButtonStatus(true);
            //             var completedControllers = sellFormTemplateControllers
            //                 .where((controller) => controller.getChildCubit().isFormComplete())
            //                 .toList();
            //
            //             for (var controller in completedControllers) {
            //               await controller
            //                   .getChildCubit()
            //                   .createTransaction(controller.getChildCubit().createRequestData());
            //             }
            //
            //             sellFormTemplateControllers.clear();
            //             sellFormTemplateControllers.add(SellFormTemplateController());
            //
            //             await getAllTransactionsController
            //                 .getChildCubit()
            //                 .getAllTransactions(getAllTransactionsController.getChildCubit().createRequestData());
            //
            //             getCubit(context).setLoadingButtonStatus(false);
            //           },
            //           child: const Text(
            //             "Submit",
            //             style: TextStyle(color: AppColors.white),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          );
        },
      ),
    );
  }
  @override
  SellScreenCubit createCubitAndAssignToController(BuildContext context) {
    SellScreenCubit cubit = SellScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
