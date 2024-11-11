import 'package:basic/app/core/api_url/api_url.dart';
import 'package:basic/app/core/network/dio_client.dart';
import 'package:basic/app/escale/request_response/create_truck/create_truck_response.dart';
import 'package:basic/app/escale/request_response/get_all_trucks/get_all_trucks_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../request_response/create_truck/create_truck_request.dart';
import '../request_response/get_all_trucks/get_all_trucks_request.dart';


part 'truck_repo.g.dart';


@RestApi()
abstract class TruckRestClient {
  factory TruckRestClient(Dio dio, {String baseUrl}) = _TruckRestClient;
  
  @POST("/trucks")
  Future<CreateTruckResponse> createTruck(@Body() CreateTruckRequest createTruckRequest);
  
  @GET("/trucks")
  Future<List<GetAllTrucksResponse>> getAllTrucks(@Queries() Map<String, dynamic> queryMap);
  
  

}


@singleton
class TruckRepo extends RestService {
  late TruckRestClient truckRestClient;

  TruckRepo() : super() {
    this.truckRestClient = TruckRestClient(getDioClient(), baseUrl: ApiUrl.url);
  }
  
  Future<CreateTruckResponse> createTruck(CreateTruckRequest request) {
    return truckRestClient.createTruck(request);
  }

  Future<List<GetAllTrucksResponse>> getAllTrucks(GetAllTrucksRequest request) {
    return truckRestClient.getAllTrucks(request.toJson());
  }

  

}
