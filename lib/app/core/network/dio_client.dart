import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@singleton
class ADioClient {
  final dio = Dio();

  addInterceptors(InterceptorsWrapper interceptorsWrapper) {
    dio.interceptors.add(interceptorsWrapper);
  }
}

abstract class RestService {
  late ADioClient dioClient;

  RestService() {
    this.dioClient = GetIt.instance<ADioClient>();
  }

  getDioClient() {
    return dioClient.dio;
  }
}
