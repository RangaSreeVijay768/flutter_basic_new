import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/input_styles.dart';
import '../../models/customer_models.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'customer_dropdown_controller.dart';
import 'customer_dropdown_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class CustomerDropdown extends BaseStatelessWidget<CustomerDropdownController,
    CustomerDropdownCubit, CustomerDropdownState> {
  final Function(Customers?)? onChanged;
  List<Customers> customers;

  CustomerDropdown({
    Key? key,
    super.controller,
    super.onStateChanged,
    this.onChanged,
    required this.customers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CustomerDropdownCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<CustomerDropdownCubit, CustomerDropdownState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final isLargeScreen = MediaQuery.of(context).size.width > 600;
          final dropdownWidth = isLargeScreen
              ? MediaQuery.of(context).size.width * 0.36
              : MediaQuery.of(context).size.width * 0.72;

          return Container(
            width: dropdownWidth,
            child: DropdownButtonFormField2<Customers>(
              decoration: InputStyles.formTemplateInput(),
              hint: Container(
                width: dropdownWidth * 0.75, // Adjust width as needed
                child: const Text(
                  "Select Customer",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              items: customers.map((customer) {
                return DropdownMenuItem<Customers>(
                  value: customer,
                  child: Container(
                    width: dropdownWidth * 0.75,
                    child: Text(customer.name!),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  border: borders.b_2px_bgLightBlue,
                  color: AppColors.white,
                ),
                maxHeight: 300,
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
  CustomerDropdownCubit createCubitAndAssignToController(BuildContext context) {
    CustomerDropdownCubit cubit = CustomerDropdownCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
