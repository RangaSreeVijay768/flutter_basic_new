import 'package:basic/app/escale/widgets/create_truck_form/create_truck_form_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';

part 'create_truck_modal_content_state.dart';

part 'create_truck_modal_content_cubit.freezed.dart';

class CreateTruckModalContentCubit
    extends BaseCubit<CreateTruckModalContentState> {
  CreateTruckModalContentCubit({required super.context})
      : super(initialState: CreateTruckModalContentState.initial(loadingButton: false));

  setLoadingButtonStatus(bool? val) {
    emitState(state.copyWith(loadingButton: val));
  }

}
