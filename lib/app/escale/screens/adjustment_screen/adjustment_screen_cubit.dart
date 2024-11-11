import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';

import 'package:get_it/get_it.dart';

part 'adjustment_screen_state.dart';

part 'adjustment_screen_cubit.freezed.dart';

class AdjustmentScreenCubit extends BaseCubit<AdjustmentScreenState> {
  AdjustmentScreenCubit({required super.context})
      : super(initialState: AdjustmentScreenState.initial());
}
