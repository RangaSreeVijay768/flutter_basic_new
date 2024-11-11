import 'package:basic/app/escale/request_response/get_all_transactions/get_all_transactions_response.dart';
import 'package:basic/app/escale/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';

import 'package:get_it/get_it.dart';

import '../../request_response/get_all_transactions/get_all_transactions_request.dart';

part 'get_all_transactions_state.dart';

part 'get_all_transactions_cubit.freezed.dart';

class GetAllTransactionsCubit extends BaseCubit<GetAllTransactionsState> {
  late TransactionService transactionService;

  GetAllTransactionsCubit({required super.context})
      : super(initialState: GetAllTransactionsState.initial()){
    transactionService=GetIt.instance<TransactionService>();
    getAllTransactions(createRequestData());
  }

    GetAllTransactionsRequest createRequestData() {
        final request = GetAllTransactionsRequest();
        return request;
      }

    Future<List<GetAllTransactionsResponse>> getAllTransactions(
          GetAllTransactionsRequest request) async {
        return transactionService.getAllTransactions(request).then((value) {
          emit(state.copyWith(
              getAllTransactionsResponse: value,
              getAllTransactionsStatus: BooleanStatus.success));
          return Future.value(value);
        }).catchError((error) {
          emit(state.copyWith(getAllTransactionsStatus: BooleanStatus.error));
          throw error;
        });
      }
}
