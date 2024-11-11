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

import 'get_all_transactions_controller.dart';
import 'get_all_transactions_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class GetAllTransactions extends BaseStatelessWidget<
    GetAllTransactionsController,
    GetAllTransactionsCubit,
    GetAllTransactionsState> {
  GetAllTransactions({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllTransactionsCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<GetAllTransactionsCubit, GetAllTransactionsState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          final width = MediaQuery.sizeOf(context).width;
          final largeScreen = width > 600;
          final landscape = MediaQuery.of(context).orientation == Orientation.landscape;
          initializeController(context);
          return state.getAllTransactionsResponse != null
              ? state.getAllTransactionsResponse != null &&
              state.getAllTransactionsResponse!.isNotEmpty
              ? Container(
            margin: edge_insets_x_5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // spacing: 8.0, // Horizontal spacing between items
              // runSpacing: 8.0, // Vertical spacing between rows
              children: List.generate(
                  largeScreen
                      ? landscape? 4 : 3
                      : 2,
                      (index) {
                    final transaction = state.getAllTransactionsResponse![index];
                    return Container(
                      width: largeScreen
                          ? landscape ? (width - (8.0 * 3)) / 4 : (width - (8.0 * 3)) / 3
                          : (width - (8.0 * 3)) / 2,
                      child: InkWell(
                        child: Container(
                          padding: edge_insets_5,
                          decoration: BoxDecoration(
                              color: transaction.purchasetype?.toLowerCase() == 'credit' || transaction.purchasetype?.toLowerCase() == 'cred'
                                  ? Color.fromRGBO(177, 238, 171, 1)
                                  : transaction.purchasetype?.toLowerCase() == 'upi'
                                  ? Color.fromRGBO(237, 145, 33, 1)
                                  : transaction.purchasetype?.toLowerCase() == 'cash'
                                  ? Color.fromRGBO(217, 141, 177, 1)
                                  : AppColors.transparent,
                              border: borders.b_1px_grey4,
                              borderRadius: borderRadius.br_10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${transaction.customer!.name!} - ${transaction.items}",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: Fonts.f500,
                                            fontSize: Fonts.fontSize16),
                                      ),
                                      Text(
                                        "${transaction.weight} kg - ${transaction.bags} bags",
                                        style: TextStyle(
                                            fontSize: Fonts.fontSize14),
                                      )
                                    ],
                                  )
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 35,
                                    child: IconButton(
                                        onPressed: (){},
                                        icon: Icon(Icons.edit, color: Colors.orangeAccent,)
                                    ),
                                  ),
                                  Container(
                                    height: 35,
                                    child: IconButton(
                                        onPressed: (){},
                                        icon: Icon(Icons.close, color: Colors.redAccent,)
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),
          )


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
  GetAllTransactionsCubit createCubitAndAssignToController(
      BuildContext context) {
    GetAllTransactionsCubit cubit = GetAllTransactionsCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
