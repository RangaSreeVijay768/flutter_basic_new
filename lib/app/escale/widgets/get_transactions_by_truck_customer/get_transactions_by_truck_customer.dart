import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';

import 'get_transactions_by_truck_customer_controller.dart';
import 'get_transactions_by_truck_customer_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class GetTransactionsByTruckCustomer extends BaseStatelessWidget<
    GetTransactionsByTruckCustomerController,
    GetTransactionsByTruckCustomerCubit,
    GetTransactionsByTruckCustomerState> {
  int customerId;
  int truckId;

  GetTransactionsByTruckCustomer(
      {Key? key, super.controller, super.onStateChanged, required this.truckId, required this.customerId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetTransactionsByTruckCustomerCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          GetTransactionsByTruckCustomerCubit,
          GetTransactionsByTruckCustomerState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return state.getTransactionsByTruckAndCustomerResponse != null
          ? ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.getTransactionsByTruckAndCustomerResponse!.length,
              itemBuilder: (context, index) {
              final transaction = state.getTransactionsByTruckAndCustomerResponse![index];
                return Container(
                  child: Padding(
                    padding: edge_insets_y_8,
                    child: Column(
                      children: [
                        Text(" ${transaction.wt ?? ""} kg ⚖️", style: TextStyle(
                          fontWeight: Fonts.f500,
                          fontSize: Fonts.fontSize16
                        ),),
                        SizedBox(width: 8),
                        Text("${transaction.bg ?? ""} bags 🎒", style: TextStyle(
                            fontWeight: Fonts.f500,
                            fontSize: Fonts.fontSize16
                        ),),
                      ],
                    ),
                  ),
                );
              }
          )
          : Center(
            child: Padding(
              padding: edge_insets_y_8,
              child: Column(
                children: [
                  Text(" kg ⚖️", style: TextStyle(
                      fontWeight: Fonts.f500,
                      fontSize: Fonts.fontSize16
                  ),),
                  SizedBox(width: 8),
                  Text(" bags 🎒", style: TextStyle(
                      fontWeight: Fonts.f500,
                      fontSize: Fonts.fontSize16
                  ),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  GetTransactionsByTruckCustomerCubit createCubitAndAssignToController(
      BuildContext context) {
    GetTransactionsByTruckCustomerCubit cubit = GetTransactionsByTruckCustomerCubit(
        context: context, customerId: customerId, truckId: truckId);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
