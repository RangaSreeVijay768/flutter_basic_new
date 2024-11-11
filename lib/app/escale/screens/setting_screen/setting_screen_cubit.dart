import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';

import 'package:get_it/get_it.dart';

part 'setting_screen_state.dart';

part 'setting_screen_cubit.freezed.dart';

class SettingScreenCubit extends BaseCubit<SettingScreenState> {
  SettingScreenCubit({required super.context})
      : super(initialState: SettingScreenState.initial());
}
