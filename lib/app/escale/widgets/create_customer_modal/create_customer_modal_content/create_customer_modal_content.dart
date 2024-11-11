import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/shadows.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/edge_insets.dart';
import '../../../../themes/fonts.dart';
import '../create_customer_modal_data.dart';
import 'create_customer_modal_content_controller.dart';
import 'create_customer_modal_content_cubit.dart';

import 'package:basic/app/core/modals/base_modal_content/base_modal_content_widget.dart';

class CreateCustomerModalContent
    extends BaseModalContent<
        CreateCustomerModalContentController,
        CreateCustomerModalContentCubit,
        CreateCustomerModalContentState,
        CreateCustomerModalData> {

  CreateCustomerModalContent({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateCustomerModalContentCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          CreateCustomerModalContentCubit,
          CreateCustomerModalContentState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container(
            height: MediaQuery.of(context).size.height / 1.3,
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
                        'Create Customer',
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
                  child: Container(),
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
                          onPressed: () {},
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
  CreateCustomerModalContentCubit createCubitAndAssignToController(
      BuildContext context) {
    CreateCustomerModalContentCubit cubit = CreateCustomerModalContentCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
