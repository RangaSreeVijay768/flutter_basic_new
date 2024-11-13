import 'package:basic/app/escale/models/transaction_by_truck_customer_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_transactions_by_truck_and_customer_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetTransactionsByTruckAndCustomerResponse extends TransactionsByTruckCustomerModel{

  factory GetTransactionsByTruckAndCustomerResponse.fromJson(
      Map<String, dynamic> json) =>
      _$GetTransactionsByTruckAndCustomerResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetTransactionsByTruckAndCustomerResponseToJson(this);

  GetTransactionsByTruckAndCustomerResponse();
}
