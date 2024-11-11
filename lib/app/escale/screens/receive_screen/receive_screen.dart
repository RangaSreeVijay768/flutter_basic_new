import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/escale/widgets/create_truck_modal/create_truck_modal.dart';
import 'package:basic/app/escale/widgets/get_all_trucks/get_all_trucks_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';

import '../../../core/widgets/app_scaffold.dart';
import '../../widgets/create_customer_modal/create_customer_modal.dart';
import '../../widgets/get_all_trucks/get_all_trucks.dart';
import 'receive_screen_controller.dart';
import 'receive_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class ReceiveScreen extends BaseStatelessWidget<ReceiveScreenController,
    ReceiveScreenCubit, ReceiveScreenState> {
  ReceiveScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);
  GetAllTrucksController getAllTrucksController = GetAllTrucksController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReceiveScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<ReceiveScreenCubit, ReceiveScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return AppScaffold(
            appBarTitle: Text("Receive"),
            body: Container(
              child: GetAllTrucks(
                controller: getAllTrucksController,
                onStateChanged: (getAllTrucksState) => getCubit(context)
                    .emitState(
                        state.copyWith(getAllTrucksState: getAllTrucksState)),
              ),
            ),
            floatingActionButton: CreateTruckModal(
              items: state.getAllItemsResponse ?? [],
              onModalClosed: (modalData) async {
                if (modalData.status == BooleanStatus.success) {
                  await getAllTrucksController.getChildCubit().getAllTrucks(
                      getAllTrucksController
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
  ReceiveScreenCubit createCubitAndAssignToController(BuildContext context) {
    ReceiveScreenCubit cubit = ReceiveScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
