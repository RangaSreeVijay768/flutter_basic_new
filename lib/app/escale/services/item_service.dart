import 'package:basic/app/escale/request_response/create_item/create_item_response.dart';
import 'package:basic/app/escale/request_response/get_all_items/get_all_items_response.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../repos/item_repo.dart';
import '../request_response/create_item/create_item_request.dart';
import '../request_response/get_all_items/get_all_items_request.dart';


@singleton
class ItemService {
  late ItemRepo itemRepo;

  ItemService() {
    itemRepo = GetIt.instance<ItemRepo>();
  }

  Future<CreateItemResponse> createItem(CreateItemRequest request) {
    return itemRepo.createItem(request);
  }

  Future<List<GetAllItemsResponse>> getAllItems(GetAllItemsRequest request) {
    return itemRepo.getAllItems(request);
  }



}
