import 'package:basic/app/user_accounts/services/user_account_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';

import 'package:get_it/get_it.dart';

part 'home_screen_state.dart';

part 'home_screen_cubit.freezed.dart';

class HomeScreenCubit extends BaseCubit<HomeScreenState> {
  HomeScreenCubit({required super.context})
      : super(initialState: HomeScreenState.initial());

}
