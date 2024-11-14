import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/input_styles.dart';
import '../../models/truck_models.dart';
import '/app/themes/borders.dart';
import 'package:go_router/go_router.dart';

import 'items_dropdown_controller.dart';
import 'items_dropdown_cubit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '/app/core/widgets/base_stateless_widget.dart';

class ItemsDropdown extends BaseStatelessWidget<ItemsDropdownController,
    ItemsDropdownCubit,
    ItemsDropdownState> {
  final Function(String?)? onChanged;
  final Trucks? selectedTruck;
  final String? selectedItem;

  ItemsDropdown({
    Key? key,
    super.controller,
    super.onStateChanged,
    this.onChanged,
    this.selectedItem,
    this.selectedTruck,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ItemsDropdownCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<ItemsDropdownCubit, ItemsDropdownState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final itemsString = selectedTruck?.items;
          final items = itemsString != null
              ? itemsString.split(',').map((item) => item.trim()).toList()
              : [];
          final isLargeScreen = MediaQuery.of(context).size.width > 600;
          final dropdownWidth = isLargeScreen
              ? MediaQuery.of(context).size.width * 0.225
              : MediaQuery.of(context).size.width * 0.45;

          return Container(
            width: dropdownWidth,
            child: DropdownButtonFormField2<String>(
              decoration: InputStyles.formTemplateInput(),
              value: selectedItem,
              hint: Container(
                width: dropdownWidth * 0.65, // Adjust width as needed
                child: const Text(
                  "Select Item",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: AppColors.grey1),
                ),
              ),
              items: items.isNotEmpty
                  ? items.map((item) => DropdownMenuItem<String>(
                value: item,
                child: Container(
                  width: dropdownWidth * 0.65,
                  child: Text(item),
                ),
              )).toList()
                  : null,
              onChanged: onChanged,
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  border: borders.b_2px_bgLightBlue,
                  color: AppColors.white,
                ),
                maxHeight: 200,
                width: dropdownWidth,
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: WidgetStateProperty.all<double>(6),
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
  ItemsDropdownCubit createCubitAndAssignToController(BuildContext context) {
    ItemsDropdownCubit cubit = ItemsDropdownCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
