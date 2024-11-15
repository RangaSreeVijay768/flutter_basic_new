import 'package:basic/app/core/utils/authentication/authentication_utils.dart';
import 'package:basic/app/onboarding/widgets/onboarding_login_form_widget/onboarding_login_form_widget.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/shadows.dart';
import 'package:basic/app/user_accounts/models/users/user_account.dart';
import 'package:basic/app/user_accounts/widgets/user_accounts_login_form_widget/user_accounts_login_form_widget.dart';
import 'package:basic/app/user_accounts/widgets/user_accounts_login_form_widget/user_accounts_login_form_widget_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../authentication/authentication_cubit.dart';
import '../../../core/database/boolean_status.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/edge_insets.dart';
import '../../../themes/fonts.dart';
import 'onboarding_login_screen_controller.dart';
import 'onboarding_login_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class OnboardingLoginScreen extends BaseStatelessWidget<
    OnboardingLoginScreenController,
    OnboardingLoginScreenCubit,
    OnboardingLoginScreenState> {
  OnboardingLoginScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);
  UserAccountsLoginFormWidgetController userAccountsLoginFormWidgetController =
      UserAccountsLoginFormWidgetController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingLoginScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child:
          BlocConsumer<OnboardingLoginScreenCubit, OnboardingLoginScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("Login"),
            ),
            body: Container(
              child: Column(
                children: [
                  UserAccountsLoginFormWidget(
                    controller: userAccountsLoginFormWidgetController,
                    onStateChanged: (userAccountsLoginFormWidgetState) =>
                        getCubit(context).emitState(state.copyWith(
                            userAccountsLoginFormWidgetState:
                                userAccountsLoginFormWidgetState)),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: edge_insets_y_12,
                    // decoration: BoxDecoration(
                    //     border: borders.bt_1px_grey2,
                    //     boxShadow: const [shadows.bs_primary]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                                padding: edge_insets_x_80_y_12,
                                backgroundColor: AppColors.bgPrimary2,
                                disabledBackgroundColor: AppColors.grey1,
                                shape: RoundedRectangleBorder(
                                    borderRadius: borderRadius.br_5)),
                            onPressed: (state.userAccountsLoginFormWidgetState
                                            ?.userLoginStatus ==
                                        BooleanStatus.pending ||
                                    state.userAccountsLoginFormWidgetState
                                            ?.formValid !=
                                        ControlStatus.valid ||
                                    state.loadingButton!)
                                ? null
                                : () async {
                                    getCubit(context)
                                        .setLoadingButtonStatus(true);
                                    UserAccount userAccount = await userAccountsLoginFormWidgetController
                                        .getChildCubit()
                                        .login(
                                            userAccountsLoginFormWidgetController
                                                .getChildCubit()
                                                .createRequestData());
                                    BlocProvider.of<AuthenticationCubit>(context)
                                        .saveUserAccount(userAccount);
                                    AuthenticationUtils.getUserAccountFromSharedPreferences();
                                    context.go("/home");
                                  },
                            child: state.loadingButton!
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                        color: Colors.white),
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: Fonts.f500,
                                        fontSize: Fonts.fontSize18),
                                  ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  OnboardingLoginScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    OnboardingLoginScreenCubit cubit =
        OnboardingLoginScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
