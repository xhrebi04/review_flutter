import 'package:dio/dio.dart';
import 'package:review_flutter/generated/l10n.dart';

class ErrorService {
  static String getErrorMsg(error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ErrorService.handleTimeoutError();
        case DioExceptionType.badCertificate:
          return ErrorService.handleBadCertificateError();
        case DioExceptionType.connectionError:
          return ErrorService.handleConnectionError();
        case DioExceptionType.badResponse:
          return ErrorService.handleBadResponseError();
        case DioExceptionType.cancel:
          return ErrorService.handleCancelError();
        case DioExceptionType.unknown:
          return ErrorService.handleUnknownError();
      }
    } else {
      return ErrorService.handleUnknownError();
    }
  }

  static String handleTimeoutError() {
    return S.current.timeout_error;
  }

  static String handleBadCertificateError() {
    return S.current.bad_certificate_error;
  }

  static String handleConnectionError() {
    return S.current.connection_error;
  }

  static String handleBadResponseError() {
    return S.current.bad_response_error;
  }

  static String handleCancelError() {
    return S.current.cancel_error;
  }

  static String handleUnknownError() {
    return S.current.unknown_error;
  }
}
