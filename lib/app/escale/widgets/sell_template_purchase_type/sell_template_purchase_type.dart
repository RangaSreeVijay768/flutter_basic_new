import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'sell_template_purchase_type_controller.dart';
import 'sell_template_purchase_type_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class SellTemplatePurchaseType extends BaseStatelessWidget<SellTemplatePurchaseTypeController,
    SellTemplatePurchaseTypeCubit,
    SellTemplatePurchaseTypeState> {

  final ValueChanged<String>? onPurchaseTypeChange;
  final String? purchaseType;

  SellTemplatePurchaseType({
    Key? key,
    super.controller,
    super.onStateChanged,
    this.onPurchaseTypeChange,
    this.purchaseType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SellTemplatePurchaseTypeCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<SellTemplatePurchaseTypeCubit,
          SellTemplatePurchaseTypeState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container(
            decoration: BoxDecoration(
                border: borders.b_1px_bgPrimary,
                borderRadius: borderRadius.br_5,
                color: AppColors.white04
            ),
            child: Wrap(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: edge_insets_x_4_y_1,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius.br_5,
                    color: purchaseType == "UPI"
                  ? AppColors.white
                    : null,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 30,
                        child: Radio<String>(
                          value: "UPI",
                          groupValue: purchaseType,
                          onChanged: (value) {
                            if (onPurchaseTypeChange != null) {
                              onPurchaseTypeChange!("UPI");
                            }
                          },
                          visualDensity: VisualDensity.compact,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (onPurchaseTypeChange != null) {
                            onPurchaseTypeChange!("UPI");
                          }
                        },
                        child: Text("UPI"),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: edge_insets_x_4_y_1,
                  decoration: BoxDecoration(
                    color: purchaseType == "CASH"
                        ? AppColors.white
                        : null,
                    borderRadius: borderRadius.br_5
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 30,
                        child: Radio<String>(
                          value: "CASH",
                          groupValue: purchaseType,
                          onChanged: (value) {
                            if (onPurchaseTypeChange != null) {
                              onPurchaseTypeChange!("CASH");
                            }
                          },
                          visualDensity: VisualDensity.compact,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (onPurchaseTypeChange != null) {
                            onPurchaseTypeChange!("CASH");
                          }
                        },
                        child: Text("CASH"),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: edge_insets_x_4_y_1,
                  decoration: BoxDecoration(
                    color: purchaseType == "CREDIT"
                        ? AppColors.white
                        : null,
                    borderRadius: borderRadius.br_5
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 30,
                        child: Radio<String>(
                          value: "CREDIT",
                          groupValue: purchaseType,
                          onChanged: (value) {
                            if (onPurchaseTypeChange != null) {
                              onPurchaseTypeChange!("CREDIT");
                            }
                          },
                          visualDensity: VisualDensity.compact,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (onPurchaseTypeChange != null) {
                            onPurchaseTypeChange!("CREDIT");
                          }
                        },
                        child: Text("CRED"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  SellTemplatePurchaseTypeCubit createCubitAndAssignToController(
      BuildContext context) {
    SellTemplatePurchaseTypeCubit cubit = SellTemplatePurchaseTypeCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
