import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/input_styles.dart';
import '../../models/customer_models.dart';
import '/app/themes/borders.dart';

import 'customer_dropdown_controller.dart';
import 'customer_dropdown_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class CustomerDropdown extends BaseStatelessWidget<CustomerDropdownController,
    CustomerDropdownCubit, CustomerDropdownState> {
  final Function(Customers?)? onChanged;
  final List<Customers> customers;

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
            height: 40,
            child: DropdownSearch<Customers>(
              items: (filter, infiniteScrollProps) => customers, // Providing a list of Customers directly here
              decoratorProps: DropDownDecoratorProps(
                decoration: InputStyles.formTemplateInput(
                  hintText: "Select Customer"
                ),
              ),
              dropdownBuilder: (context, selectedItem) => Container(
                width: dropdownWidth * 0.75,
                child: Text(
                  selectedItem?.name ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: AppColors.textHeading, fontSize: Fonts.fontSize16, fontWeight: Fonts.f500),
                ),
              ),
              popupProps: PopupProps.menu(
                fit: FlexFit.loose,
                menuProps: MenuProps(
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.bgLightBlue, width: 2)
                  )
                ),
                showSearchBox: true,
                constraints: BoxConstraints(maxHeight: 300, maxWidth: dropdownWidth),
                scrollbarProps: ScrollbarProps(
                  radius: Radius.circular(40),
                  thickness: 4,
                  thumbVisibility: true,
                ),
                searchDelay: Duration(seconds: 0),
                searchFieldProps: TextFieldProps(
                  style: TextStyle(fontSize: Fonts.fontSize14, fontWeight: Fonts.f400, color: AppColors.textHeading),
                  decoration: InputStyles.formTemplateInput(hintText: 'search'),
                ),
              ),
              onChanged: onChanged,
              itemAsString: (Customers? customer) => customer?.name ?? '',
              compareFn: (item1, item2) => item1.id == item2.id,
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
