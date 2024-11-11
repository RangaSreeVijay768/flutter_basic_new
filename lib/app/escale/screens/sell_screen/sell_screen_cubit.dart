import 'package:basic/app/escale/request_response/get_all_customers/get_all_customers_response.dart';
import 'package:basic/app/escale/request_response/get_all_trucks/get_all_trucks_response.dart';
import 'package:basic/app/escale/widgets/get_all_transactions/get_all_transactions_cubit.dart';
import 'package:basic/app/escale/widgets/sell_form_template/sell_form_template_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';

import 'package:get_it/get_it.dart';

import '../../request_response/get_all_customers/get_all_customers_request.dart';
import '../../request_response/get_all_trucks/get_all_trucks_request.dart';
import '../../services/customer_service.dart';
import '../../services/truck_service.dart';

part 'sell_screen_state.dart';

part 'sell_screen_cubit.freezed.dart';

class SellScreenCubit extends BaseCubit<SellScreenState> {
  late TruckService truckService;
  late CustomerService customerService;

  SellScreenCubit({required super.context})
      : super(initialState: SellScreenState.initial(loadingButton: false)) {
    truckService = GetIt.instance<TruckService>();
    customerService = GetIt.instance<CustomerService>();
    getAllTrucks(createRequestDataTrucks());
    getAllCustomers(createRequestDataCustomers());
  }

  setLoadingButtonStatus(bool? val) {
    emitState(state.copyWith(loadingButton: val));
  }

  GetAllTrucksRequest createRequestDataTrucks() {
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


    GetAllCustomersRequest createRequestDataCustomers() {
        final request = GetAllCustomersRequest();
        return request;
      }

    Future<List<GetAllCustomersResponse>> getAllCustomers(
          GetAllCustomersRequest request) async {
        return customerService.getAllCustomers(request).then((value) {
          emit(state.copyWith(
              getAllCustomersResponse: value,
              getAllCustomersStatus: BooleanStatus.success));
          return Future.value(value);
        }).catchError((error) {
          emit(state.copyWith(getAllCustomersStatus: BooleanStatus.error));
          throw error;
        });
      }
}
