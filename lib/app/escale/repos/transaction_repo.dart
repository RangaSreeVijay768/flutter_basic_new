import 'package:basic/app/core/api_url/api_url.dart';
import 'package:basic/app/core/logger/log.dart';
import 'package:basic/app/core/network/dio_client.dart';
import 'package:basic/app/escale/request_response/create_transaction/create_transaction_response.dart';
import 'package:basic/app/escale/request_response/get_all_transactions/get_all_transactions_request.dart';
import 'package:basic/app/escale/request_response/get_all_transactions/get_all_transactions_response.dart';
import 'package:basic/app/escale/request_response/get_transactions_by_customer_id/get_transactions_by_customer_id_request.dart';
import 'package:basic/app/escale/request_response/get_transactions_by_customer_id/get_transactions_by_customer_id_response.dart';
import 'package:basic/app/escale/request_response/get_transactions_by_truck_and_customer/get_transactions_by_truck_and_customer_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../request_response/create_transaction/create_transaction_request.dart';
import '../request_response/get_transactions_by_truck_and_customer/get_transactions_by_truck_and_customer_request.dart';

part 'transaction_repo.g.dart';

@RestApi()
abstract class TransactionRestClient {
  factory TransactionRestClient(Dio dio, {String baseUrl}) =
      _TransactionRestClient;

  @POST("/transactions")
  Future<CreateTransactionResponse> createTransaction(
      @Body() CreateTransactionRequest createTransactionRequest);

  @GET("/transactions/recent")
  Future<List<GetAllTransactionsResponse>> getAllTransactions(
      @Queries() Map<String, dynamic> queryMap);

  @GET(
      "/transactions/findByTruckAndCustomer?customerid={customerid}&truckid={truckid}")
  Future<List<GetTransactionsByTruckAndCustomerResponse>>
      getTransactionsByTruckAndCustomer(@Path('customerid') String customerid,
          @Path('truckid') String truckid);

  @GET(
      "/transactions/findByCustomer/{customerid}")
  Future<List<GetTransactionsByCustomerIdResponse>>
  getTransactionsByCustomerId(@Path('customerid') String customerid);

}

@singleton
class TransactionRepo extends RestService {
  late TransactionRestClient transactionRestClient;

  TransactionRepo() : super() {
    this.transactionRestClient =
        TransactionRestClient(getDioClient(), baseUrl: ApiUrl.url);
  }

  Future<CreateTransactionResponse> createTransaction(
      CreateTransactionRequest request) {
    return transactionRestClient.createTransaction(request);
  }

  Future<List<GetAllTransactionsResponse>> getAllTransactions(
      GetAllTransactionsRequest request) {
    return transactionRestClient.getAllTransactions(request.toJson());
  }

  Future<List<GetTransactionsByTruckAndCustomerResponse>>
      getTransactionsByTruckAndCustomer(
          GetTransactionsByTruckAndCustomerRequest request) {
    return transactionRestClient.getTransactionsByTruckAndCustomer(
        request.customerid.toString(), request.truckid.toString());
  }

  Future<List<GetTransactionsByCustomerIdResponse>>
  getTransactionsByCustomerId(
      GetTransactionsByCustomerIdRequest request) {
    return transactionRestClient.getTransactionsByCustomerId(
        request.customerid.toString());
  }
}
