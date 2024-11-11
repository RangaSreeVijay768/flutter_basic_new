import 'package:basic/app/escale/models/item_models.dart';
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
                          padding: edge_insets_16,
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButtonFormField(
                              decoration: InputStyles.formTemplateInput(),
                              hint: Text("Select Items"),
                              items: items.map((item) => DropdownMenuItem(
                                value: item,
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.7,
                                  child: Text(item.name!),
                                ),
                              ))
                                  .toList(),
                              onChanged: (item) {
                                getCubit(context).setSelectedItems(item);
                              },
                              menuMaxHeight: 300,
                              dropdownColor: AppColors.white,
                            )
                        ),


                        Container(
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
