import 'package:basic/app/escale/models/customer_models.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/shadows.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../themes/input_styles.dart';
import 'get_all_customers_controller.dart';
import 'get_all_customers_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class GetAllCustomers extends BaseStatelessWidget<GetAllCustomersController,
    GetAllCustomersCubit, GetAllCustomersState> {
  GetAllCustomers({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllCustomersCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<GetAllCustomersCubit, GetAllCustomersState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return state.getAllCustomersResponse != null
              ? state.getAllCustomersResponse != null &&
                      state.getAllCustomersResponse!.isNotEmpty
                  ? ListView.builder(
                      itemCount: state.getAllCustomersResponse!.length,
                      itemBuilder: (context, index) {
                        final customer = state.getAllCustomersResponse![index];
                        return Container(
                          margin: edge_insets_x_16,
                          padding: edge_insets_t_16,
                          child: InkWell(
                            child: Container(
                              padding: edge_insets_10,
                              decoration: BoxDecoration(
                                  border: borders.b_1px_grey4,
                                  borderRadius: borderRadius.br_10),
                              child: Text(
                                customer.name!,
                                style: TextStyle(
                                    fontWeight: Fonts.f500,
                                    fontSize: Fonts.fontSize16),
                              ),
                            ),
                          ),
                        );
                      })
                  : Center(
                      child: Container(
                        margin: edge_insets_t_16,
                        child: Column(
                          children: [
                            Image.asset("images/nothing.png"),
                            Text(
                              "Oh no! you have to add something",
                              style: TextStyle(
                                  fontWeight: Fonts.f500,
                                  fontSize: Fonts.fontSize16),
                            ),
                            Text(
                              "There are nothing present",
                              style: TextStyle(fontSize: Fonts.fontSize16),
                            )
                          ],
                        ),
                      ),
                    )
              : Center(
                  child: Container(
                  height: 100,
                  width: MediaQuery.sizeOf(context).width / 1.5,
                  margin: edge_insets_t_70,
                  // padding: edge_insets_20,
                  decoration: BoxDecoration(
                      boxShadow: const [shadows.bs_primary],
                      color: AppColors.white,
                      borderRadius: borderRadius.br_10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoadingAnimationWidget.discreteCircle(
                          color: AppColors.bgPrimary,
                          size: 50,
                          secondRingColor: AppColors.bmiTracker,
                          thirdRingColor: AppColors.waterPrimary),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Loading \n Please wait",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: Fonts.f500, fontSize: Fonts.fontSize18),
                      )
                    ],
                  ),
                ));
        },
      ),
    );
  }

  @override
  GetAllCustomersCubit createCubitAndAssignToController(BuildContext context) {
    GetAllCustomersCubit cubit = GetAllCustomersCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}

// class CustomerDropdown extends GetAllCustomers {
//   final Function(Customers?)? onChanged;
//
//   CustomerDropdown({Key? key, this.onChanged}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<GetAllCustomersCubit>(
//       create: (context) => createCubitAndAssignToController(context),
//       child: BlocConsumer<GetAllCustomersCubit, GetAllCustomersState>(
//         listener: (context, state) {
//           if (onStateChanged != null) {
//             onStateChanged!(state);
//           }
//         },
//         builder: (context, state) {
//           initializeController(context);
//           final customers = state.getAllCustomersResponse;
//
//           return Container(
//               width: MediaQuery.of(context).size.width,
//               child: DropdownButtonFormField(
//                 decoration: InputStyles.formTemplateInput(),
//                 hint: Text("Select Customer"),
//                 items: customers?.map((customer) => DropdownMenuItem(
//                   value: customer,
//                   child: Container(
//                     width: MediaQuery.sizeOf(context).width * 0.7,
//                     child: Text(customer.name!),
//                   ),
//                 ))
//                     .toList(),
//                 onChanged: onChanged,
//                 menuMaxHeight: 300,
//                 dropdownColor: AppColors.white,
//               )
//           );
//         },
//       ),
//     );
//   }
// }
