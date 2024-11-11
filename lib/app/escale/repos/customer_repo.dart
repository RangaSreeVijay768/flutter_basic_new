import 'package:basic/app/core/api_url/api_url.dart';
import 'package:basic/app/core/network/dio_client.dart';
import 'package:basic/app/escale/request_response/create_customer/create_customer_request.dart';
import 'package:basic/app/escale/request_response/create_customer/create_customer_response.dart';
import 'package:basic/app/escale/request_response/get_all_customers/get_all_customers_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../request_response/get_all_customers/get_all_customers_request.dart';


part 'customer_repo.g.dart';


@RestApi()
abstract class CustomerRestClient {
  factory CustomerRestClient(Dio dio, {String baseUrl}) = _CustomerRestClient;

    @POST("/customers")
    Future<CreateCustomerResponse> createCustomer(@Body() CreateCustomerRequest createCustomerRequest);

    @GET("/customers/list")
    Future<List<GetAllCustomersResponse>> getAllCustomers(@Queries() Map<String, dynamic> queryMap);

}


@singleton
class CustomerRepo extends RestService {
  late CustomerRestClient customerRestClient;

  CustomerRepo() : super() {
    this.customerRestClient = CustomerRestClient(getDioClient(), baseUrl: ApiUrl.url);
  }

  Future<CreateCustomerResponse> createCustomer(CreateCustomerRequest request) {
    return customerRestClient.createCustomer(request);
  }
  
  Future<List<GetAllCustomersResponse>> getAllCustomers(GetAllCustomersRequest request) {
    return customerRestClient.getAllCustomers(request.toJson());
  }
  
  

}
