import 'package:basic/app/escale/widgets/trucks_dropdown/trucks_dropdown_controller.dart';
import 'package:basic/app/escale/widgets/trucks_dropdown/trucks_dropdown_cubit.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../../themes/input_styles.dart';
import '../../models/truck_models.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class TrucksDropdown extends BaseStatelessWidget<TrucksDropdownController,
    TrucksDropdownCubit, TrucksDropdownState> {
  final Function(Trucks?)? onChanged;
  List<Trucks>? trucks;

  TrucksDropdown({Key? key, super.controller, super.onStateChanged, this.onChanged, this.trucks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrucksDropdownCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<TrucksDropdownCubit, TrucksDropdownState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final isLargeScreen = MediaQuery.of(context).size.width > 600;
          final dropdownWidth = isLargeScreen
              ? MediaQuery.of(context).size.width * 0.225
              : MediaQuery.of(context).size.width * 0.45;

          return Container(
            width: dropdownWidth,
            child: DropdownButtonFormField2<Trucks>(
              decoration: InputStyles.formTemplateInput(),
              value: state.sellFormTemplateState?.selectedTruck,
              hint: Container(
                width: dropdownWidth * 0.65,
                child: const Text(
                  "Select Truck",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: AppColors.grey1),
                ),
              ),
              items: trucks?.map((truck) => DropdownMenuItem<Trucks>(
                value: truck,
                child: Container(
                  width: dropdownWidth * 0.65,
                  child: Text(truck.name!),
                ),
              )).toList(),
              onChanged: onChanged,
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                    border: borders.b_2px_bgLightBlue,
                  color: AppColors.white
                ),
                maxHeight: 200,
                width: dropdownWidth,
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: WidgetStateProperty.all<double>(5),
                  thumbVisibility: WidgetStateProperty.all<bool>(true),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  TrucksDropdownCubit createCubitAndAssignToController(BuildContext context) {
    TrucksDropdownCubit cubit = TrucksDropdownCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
