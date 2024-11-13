import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'get_transactions_by_customer_id_controller.dart';
import 'get_transactions_by_customer_id_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class GetTransactionsByCustomerId
    extends BaseStatelessWidget<GetTransactionsByCustomerIdController,
        GetTransactionsByCustomerIdCubit,
        GetTransactionsByCustomerIdState> {
  int customerId;
  GetTransactionsByCustomerId(
      {Key? key, super.controller, super.onStateChanged, required this.customerId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetTransactionsByCustomerIdCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          GetTransactionsByCustomerIdCubit,
          GetTransactionsByCustomerIdState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return SizedBox();
        },
      ),
    );
  }

  @override
  GetTransactionsByCustomerIdCubit createCubitAndAssignToController(
      BuildContext context) {
    GetTransactionsByCustomerIdCubit cubit = GetTransactionsByCustomerIdCubit(
        context: context, customerId: customerId);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
