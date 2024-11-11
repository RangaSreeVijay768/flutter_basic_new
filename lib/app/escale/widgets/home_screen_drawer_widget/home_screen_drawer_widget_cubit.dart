import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';

import 'package:get_it/get_it.dart';

import '../../../user_accounts/services/user_account_service.dart';

part 'home_screen_drawer_widget_state.dart';

part 'home_screen_drawer_widget_cubit.freezed.dart';

class HomeScreenDrawerWidgetCubit
    extends BaseCubit<HomeScreenDrawerWidgetState> {
  late UserAccountService userAccountService;

  HomeScreenDrawerWidgetCubit({required super.context})
      : super(initialState: HomeScreenDrawerWidgetState.initial()){
    userAccountService=GetIt.instance<UserAccountService>();
  }

  logout(){
    userAccountService.deleteUserAuthTokenFromSharedPreferences();
  }

}
