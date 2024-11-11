import 'package:basic/app/escale/request_response/get_all_items/get_all_items_response.dart';
import 'package:basic/app/escale/services/item_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';

import 'package:get_it/get_it.dart';

import '../../request_response/get_all_items/get_all_items_request.dart';

part 'get_all_Items_state.dart';

part 'get_all_Items_cubit.freezed.dart';

class GetAllItemsCubit extends BaseCubit<GetAllItemsState> {
  late ItemService itemService;

  GetAllItemsCubit({required super.context})
      : super(initialState: GetAllItemsState.initial()){
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
