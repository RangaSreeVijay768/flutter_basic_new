import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/modals/base_modal/base_modal_cubit.dart';

part 'create_customer_modal_state.dart';

part 'create_customer_modal_cubit.freezed.dart';

class CreateCustomerModalCubit
    extends BaseModalCubit<CreateCustomerModalState> {
  CreateCustomerModalCubit({required super.context})
      : super(initialState: CreateCustomerModalState.initial());

  @override
  void closeModal() {
    // TODO: implement closeModal
  }

  @override
  void openModal() {
    emitState(state.copyWith(modalStatus: BooleanStatus.active));
  }

  @override
  void openModalManual() {
    emitState(state.copyWith(modalStatus: BooleanStatus.pending));
  }

}
