import 'package:basic/app/escale/request_response/get_all_trucks/get_all_trucks_response.dart';
import 'package:basic/app/escale/widgets/get_all_trucks/get_all_trucks_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';

import 'package:get_it/get_it.dart';

import '../../request_response/get_all_items/get_all_items_request.dart';
import '../../request_response/get_all_items/get_all_items_response.dart';
import '../../services/item_service.dart';

part 'receive_screen_state.dart';

part 'receive_screen_cubit.freezed.dart';

class ReceiveScreenCubit extends BaseCubit<ReceiveScreenState> {
  late ItemService itemService;

  ReceiveScreenCubit({required super.context})
      : super(initialState: ReceiveScreenState.initial()){
    itemService=GetIt.instance<ItemService>();
    getAllItems(createRequestData());
  }


  GetAllItemsRequest createRequestData() {
    final request = GetAllItemsRequest();
    return request;
  }

  Future<List<GetAllItemsResponse>> getAllItems(
      GetAllItemsRequest request) async {
    return itemService.getAllItems(request).then((value) {
      emit(state.copyWith(
          getAllItemsResponse: value,
          getAllItemsStatus: BooleanStatus.success));
      return Future.value(value);
    }).catchError((error) {
      emit(state.copyWith(getAllItemsStatus: BooleanStatus.error));
      throw error;
    });
  }


}
