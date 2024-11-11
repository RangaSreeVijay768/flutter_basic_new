import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';

part 'create_customer_modal_content_state.dart';

part 'create_customer_modal_content_cubit.freezed.dart';

class CreateCustomerModalContentCubit
    extends BaseCubit<CreateCustomerModalContentState> {
  CreateCustomerModalContentCubit({required super.context})
      : super(initialState: CreateCustomerModalContentState.initial(loadingButton: false)){

  }

  setLoadingButtonStatus(bool? val) {
    emitState(state.copyWith(loadingButton: val));
  }

}
