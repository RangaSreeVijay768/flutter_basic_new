import 'package:basic/app/core/logger/log.dart';
import 'package:basic/app/escale/request_response/create_transaction/create_transaction_response.dart';
import 'package:basic/app/escale/request_response/get_all_transactions/get_all_transactions_response.dart';
import 'package:basic/app/escale/request_response/get_transactions_by_customer_id/get_transactions_by_customer_id_request.dart';
import 'package:basic/app/escale/request_response/get_transactions_by_customer_id/get_transactions_by_customer_id_response.dart';
import 'package:basic/app/escale/request_response/get_transactions_by_truck_and_customer/get_transactions_by_truck_and_customer_request.dart';
import 'package:basic/app/escale/request_response/get_transactions_by_truck_and_customer/get_transactions_by_truck_and_customer_response.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../repos/transaction_repo.dart';
import '../request_response/create_transaction/create_transaction_request.dart';
import '../request_response/get_all_transactions/get_all_transactions_request.dart';


@singleton
class TransactionService {
  late TransactionRepo transactionRepo;

  TransactionService() {
    transactionRepo = GetIt.instance<TransactionRepo>();
  }

  Future<CreateTransactionResponse> createTransaction(CreateTransactionRequest request) {
    return transactionRepo.createTransaction(request);
  }

  Future<List<GetAllTransactionsResponse>> getAllTransactions(GetAllTransactionsRequest request) {
    return transactionRepo.getAllTransactions(request);
  }

  Future<List<GetTransactionsByTruckAndCustomerResponse>> getTransactionsByTruckAndCustomer(GetTransactionsByTruckAndCustomerRequest request) {
    return transactionRepo.getTransactionsByTruckAndCustomer(request);
  }

  Future<List<GetTransactionsByCustomerIdResponse>> getTransactionsByCustomerId(GetTransactionsByCustomerIdRequest request) {
    return transactionRepo.getTransactionsByCustomerId(request);
  }

}
