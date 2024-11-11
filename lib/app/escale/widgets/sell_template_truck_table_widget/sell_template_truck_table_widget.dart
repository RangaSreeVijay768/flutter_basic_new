import 'package:basic/app/escale/models/truck_models.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/fonts.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'sell_template_truck_table_widget_controller.dart';
import 'sell_template_truck_table_widget_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class SellTemplateTruckTableWidget
    extends BaseStatelessWidget<SellTemplateTruckTableWidgetController,
        SellTemplateTruckTableWidgetCubit,
        SellTemplateTruckTableWidgetState> {
  Trucks? selectedTruck;
  SellTemplateTruckTableWidget(
      {Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SellTemplateTruckTableWidgetCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          SellTemplateTruckTableWidgetCubit,
          SellTemplateTruckTableWidgetState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final landscape = MediaQuery.of(context).orientation == Orientation.landscape;
          return landscape
              ? Table(
            border: TableBorder.all(
                color: AppColors.grey4, width: 1),
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Icon(
                      Icons.fire_truck,
                      size: 25,
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding:
                      const EdgeInsets.all(4.0),
                      child: Text("Weight",
                          style: TextStyle(
                              fontWeight: Fonts.f600)),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding:
                      const EdgeInsets.all(4.0),
                      child: Text("Lotsize",
                          style: TextStyle(
                              fontWeight: Fonts.f600)),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding:
                      const EdgeInsets.all(4.0),
                      child: Text("Actual",
                          style: TextStyle(
                              fontWeight: Fonts.f600)),
                    ),
                  ),
                  
                  TableCell(
                    child: Padding(
                      padding:
                      const EdgeInsets.all(4.0),
                      child: Text(
                          "${selectedTruck!.weight} kg"),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding:
                      const EdgeInsets.all(4.0),
                      child: Text(
                          "${selectedTruck!.lotsize}"),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding:
                      const EdgeInsets.all(4.0),
                      child: Text("Current",
                          style: TextStyle(
                              fontWeight: Fonts.f600)),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding:
                      const EdgeInsets.all(4.0),
                      child: Text(
                          "${selectedTruck!.currentweight} kg"),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding:
                      const EdgeInsets.all(4.0),
                      child: Text(
                          "${selectedTruck!.currentlotsize}"),
                    ),
                  ),
                ],
              ),
            ],
          ) 
              : Table(
            border: TableBorder.all(
                color: AppColors.grey4, width: 1),
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Icon(
                      Icons.fire_truck,
                      size: 25,
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding:
                      const EdgeInsets.all(4.0),
                      child: Text("Weight",
                          style: TextStyle(
                              fontWeight: Fonts.f600)),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding:
                      const EdgeInsets.all(4.0),
                      child: Text("Lotsize",
                          style: TextStyle(
                              fontWeight: Fonts.f600)),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding:
                      const EdgeInsets.all(4.0),
                      child: Text("Actual",
                          style: TextStyle(
                              fontWeight: Fonts.f600)),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding:
                      const EdgeInsets.all(4.0),
                      child: Text(
                          "${selectedTruck!.weight} kg"),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding:
                      const EdgeInsets.all(4.0),
                      child: Text(
                          "${selectedTruck!.lotsize}"),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding:
                      const EdgeInsets.all(4.0),
                      child: Text("Current",
                          style: TextStyle(
                              fontWeight: Fonts.f600)),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding:
                      const EdgeInsets.all(4.0),
                      child: Text(
                          "${selectedTruck!.currentweight} kg"),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding:
                      const EdgeInsets.all(4.0),
                      child: Text(
                          "${selectedTruck!.currentlotsize}"),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  SellTemplateTruckTableWidgetCubit createCubitAndAssignToController(
      BuildContext context) {
    SellTemplateTruckTableWidgetCubit cubit = SellTemplateTruckTableWidgetCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
