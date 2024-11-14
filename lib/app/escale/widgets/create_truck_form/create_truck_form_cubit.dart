import 'package:basic/app/escale/models/item_models.dart';
import 'package:basic/app/escale/request_response/create_truck/create_truck_response.dart';
import 'package:basic/app/escale/services/truck_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../../core/database/boolean_status.dart';
import '../../request_response/create_truck/create_truck_request.dart';

part 'create_truck_form_state.dart';

part 'create_truck_form_cubit.freezed.dart';

class CreateTruckFormCubit extends BaseFormCubit<CreateTruckFormState> {
  late TruckService truckService;
  CreateTruckFormCubit({required super.context})
      : super(initialState: CreateTruckFormState.initial()){
    truckService=GetIt.instance<TruckService>();
  }

  void setSelectedItems(String items) {
    emit(state.copyWith(items: items));
  }

  CreateTruckRequest createRequestData({
      String? number,
      String? name,
      String? weight,
      String? lotsize,
      String? items,
    }) {
        final request = CreateTruckRequest(
          number: number ?? formGroup.control('number').value,
          name: name ?? formGroup.control('name').value,
          weight: weight ?? formGroup.control('weight').value,
          lotsize: lotsize ?? formGroup.control('lotSize').value,
          items: items ?? state.items,
        );
        return request;
      }

    Future<CreateTruckResponse> createTruck(
          CreateTruckRequest request) async {
        return truckService.createTruck(request).then((value) {
          emit(state.copyWith(
              createTruckResponse: value,
              createTruckStatus: BooleanStatus.success));
          return Future.value(value);
        }).catchError((error) {
          emit(state.copyWith(createTruckStatus: BooleanStatus.error));
          throw error;
        });
      }

  @override
  FormGroup getFormGroup() {
    return FormGroup({
      'number': FormControl<String>(validators: [Validators.required]),
      'name': FormControl<String>(validators: [Validators.required]),
      'weight': FormControl<String>(validators: [Validators.required]),
      'lotSize': FormControl<String>(validators: [Validators.required]),
    });
  }

  @override
  void updateFormValidationState(ControlStatus event) {
    emit(state.copyWith(formValid: event));
  }
}
