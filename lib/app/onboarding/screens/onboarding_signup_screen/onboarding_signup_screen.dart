import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'onboarding_signup_screen_controller.dart';
import 'onboarding_signup_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class OnboardingSignupScreen
    extends BaseStatelessWidget<
        OnboardingSignupScreenController,
        OnboardingSignupScreenCubit,
        OnboardingSignupScreenState> {

  OnboardingSignupScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingSignupScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          OnboardingSignupScreenCubit,
          OnboardingSignupScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("Signup"),
            ),
            body: Container(
              child: Text("Signup page"),
            ),
          );
        },
      ),
    );
  }

  @override
  OnboardingSignupScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    OnboardingSignupScreenCubit cubit = OnboardingSignupScreenCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
