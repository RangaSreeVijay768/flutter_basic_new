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

import 'get_all_Items_controller.dart';
import 'get_all_Items_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class GetAllItems
    extends BaseStatelessWidget<GetAllItemsController,
        GetAllItemsCubit,
        GetAllItemsState> {

  GetAllItems({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllItemsCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<GetAllItemsCubit, GetAllItemsState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return state.getAllItemsResponse != null
              ? state.getAllItemsResponse != null  && state.getAllItemsResponse!.isNotEmpty
              ? ListView.builder(
              itemCount: state.getAllItemsResponse!.length,
              itemBuilder: (context, index){
                final item = state.getAllItemsResponse![index];
                return Container(
                  margin: edge_insets_t_20,
                  child: InkWell(
                    child: Text(item.name!, style: TextStyle(
                        fontWeight: Fonts.f500,
                        fontSize: Fonts.fontSize16
                    ),),
                  ),
                );
              }
          ): Center(
            child: Container(
              margin: edge_insets_t_16,
              child: Column(
                children: [
                  Image.asset("images/nothing.png"),
                  Text("Oh no! you have to add something", style: TextStyle(
                      fontWeight: Fonts.f500,
                      fontSize: Fonts.fontSize16
                  ),),
                  Text("There are nothing present", style: TextStyle(
                      fontSize: Fonts.fontSize16
                  ),)
                ],
              ),
            ),
          )
              : Center(
              child: Container(
                height: 100,
                width: MediaQuery.sizeOf(context).width/1.5,
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
                          fontWeight: Fonts.f500,
                          fontSize: Fonts.fontSize18),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }

  @override
  GetAllItemsCubit createCubitAndAssignToController(BuildContext context) {
    GetAllItemsCubit cubit = GetAllItemsCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
