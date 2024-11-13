import 'package:basic/app/escale/request_response/get_all_customers/get_all_customers_response.dart';
import 'package:basic/app/escale/services/customer_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';

import 'package:get_it/get_it.dart';

import '../../request_response/get_all_customers/get_all_customers_request.dart';

part 'get_all_customers_state.dart';

part 'get_all_customers_cubit.freezed.dart';

class GetAllCustomersCubit extends BaseCubit<GetAllCustomersState> {
  late CustomerService customerService;

  GetAllCustomersCubit({required super.context})
      : super(initialState: GetAllCustomersState.initial()){
    customerService=GetIt.instance<CustomerService>();
    // getAllCustomers(createRequestData());
  }


    GetAllCustomersRequest createRequestData() {
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
