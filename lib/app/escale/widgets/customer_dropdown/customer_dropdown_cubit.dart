import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'customer_dropdown_state.dart';

part 'customer_dropdown_cubit.freezed.dart';

class CustomerDropdownCubit extends BaseCubit<CustomerDropdownState> {
  CustomerDropdownCubit({required super.context})
      : super(initialState: CustomerDropdownState.initial());
}
