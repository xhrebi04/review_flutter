import 'package:dio/dio.dart';
import 'package:review_flutter/repository/base_repository.dart';
import 'package:review_flutter/services/api/api_client_service.dart';
import 'package:review_flutter/services/middleware/basic.dart';
import 'package:review_flutter/services/middleware/error.dart';

class VehiclesRepository extends BaseRepository {
  Dio dio;

  VehiclesRepository({required this.dio});

  Future getAllManufacturersRequest({Map<String, dynamic>? params}) => dio
      .get('/vehicles/GetAllManufacturers?format=$responseFormat',
          queryParameters: params)
      .then(basicMiddleware)
      .catchError(errorMiddleware);

  Future getMakesByManufacturerIdRequest(
          {required int id, Map<String, dynamic>? params}) =>
      dio
          .get('/vehicles/GetMakeForManufacturer/$id?format=$responseFormat',
              queryParameters: params)
          .then(basicMiddleware)
          .catchError(errorMiddleware);

  Future getModelsByMakeIdRequest(
          {required int id, Map<String, dynamic>? params}) =>
      dio
          .get('/vehicles/GetModelsForMakeId/$id?format=$responseFormat',
              queryParameters: params)
          .then(basicMiddleware)
          .catchError(errorMiddleware);
}
