import 'package:basic/app/bluetooth/state/bluetooth_cubit.dart';
import 'package:basic/app/bluetooth/widgets/bluetooth_print_print_receipt/bluetooth_print_print_receipt_cubit.dart';
import 'package:basic/app/core/logger/log.dart';
import 'package:basic/app/escale/request_response/create_transaction/create_transaction_response.dart';
import 'package:basic/app/escale/services/transaction_service.dart';
import 'package:basic/app/escale/widgets/get_transactions_by_customer_id/get_transactions_by_customer_id_cubit.dart';
import 'package:basic/app/escale/widgets/get_transactions_by_truck_customer/get_transactions_by_truck_customer_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';

import 'package:get_it/get_it.dart';
import 'package:basic/app/escale/models/customer_models.dart';
import 'package:basic/app/escale/models/truck_models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../request_response/create_transaction/create_transaction_request.dart';
import '../../request_response/get_transactions_by_customer_id/get_transactions_by_customer_id_response.dart';

part 'sell_form_template_state.dart';

part 'sell_form_template_cubit.freezed.dart';

class SellFormTemplateCubit extends BaseCubit<SellFormTemplateState> {
  late TransactionService transactionService;
  SellFormTemplateCubit({required super.context})
      : super(initialState: SellFormTemplateState.initial(purchaseType: "UPI")){
    transactionService=GetIt.instance<TransactionService>();
  }

  void setSelectedTruck(Trucks? truck) {
    emit(state.copyWith(selectedTruck: truck, selectedItem: null));
  }

  void setSelectedItem(String? item) {
    emit(state.copyWith(selectedItem: item));
  }

  void setSelectedCustomer(Customers? customer) {
    emit(state.copyWith(selectedCustomer: customer));
  }

  void setLotSize(int? lotSize) {
    emit(state.copyWith(lotSize: lotSize));
  }

  void setConstPrice(double? constPrice) {
    emit(state.copyWith(constPrice: constPrice));
  }

  void setItemWeight(double? itemWeight) {
    emit(state.copyWith(itemWeight: itemWeight));
  }

  void setPurchaseType(String purchaseType) {
    emit(state.copyWith(purchaseType: purchaseType));
  }

    CreateTransactionRequest createRequestData({
      String? trucknumber,
      int? truckid,
      double? fullweight,
      double? weight,
      String? items,
      int? customerid,
      String? purchasetype,
      double? price,
      int? bags
      }) {
        final request = CreateTransactionRequest(
          trucknumber: trucknumber ?? state.selectedTruck?.number,
          truckid: truckid ?? state.selectedTruck?.id,
          fullweight: fullweight ?? state.itemWeight,
          weight: weight ?? state.itemWeight,
          items: items ?? state.selectedItem,
          customerid: customerid ?? state.selectedCustomer?.id,
          price: price ?? state.constPrice,
          purchasetype: purchasetype ?? state.purchaseType,
          bags: bags ?? state.lotSize
        );
        return request;
      }

    Future<CreateTransactionResponse> createTransaction(
          CreateTransactionRequest request) async {
      if (request.trucknumber == null ||
          request.truckid == null ||
          request.fullweight == null ||
          request.weight == null ||
          request.items == null ||
          request.customerid == null ||
          request.price == null ||
          request.purchasetype == null ||
          request.bags == null) {
        Fluttertoast.showToast(msg: "Please fill in all required fields.");
        emit(state.copyWith(createTransactionStatus: BooleanStatus.error));
        throw Exception("Missing required transaction data.");
      }

      return transactionService.createTransaction(request).then((value) {
          emit(state.copyWith(
              createTransactionResponse: value,
              createTransactionStatus: BooleanStatus.success));
          return Future.value(value);
        }).catchError((error) {
          emit(state.copyWith(createTransactionStatus: BooleanStatus.error));
          throw error;
        });
      }



  bool isFormComplete() {
    return state.selectedTruck != null &&
        state.selectedItem != null &&
        state.selectedCustomer != null &&
        state.itemWeight != null &&
        state.constPrice != null &&
        state.lotSize != null;
  }


  void clearFormFields() {
    emit(SellFormTemplateState.initial(purchaseType: "UPI"));
  }




  Future<void> submitTransaction(VoidCallback? onTransactionCreated) async {
    if (state.selectedTruck == null ||
        state.selectedItem == null ||
        state.selectedCustomer == null ||
        state.lotSize == null ||
        state.constPrice == null ||
        state.itemWeight == null) {
      Fluttertoast.showToast(
        msg: "Fill All Fields For Transaction Submission",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    var truckData = {
      "trucknumber": state.selectedTruck!.number,
      "truckid": state.selectedTruck!.id,
      "fullweight": state.itemWeight,
      "weight": state.itemWeight,
      "items": state.selectedItem,
      "customerid": state.selectedCustomer!.id,
      "purchasetype": state.purchaseType.isNotEmpty ? state.purchaseType : "CASH",
      "price": state.constPrice,
      "bags": state.lotSize,
    };

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? user = prefs.getString("user");
      String? accessToken;

      if (user != null) {
        accessToken = jsonDecode(user)["accessToken"];
      }

      final response = await http.post(
        Uri.parse('https://gen8ai.in:8082/api/transactions'),
        headers: {
          'Content-Type': 'application/json',
          'x-access-token': accessToken ?? '',
        },
        body: jsonEncode(truckData),
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Transaction Added successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        onTransactionCreated?.call();
      } else {
        Fluttertoast.showToast(
          msg: "Error Adding Transaction: ${response.body}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error Adding Transaction",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

}
