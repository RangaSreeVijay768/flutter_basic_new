import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';

import 'package:get_it/get_it.dart';

part 'receipt_screen_state.dart';

part 'receipt_screen_cubit.freezed.dart';

class ReceiptScreenCubit extends BaseCubit<ReceiptScreenState> {
  ReceiptScreenCubit({required super.context})
      : super(initialState: ReceiptScreenState.initial());
}
