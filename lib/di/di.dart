import 'package:get/get.dart';
import 'package:review_flutter/repository/vehicles/vehicles_repository.dart';
import 'package:review_flutter/services/api/api_client_service.dart';

class Di {
  static void setup() {
    _registerServices();
    _registerRepositories();
  }

  static void _registerServices() {
    Get.put(ApiClientService());
  }

  static void _registerRepositories() {
    ApiClientService s = Get.find<ApiClientService>();

    Get.put(VehiclesRepository(dio: s.dio));
  }
}
