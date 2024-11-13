import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/utils/authentication/authentication_utils.dart';
import 'package:basic/app/core/widgets/app_scaffold.dart';
import 'package:basic/app/escale/widgets/home_screen_drawer_widget/home_screen_drawer_widget.dart';
import 'package:basic/app/themes/fonts.dart';
import 'package:basic/app/user_accounts/models/users/user_account.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';

import '../../../onboarding/widgets/auth_service.dart';
import 'home_screen_controller.dart';
import 'home_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class HomeScreen
    extends BaseStatelessWidget<HomeScreenController,
        HomeScreenCubit,
        HomeScreenState> {

  HomeScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          final user = AuthenticationUtils.loggedUser;
          initializeController(context);
          return AppScaffold(
            appBarTitle: Text("Escale"),
            body: Container(
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40,),
                  Text("Welcome ${user?.username?.toUpperCase()}", style: TextStyle(
                    fontSize: Fonts.fontSize32,
                    fontWeight: Fonts.f500
                  ),),
                  Text(user?.email ?? "", style: TextStyle(
                    fontSize: Fonts.fontSize16
                  ),),
                  Text("${user?.shops?[0].name} ( ${user?.shops?[0].number} )", style: TextStyle(
                      fontSize: Fonts.fontSize16
                  ),),
                  Text(user?.shops?[0].address ?? "", style: TextStyle(
                      fontSize: Fonts.fontSize16
                  ),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  HomeScreenCubit createCubitAndAssignToController(BuildContext context) {
    HomeScreenCubit cubit = HomeScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
