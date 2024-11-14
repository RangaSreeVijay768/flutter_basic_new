import 'package:basic/app/escale/models/truck_models.dart';
import 'package:basic/app/escale/widgets/recieve_graphs/recieve_graphs.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/shadows.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:intl/intl.dart';
import '../../../themes/input_styles.dart';
import 'get_all_trucks_controller.dart';
import 'get_all_trucks_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class GetAllTrucks
    extends BaseStatelessWidget<GetAllTrucksController,
        GetAllTrucksCubit,
        GetAllTrucksState> {

  GetAllTrucks({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllTrucksCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<GetAllTrucksCubit, GetAllTrucksState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final List<Color> backgroundColors = [
            AppColors.truck1,
            AppColors.truck2,
            AppColors.truck3,
          ];

          return state.getAllTrucksResponse != null
              ? state.getAllTrucksResponse!.isNotEmpty
              ? Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                padding: edge_insets_y_16,
                margin: edge_insets_x_16,
                decoration: BoxDecoration(
                  color: Color(0xFFbc52aa),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Text(
                  "Trucks received in last 5 days",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Fonts.fontSize18,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.getAllTrucksResponse!.length,
                  itemBuilder: (context, index) {
                    String _formatDate(DateTime? date) {
                      if (date == null) return 'N/A';
                      return DateFormat('dd-MM-yyyy').format(date);
                    }
                    final truck = state.getAllTrucksResponse![index];
                    final backgroundColor =
                    backgroundColors[index % backgroundColors.length];

                    return Container(
                      margin: edge_insets_x_16,
                      padding: edge_insets_t_16,
                      child: Container(
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          border: borders.b_1px_grey4,
                          borderRadius: borderRadius.br_10,
                        ),
                        child: Container(
                          padding: edge_insets_8,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    // width: MediaQuery.sizeOf(context).width/3,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.local_shipping),
                                            SizedBox(width: 8),
                                            Expanded(child: Text("${truck.name} - ${truck.number}",
                                              style: TextStyle(
                                                fontWeight: Fonts.f500,
                                                fontSize: Fonts.fontSize16,
                                              ),
                                            )),
                                          ],
                                        ),
                                        SizedBox(height: 8,),
                                        _buildInfoRow("Received date: ", _formatDate(truck.createdAt)),
                                        SizedBox(height: 8,),
                                        _buildInfoRow("Items:", truck.items!),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.sizeOf(context).width/5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text("Weight\n (Actual | Current)",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: Fonts.f500
                                            ),),
                                        ),
                                        Container(
                                          height: 100,
                                          width: MediaQuery.sizeOf(context).width / 3,
                                          child: RecieveGraphs(
                                            barWidth: 23,
                                            toY1: truck.weight,
                                            toY2: truck.currentweight!.toInt(),
                                            color1: AppColors.bar1,
                                            color2: AppColors.bar2,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Container(
                                    width: MediaQuery.sizeOf(context).width/5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text("LotSize\n (Actual | Current)",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: Fonts.f500
                                            ),),
                                        ),
                                        Container(
                                          height: 100,
                                          width: MediaQuery.sizeOf(context).width / 3,
                                          child: RecieveGraphs(
                                            barWidth: 23,
                                            toY1: truck.lotsize,
                                            toY2: truck.currentlotsize,
                                            color1: AppColors.bar3,
                                            color2: AppColors.bar4,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     SizedBox(width: 10,),
                              //     SizedBox(width: 20,),
                              //     SizedBox(width: 10,),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
              : _buildEmptyState()
              : _buildLoadingState(context);
        },
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Container(
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: Fonts.f600,
              fontSize: Fonts.fontSize16,
              color: AppColors.grey1,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: Fonts.f500,
                fontSize: Fonts.fontSize16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Container(
        margin: edge_insets_t_16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/nothing.png"),
            Text(
              "Oh no! you have to add something",
              style: TextStyle(
                fontWeight: Fonts.f500,
                fontSize: Fonts.fontSize16,
              ),
            ),
            Text(
              "There are nothing present",
              style: TextStyle(
                fontSize: Fonts.fontSize16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: MediaQuery.sizeOf(context).width / 1.5,
        decoration: BoxDecoration(
          boxShadow: const [shadows.bs_primary],
          color: AppColors.white,
          borderRadius: borderRadius.br_10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.discreteCircle(
              color: AppColors.bgPrimary,
              size: 50,
              secondRingColor: AppColors.bmiTracker,
              thirdRingColor: AppColors.waterPrimary,
            ),
            const SizedBox(width: 20),
            Text(
              "Loading \n Please wait",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: Fonts.f500,
                fontSize: Fonts.fontSize18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  GetAllTrucksCubit createCubitAndAssignToController(BuildContext context) {
    GetAllTrucksCubit cubit = GetAllTrucksCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}



class GetAllTrucksNoTemplate extends GetAllTrucks{
  GetAllTrucksNoTemplate({Key? key, super.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllTrucksCubit>(
        create: (context) => createCubitAndAssignToController(context),
        child: BlocConsumer<GetAllTrucksCubit, GetAllTrucksState>(
          listener: (context, state){
            if (onStateChanged != null) {
              onStateChanged!(state);
            }
          },
          builder: (context, state) {
            initializeController(context);
            return Container();
          },),
    );
  }
}
