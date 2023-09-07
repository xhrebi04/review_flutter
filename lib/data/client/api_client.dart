import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  late Dio dio;

  ApiClient() {
    String baseUrl = dotenv.env["API_URL"]!;
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    dio = Dio(BaseOptions(baseUrl: baseUrl, headers: headers));
  }
}
