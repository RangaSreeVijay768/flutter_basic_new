import 'package:basic/app/core/widgets/app_scaffold.dart';
import 'package:basic/app/escale/widgets/create_customer_modal/create_customer_modal.dart';
import 'package:basic/app/escale/widgets/get_all_customers/get_all_customers.dart';
import 'package:basic/app/escale/widgets/get_all_customers/get_all_customers_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';

import '../../../core/database/boolean_status.dart';
import 'customer_screen_controller.dart';
import 'customer_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class CustomerScreen extends BaseStatelessWidget<CustomerScreenController,
    CustomerScreenCubit, CustomerScreenState> {
  CustomerScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);
  GetAllCustomersController getAllCustomersController =
      GetAllCustomersController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CustomerScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<CustomerScreenCubit, CustomerScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return AppScaffold(
            appBarTitle: Text("Customers"),
            body: Container(
              child: GetAllCustomers(
                controller: getAllCustomersController,
                onStateChanged: (getAllCustomersState) =>
                    getCubit(context).emitState(state.copyWith(
                        getAllCustomersState: getAllCustomersState)),
              ),
            ),
            floatingActionButton: CreateCustomerModal(
              onModalClosed: (modalData) async {
                if (modalData.status == BooleanStatus.success) {
                  await getAllCustomersController.getChildCubit().getAllCustomers(
                      getAllCustomersController
                          .getChildCubit()
                          .createRequestData());
                }
              },
            ),
          );
        },
      ),
    );
  }

  @override
  CustomerScreenCubit createCubitAndAssignToController(BuildContext context) {
    CustomerScreenCubit cubit = CustomerScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
