import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

const String responseFormat = 'json';

class ApiClientService extends GetxController {
  late Dio dio;

  @override
  void onInit() {
    super.onInit();

    dio = generateDio();
  }

  static Dio generateDio() {
    String baseUrl = dotenv.env["API_URL"]!;
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    Dio dio = Dio(BaseOptions(baseUrl: baseUrl, headers: headers));

    return dio;
  }
}
