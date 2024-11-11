import 'package:basic/app/core/api_url/api_url.dart';
import 'package:basic/app/core/network/dio_client.dart';
import 'package:basic/app/escale/request_response/create_item/create_item_response.dart';
import 'package:basic/app/escale/request_response/get_all_items/get_all_items_request.dart';
import 'package:basic/app/escale/request_response/get_all_items/get_all_items_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../request_response/create_item/create_item_request.dart';


part 'item_repo.g.dart';


@RestApi()
abstract class ItemRestClient {
  factory ItemRestClient(Dio dio, {String baseUrl}) = _ItemRestClient;

  @POST("/items")
  Future<CreateItemResponse> createItem(@Body() CreateItemRequest createItemRequest);

  @GET("/items/list")
  Future<List<GetAllItemsResponse>> getAllItems(@Queries() Map<String, dynamic> queryMap);



}


@singleton
class ItemRepo extends RestService {
  late ItemRestClient itemRestClient;

  ItemRepo() : super() {
    this.itemRestClient = ItemRestClient(getDioClient(), baseUrl: ApiUrl.url);
  }
  
  Future<CreateItemResponse> createItem(CreateItemRequest request) {
    return itemRestClient.createItem(request);
  }
  
  Future<List<GetAllItemsResponse>> getAllItems(GetAllItemsRequest request) {
    return itemRestClient.getAllItems(request.toJson());
  }

  
  

}
