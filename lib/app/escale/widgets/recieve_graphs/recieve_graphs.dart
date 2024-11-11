
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../themes/fonts.dart';
import '../../models/truck_models.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'recieve_graphs_controller.dart';
import 'recieve_graphs_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class RecieveGraphs extends BaseStatelessWidget<RecieveGraphsController,
    RecieveGraphsCubit,
    RecieveGraphsState> {
  int? toY1;
  int? toY2;
  int? barWidth;
  Color? color1;
  Color? color2;
    RecieveGraphs({Key? key, super.controller, super.onStateChanged, this.color1, this.color2, this.toY1, this.toY2, this.barWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecieveGraphsCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<RecieveGraphsCubit, RecieveGraphsState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceEvenly,
              maxY: toY1!.toDouble(), // Max value for y-axis scaling
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      toY: toY1!.toDouble(),
                      color: Colors.purple,
                      width: barWidth!.toDouble(),
                      borderRadius: BorderRadius.zero,
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(
                      toY: toY2!.toDouble(),
                      color: Colors.orange,
                      width: barWidth!.toDouble(),
                      borderRadius: BorderRadius.zero,
                    ),
                  ],
                ),
              ],
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 20,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      switch (value.toInt()) {
                        case 0:
                          return Text(
                            toY1.toString(),
                            style: TextStyle(fontSize: Fonts.fontSize14, fontWeight: Fonts.f600),
                          );
                        case 1:
                          return Text(
                            toY2.toString(),
                            style: TextStyle(fontSize: Fonts.fontSize14, fontWeight: Fonts.f600),
                          );
                        default:
                          return Container();
                      }
                    },
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(
                border: Border.all(color: Colors.grey, width: 1),
              ),
              gridData: FlGridData(show: true),
            ),
          );
        },
      ),
    );
  }

  @override
  RecieveGraphsCubit createCubitAndAssignToController(BuildContext context) {
    RecieveGraphsCubit cubit = RecieveGraphsCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
