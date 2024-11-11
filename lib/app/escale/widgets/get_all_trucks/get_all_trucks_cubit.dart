import 'package:basic/app/core/logger/log.dart';
import 'package:basic/app/escale/request_response/get_all_trucks/get_all_trucks_response.dart';
import 'package:basic/app/escale/services/truck_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';

import 'package:get_it/get_it.dart';

import '../../request_response/get_all_trucks/get_all_trucks_request.dart';

part 'get_all_trucks_state.dart';

part 'get_all_trucks_cubit.freezed.dart';

class GetAllTrucksCubit extends BaseCubit<GetAllTrucksState> {
  late TruckService truckService;

  GetAllTrucksCubit({required super.context})
      : super(initialState: GetAllTrucksState.initial()) {
    truckService = GetIt.instance<TruckService>();
    getAllTrucks(createRequestData());
  }

  GetAllTrucksRequest createRequestData() {
    final request = GetAllTrucksRequest();
    return request;
  }

  Future<List<GetAllTrucksResponse>> getAllTrucks(
      GetAllTrucksRequest request) async {
    return truckService.getAllTrucks(request).then((value) {
      emit(state.copyWith(
          getAllTrucksResponse: value,
          getAllTrucksStatus: BooleanStatus.success));
      return Future.value(value);
    }).catchError((error) {
      emit(state.copyWith(getAllTrucksStatus: BooleanStatus.error));
      throw error;
    });
  }
}
