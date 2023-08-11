import 'package:dio/dio.dart';
import 'package:review_flutter/services/error/error_service.dart';

errorMiddleware(error) {
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        ErrorService.handleTimeoutError();
        break;
      case DioExceptionType.badCertificate:
        ErrorService.handleBadCertificateError();
        break;
      case DioExceptionType.connectionError:
        ErrorService.handleConnectionError();
        break;
      case DioExceptionType.badResponse:
        ErrorService.handleBadResponseError(error);
        break;
      case DioExceptionType.cancel:
        ErrorService.handleCancelError();
        break;
      case DioExceptionType.unknown:
        ErrorService.handleUnknownError();
        break;
    }
  } else {
    ErrorService.handleUnknownError();
  }
}
