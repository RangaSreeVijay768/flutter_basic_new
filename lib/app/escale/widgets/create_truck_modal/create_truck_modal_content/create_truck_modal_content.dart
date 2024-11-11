import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/escale/models/item_models.dart';
import 'package:basic/app/escale/widgets/create_truck_form/create_truck_form.dart';
import 'package:basic/app/escale/widgets/create_truck_form/create_truck_form_controller.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/shadows.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../core/modals/modal_data.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/edge_insets.dart';
import '../../../../themes/fonts.dart';
import '../create_truck_modal_data.dart';
import 'create_truck_modal_content_controller.dart';
import 'create_truck_modal_content_cubit.dart';

import 'package:basic/app/core/modals/base_modal_content/base_modal_content_widget.dart';

class CreateTruckModalContent extends BaseModalContent<
    CreateTruckModalContentController,
    CreateTruckModalContentCubit,
    CreateTruckModalContentState,
    CreateTruckModalData> {
  List<Items> items;

  CreateTruckModalContent(
      {Key? key, super.controller, super.onStateChanged, required this.items})
      : super(key: key);
  CreateTruckFormController createTruckFormController =
      CreateTruckFormController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateTruckModalContentCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<CreateTruckModalContentCubit,
          CreateTruckModalContentState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container(
            height: MediaQuery.of(context).size.height / 1.2,
            decoration: const BoxDecoration(
              borderRadius: borderRadius.br_t_20,
              color: AppColors.white,
            ),
            child: Column(
              children: [
                Container(
                  padding: edge_insets_16,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: borderRadius.br_t_20,
                      border: borders.bb_1px_grey1,
                      boxShadow: [shadows.bs_grey]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Create Truck',
                        style: TextStyle(
                          color: AppColors.textHeading,
                          fontSize: Fonts.fontSize20,
                          fontWeight: Fonts.f700,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: IconButton.styleFrom(padding: edge_insets_0),
                          icon: const Icon(Icons.clear))
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: CreateTruckForm(
                    items: items,
                    controller: createTruckFormController,
                    onStateChanged: (createTruckFormState) => getCubit(context)
                        .emitState(state.copyWith(
                            createTruckFormState: createTruckFormState)),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: edge_insets_y_12,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      border: borders.bt_1px_grey2,
                      boxShadow: const [shadows.bs_primary]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                          style: TextButton.styleFrom(
                              padding: edge_insets_x_80_y_12,
                              backgroundColor: AppColors.bgPrimary2,
                              disabledBackgroundColor: AppColors.grey1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: borderRadius.br_5)),
                          onPressed:
                              (state.createTruckFormState?.createTruckStatus ==
                                          BooleanStatus.pending ||
                                      state.createTruckFormState?.formValid !=
                                          ControlStatus.valid ||
                                      state.loadingButton!)
                                  ? null
                                  : () async {
                                      getCubit(context)
                                          .setLoadingButtonStatus(true);
                                      await createTruckFormController
                                          .getChildCubit()
                                          .createTruck(createTruckFormController
                                              .getChildCubit()
                                              .createRequestData());
                                      closeModal(context,
                                          ModalData(status: BooleanStatus.success));
                                    },
                          child: state.loadingButton!
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                      color: Colors.white),
                                )
                              : Text(
                                  "Add",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: Fonts.f500,
                                      fontSize: Fonts.fontSize18),
                                ))
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  CreateTruckModalContentCubit createCubitAndAssignToController(
      BuildContext context) {
    CreateTruckModalContentCubit cubit =
        CreateTruckModalContentCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
