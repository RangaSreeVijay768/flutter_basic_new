import 'package:basic/app/escale/request_response/get_transactions_by_customer_id/get_transactions_by_customer_id_response.dart';
import 'package:basic/app/escale/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../request_response/get_transactions_by_customer_id/get_transactions_by_customer_id_request.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'get_transactions_by_customer_id_state.dart';

part 'get_transactions_by_customer_id_cubit.freezed.dart';

class GetTransactionsByCustomerIdCubit
    extends BaseCubit<GetTransactionsByCustomerIdState> {
  late TransactionService transactionService;
  GetTransactionsByCustomerIdCubit({required super.context, required int customerId})
      : super(initialState: GetTransactionsByCustomerIdState.initial(customerId: customerId)){
    transactionService=GetIt.instance<TransactionService>();
    getTransactionsByCustomerId(createRequestData());
  }


    GetTransactionsByCustomerIdRequest createRequestData({
    int? customerId
}) {
        final request = GetTransactionsByCustomerIdRequest(
          customerid: customerId ?? state.customerId
        );
        return request;
      }

    Future<List<GetTransactionsByCustomerIdResponse>> getTransactionsByCustomerId(
          GetTransactionsByCustomerIdRequest request) async {
        return transactionService.getTransactionsByCustomerId(request).then((value) {
          emit(state.copyWith(
              getTransactionsByCustomerIdResponse: value,
              getTransactionsByCustomerIdStatus: BooleanStatus.success));
          return Future.value(value);
        }).catchError((error) {
          emit(state.copyWith(getTransactionsByCustomerIdStatus: BooleanStatus.error));
          throw error;
        });
      }
}
