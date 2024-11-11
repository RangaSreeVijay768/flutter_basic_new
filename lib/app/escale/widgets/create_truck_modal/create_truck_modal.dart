import 'package:basic/app/escale/models/item_models.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/shadows.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:basic/app/core/modals/base_modal/base_modal_widget.dart';
import 'package:go_router/go_router.dart';
import '../../../themes/app_colors.dart';
import 'create_truck_modal_content/create_truck_modal_content.dart';
import 'create_truck_modal_controller.dart';
import 'create_truck_modal_cubit.dart';
import 'create_truck_modal_data.dart';


class CreateTruckModal
    extends BaseModalWidget<CreateTruckModalController,
        CreateTruckModalCubit,
        CreateTruckModalState,
        CreateTruckModalData> {
  List<Items> items;

  CreateTruckModal(
      {Key? key, super.controller, super.onStateChanged, super.onModalClosed, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateTruckModalCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<CreateTruckModalCubit, CreateTruckModalState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container(
            decoration: BoxDecoration(
                boxShadow: const [shadows.bs_primary],
                borderRadius: borderRadius.br_30
            ),
            // alignment: Alignment.centerRight,
            margin: edge_insets_24,
            // padding: edge_insets_x_24,
            child: IconButton(
              padding: edge_insets_16,
              style: IconButton.styleFrom(backgroundColor: AppColors.bgPrimary2),
              color: AppColors.white,
              icon: Icon(
                Icons.add,
                size: 28,
              ),
              onPressed: () {
                openModal(context: context, cubit: getCubit(context));
              },
            ),
          );
        },
      ),
    );
  }

  @override
  CreateTruckModalCubit createCubitAndAssignToController(BuildContext context) {
    CreateTruckModalCubit cubit = CreateTruckModalCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

  @override
  Widget getModalContentWidget({required BuildContext context}) {
    return CreateTruckModalContent(items: items,);
  }
}
