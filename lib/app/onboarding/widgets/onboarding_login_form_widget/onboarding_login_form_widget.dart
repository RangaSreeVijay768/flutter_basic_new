import 'package:basic/app/themes/borders.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../core/widgets/base_form_stateless_widget.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/edge_insets.dart';
import '../../../themes/fonts.dart';
import 'onboarding_login_form_widget_controller.dart';
import 'onboarding_login_form_widget_cubit.dart';


class OnboardingLoginFormWidget
    extends BaseFormStatelessWidget<
        OnboardingLoginFormWidgetController,
        OnboardingLoginFormWidgetCubit,
        OnboardingLoginFormWidgetState> {

  OnboardingLoginFormWidget({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingLoginFormWidgetCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          OnboardingLoginFormWidgetCubit,
          OnboardingLoginFormWidgetState>(
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
                        padding: edge_insets_8,
                        decoration: BoxDecoration(
                            color: AppColors.grey1,
                            border: borders.b_1px_bgPrimary,
                            borderRadius: borderRadius.br_5),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              // padding: edge_insets_y_8,
                              child: const Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: Fonts.fontSize12,
                                    color: AppColors.grey2),
                              ),
                            ),
                            ReactiveTextField<String>(
                              style: const TextStyle(fontWeight: Fonts.f500),
                              formControlName: 'email',
                              decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  hintText: 'mail@example.com',
                                  hintStyle: TextStyle(color: AppColors.grey4),
                                  enabledBorder: InputBorder.none),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: edge_insets_t_16,
                        padding: edge_insets_8,
                        decoration: BoxDecoration(
                            color: AppColors.grey1,
                            border: borders.b_1px_bgPrimary,
                            borderRadius: borderRadius.br_5),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              // padding: edge_insets_y_8,
                              child: const Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: Fonts.fontSize12,
                                    color: AppColors.grey2),
                              ),
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
                                  focusedErrorBorder: InputBorder.none,
                                  // errorBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: 'password',
                                  hintStyle: TextStyle(color: AppColors.grey4),
                                  enabledBorder: InputBorder.none),
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
  OnboardingLoginFormWidgetCubit createCubitAndAssignToController(
      BuildContext context) {
    OnboardingLoginFormWidgetCubit cubit = OnboardingLoginFormWidgetCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
