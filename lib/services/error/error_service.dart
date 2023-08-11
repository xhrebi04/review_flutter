import 'package:dio/dio.dart';
import 'package:review_flutter/generated/l10n.dart';
import 'package:review_flutter/utility/snackbar_utility.dart';

class ErrorService {
  static void handleTimeoutError() {
    throw S.current.timeout_error;
  }

  static void handleCancelError() {
    throw S.current.cancel_error;
  }

  static void handleBadCertificateError() {
    throw S.current.bad_certificate_error;
  }

  static void handleConnectionError() {
    throw S.current.connection_error;
  }

  static void handleUnknownError() {
    throw S.current.unknown_error;
  }

  static void handleUnauthorizedError() {
    throw S.current.unknown_error;
  }

  static void handleInternalServerError() {
    throw S.current.internal_server_error;
  }

  static void handleBadResponseError(DioException exc) {
    throw exc.message ?? S.current.error_occurred_during_request;
  }

  static void handleError(Object err) {
    String message = S.current.error_occurred_during_request;

    if (err is String) {
      message = err;
    }

    SnackbarUtility.show(message: message, type: SnackbarType.error);
  }
}
