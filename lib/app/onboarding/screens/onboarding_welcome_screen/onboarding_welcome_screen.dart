import 'package:basic/app/onboarding/widgets/login.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/edge_insets.dart';
import '../../../themes/fonts.dart';
import 'onboarding_welcome_screen_controller.dart';
import 'onboarding_welcome_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class OnboardingWelcomeScreen
    extends BaseStatelessWidget<
        OnboardingWelcomeScreenController,
        OnboardingWelcomeScreenCubit,
        OnboardingWelcomeScreenState> {

  OnboardingWelcomeScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingWelcomeScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          OnboardingWelcomeScreenCubit,
          OnboardingWelcomeScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
            body: Container(
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: edge_insets_t_20,
                    child: Text("Welcome to escale", style: TextStyle(
                        fontSize: Fonts.fontSize24,
                        fontWeight: Fonts.f500
                    ),),
                  ),
                  SizedBox(height: 20,),
                  // TextButton(
                  //     onPressed: (){
                  //       context.push('/home');
                  //     },
                  //     child: Text("Home")
                  // ),
                  TextButton(
                      onPressed: (){
                        context.push('/login');
                      },
                      child: Text("Login")
                  ),
                  TextButton(
                      onPressed: (){
                        context.push('/signup');
                      },
                      child: Text("Signup")
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  OnboardingWelcomeScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    OnboardingWelcomeScreenCubit cubit = OnboardingWelcomeScreenCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}