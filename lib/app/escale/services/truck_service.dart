import 'package:basic/app/escale/request_response/create_truck/create_truck_response.dart';
import 'package:basic/app/escale/request_response/get_all_trucks/get_all_trucks_response.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../repos/truck_repo.dart';
import '../request_response/create_truck/create_truck_request.dart';
import '../request_response/get_all_trucks/get_all_trucks_request.dart';


@singleton
class TruckService {
  late TruckRepo truckRepo;

  TruckService() {
    truckRepo = GetIt.instance<TruckRepo>();
  }

  Future<CreateTruckResponse> createTruck(CreateTruckRequest request) {
    return truckRepo.createTruck(request);
  }

  Future<List<GetAllTrucksResponse>> getAllTrucks(GetAllTrucksRequest request) {
    return truckRepo.getAllTrucks(request);
  }


}
