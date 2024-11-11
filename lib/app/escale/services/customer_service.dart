import 'package:basic/app/escale/request_response/create_customer/create_customer_response.dart';
import 'package:basic/app/escale/request_response/get_all_customers/get_all_customers_response.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../repos/customer_repo.dart';
import '../request_response/create_customer/create_customer_request.dart';
import '../request_response/get_all_customers/get_all_customers_request.dart';


@singleton
class CustomerService {
  late CustomerRepo customerRepo;

  CustomerService() {
    customerRepo = GetIt.instance<CustomerRepo>();
  }

  Future<CreateCustomerResponse> createCustomer(CreateCustomerRequest request) {
    return customerRepo.createCustomer(request);
  }


  Future<List<GetAllCustomersResponse>> getAllCustomers(GetAllCustomersRequest request) {
    return customerRepo.getAllCustomers(request);
  }

}
