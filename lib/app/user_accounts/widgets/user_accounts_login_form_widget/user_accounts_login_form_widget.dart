import 'package:basic/app/themes/borders.dart';
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

import 'user_accounts_login_form_widget_controller.dart';
import 'user_accounts_login_form_widget_cubit.dart';

class UserAccountsLoginFormWidget extends BaseFormStatelessWidget<
    UserAccountsLoginFormWidgetController,
    UserAccountsLoginFormWidgetCubit,
    UserAccountsLoginFormWidgetState> {
  UserAccountsLoginFormWidget(
      {Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserAccountsLoginFormWidgetCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<UserAccountsLoginFormWidgetCubit,
          UserAccountsLoginFormWidgetState>(
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
                      Container(
                        margin: edge_insets_t_16,
                        padding: edge_insets_16,
                        // decoration: BoxDecoration(
                        //     border: borders.b_1px_bgPrimary,
                        //     borderRadius: borderRadius.br_5),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              // padding: edge_insets_y_8,
                              child: const Text(
                                "Username",
                                style: TextStyle(
                                  fontSize: Fonts.fontSize12,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ReactiveTextField<String>(
                              style: const TextStyle(fontWeight: Fonts.f500),
                              formControlName: 'username',
                              decoration: const InputDecoration(
                                  errorBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(),
                                  hintText: 'username',
                                  hintStyle: TextStyle(color: AppColors.grey4),
                                  enabledBorder: OutlineInputBorder()),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: edge_insets_t_8,
                        padding: edge_insets_16,
                        // decoration: BoxDecoration(
                        //     color: AppColors.grey1,
                        //     border: borders.b_1px_bgPrimary,
                        //     borderRadius: borderRadius.br_5),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              // padding: edge_insets_y_8,
                              child: const Text(
                                "Password",
                                style: TextStyle(
                                  fontSize: Fonts.fontSize12,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ReactiveTextField<String>(
                              style: const TextStyle(fontWeight: Fonts.f500),
                              formControlName: 'password',
                              obscureText: true,
                              validationMessages: {
                                ValidationMessage.required: (_) =>
                                    'The password must not be empty',
                              },
                              decoration: const InputDecoration(
                                  errorBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(),
                                  hintText: 'password',
                                  hintStyle: TextStyle(color: AppColors.grey4),
                                  enabledBorder: OutlineInputBorder()),
                            )
                          ],
                        ),
                      ),
                    ],
                  ));
            },
          );
        },
      ),
    );
  }

  @override
  UserAccountsLoginFormWidgetCubit createCubitAndAssignToController(
      BuildContext context) {
    UserAccountsLoginFormWidgetCubit cubit =
        UserAccountsLoginFormWidgetCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
