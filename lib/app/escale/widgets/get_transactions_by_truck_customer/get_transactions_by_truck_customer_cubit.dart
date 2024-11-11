import 'package:basic/app/core/logger/log.dart';
import 'package:basic/app/escale/request_response/get_transactions_by_truck_and_customer/get_transactions_by_truck_and_customer_response.dart';
import 'package:basic/app/escale/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';

import 'package:get_it/get_it.dart';

import '../../request_response/get_transactions_by_truck_and_customer/get_transactions_by_truck_and_customer_request.dart';

part 'get_transactions_by_truck_customer_state.dart';

part 'get_transactions_by_truck_customer_cubit.freezed.dart';

class GetTransactionsByTruckCustomerCubit
    extends BaseCubit<GetTransactionsByTruckCustomerState> {
  late TransactionService transactionService;

  GetTransactionsByTruckCustomerCubit({required super.context, required int customerId, required int truckId})
      : super(initialState: GetTransactionsByTruckCustomerState.initial(customerId: customerId, truckId: truckId)){
    transactionService=GetIt.instance<TransactionService>();
    getTransactionsByTruckAndCustomer(createRequestData());
  }


    GetTransactionsByTruckAndCustomerRequest createRequestData({
      int? customerId,
      int? truckId
      }) {
        final request = GetTransactionsByTruckAndCustomerRequest(
          customerid: customerId ?? state.customerId,
          truckid: truckId ?? state.truckId
        );
        return request;
      }

    Future<List<GetTransactionsByTruckAndCustomerResponse>> getTransactionsByTruckAndCustomer(
          GetTransactionsByTruckAndCustomerRequest request) async {
        return transactionService.getTransactionsByTruckAndCustomer(request).then((value) {
          emit(state.copyWith(
              getTransactionsByTruckAndCustomerResponse: value,
              getTransactionsByTruckAndCustomerStatus: BooleanStatus.success));
          return Future.value(value);
        }).catchError((error) {
          emit(state.copyWith(getTransactionsByTruckAndCustomerStatus: BooleanStatus.error));
          throw error;
        });
      }
}
