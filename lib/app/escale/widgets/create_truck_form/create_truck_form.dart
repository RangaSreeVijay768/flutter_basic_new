import 'package:basic/app/escale/models/item_models.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:basic/app/core/widgets/base_form_stateless_widget.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';

import '../../../themes/input_styles.dart';
import 'create_truck_form_controller.dart';
import 'create_truck_form_cubit.dart';


class CreateTruckForm
    extends BaseFormStatelessWidget<
        CreateTruckFormController,
        CreateTruckFormCubit,
        CreateTruckFormState> {
  List<Items> items;
  List<Items> selectedItems = [];

  CreateTruckForm({Key? key, super.controller, super.onStateChanged, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateTruckFormCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<CreateTruckFormCubit, CreateTruckFormState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final formGroup = getCubit(context).formGroup;
          return ReactiveFormBuilder(
            form: () => formGroup,
            builder: (context, form, child) {
              return ReactiveForm(
                formGroup: formGroup,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: edge_insets_x_16,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Truck number",
                                      style: TextStyle(
                                        fontWeight: Fonts.f500,
                                        fontSize: Fonts.fontSize16,
                                        color: AppColors.textHeading,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    ReactiveTextField<String>(
                                      style: TextStyle(fontWeight: Fonts.f500),
                                      formControlName: 'number',
                                      decoration: InputStyles.formTemplateInput(hintText: "Enter truck number"),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16), // Space between the two input fields
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Truck name",
                                      style: TextStyle(
                                        fontWeight: Fonts.f500,
                                        fontSize: Fonts.fontSize16,
                                        color: AppColors.textHeading,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    ReactiveTextField<String>(
                                      style: TextStyle(fontWeight: Fonts.f500),
                                      formControlName: 'name',
                                      decoration: InputStyles.formTemplateInput(hintText: "Enter truck name"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: edge_insets_8,
                          margin: edge_insets_x_8,
                          child: Text(
                            "Items",
                            style: TextStyle(
                              fontWeight: Fonts.f500,
                              fontSize: Fonts.fontSize16,
                              color: AppColors.textHeading,
                            ),
                          ),
                        ),
                        Container(
                          margin: edge_insets_x_16,
                          height: 40,
                          child: DropdownSearch<Items>.multiSelection(
                            items: (filter, infiniteScrollProps) =>items, // List of items you want to show in the dropdown
                            selectedItems: selectedItems, // List to hold selected items
                            mode: Mode.form, // Dropdown mode (menu or dialog)
                            popupProps: PopupPropsMultiSelection.menu(
                              showSearchBox: true,
                              menuProps: MenuProps(
                                  backgroundColor: AppColors.white,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: AppColors.bgLightBlue, width: 2)
                                  )
                              ),
                              constraints: BoxConstraints(maxHeight: 300),
                              scrollbarProps: ScrollbarProps(
                                radius: Radius.circular(40),
                                thickness: 4,
                                thumbVisibility: true,
                              ),
                              searchDelay: Duration(seconds: 0),
                              searchFieldProps: TextFieldProps(
                                style: TextStyle(
                                  fontSize: Fonts.fontSize14,
                                  fontWeight: Fonts.f400,
                                  color: AppColors.textHeading,
                                ),
                                decoration: InputStyles.formTemplateInput(hintText: 'search'),
                              ),
                            ),
                            onChanged: (List<Items> selectedItemsList) {
                              String selectedItemsString = selectedItemsList.map((item) => item.name).join(', ');

                              getCubit(context).setSelectedItems(selectedItemsString);
                            },
                            itemAsString: (Items? item) => item?.name ?? '', // Customize how the item is displayed in the dropdown
                            compareFn: (item1, item2) => item1.id == item2.id, // Custom compare function to match items
                            dropdownBuilder: (context, selectedItems) => Container(
                              child: Text(
                                selectedItems.isEmpty
                                    ? ''
                                    : selectedItems.map((item) => item.name).join(', '), // Display selected items
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.textHeading,
                                  fontSize: Fonts.fontSize16,
                                  fontWeight: Fonts.f500,
                                ),
                              ),
                            ),
                            // Form properties (optional)
                            onSaved: (value) {
                              // Save selected items if needed
                            },
                            validator: (value) {
                              // Validate selected items if needed
                              return null;
                            },
                            decoratorProps: DropDownDecoratorProps(
                              decoration: InputStyles.formTemplateInput(hintText: "Select Items"), // Customize input decoration
                            ),
                          ),
                        ),
                        Container(
                          margin: edge_insets_t_8,
                          padding: edge_insets_x_16,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Weight",
                                      style: TextStyle(
                                        fontWeight: Fonts.f500,
                                        fontSize: Fonts.fontSize16,
                                        color: AppColors.textHeading,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    ReactiveTextField<String>(
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(fontWeight: Fonts.f500),
                                      formControlName: 'weight',
                                      decoration: InputStyles.formTemplateInput(hintText: "Enter weight"),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16), // Space between the two input fields
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Lot size",
                                      style: TextStyle(
                                        fontWeight: Fonts.f500,
                                        fontSize: Fonts.fontSize16,
                                        color: AppColors.textHeading,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    ReactiveTextField<String>(
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(fontWeight: Fonts.f500),
                                      formControlName: 'lotSize',
                                      decoration: InputStyles.formTemplateInput(hintText: "Enter lotsize"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(height: 16,),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  CreateTruckFormCubit createCubitAndAssignToController(BuildContext context) {
    CreateTruckFormCubit cubit = CreateTruckFormCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
