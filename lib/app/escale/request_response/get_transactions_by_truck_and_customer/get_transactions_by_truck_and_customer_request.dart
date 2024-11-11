import 'package:json_annotation/json_annotation.dart';

part 'get_transactions_by_truck_and_customer_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GetTransactionsByTruckAndCustomerRequest {
  int? customerid;
  int? truckid;

  factory GetTransactionsByTruckAndCustomerRequest.fromJson(
      Map<String, dynamic> json) =>
      _$GetTransactionsByTruckAndCustomerRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetTransactionsByTruckAndCustomerRequestToJson(this);

  GetTransactionsByTruckAndCustomerRequest({this.customerid, this.truckid});
}
