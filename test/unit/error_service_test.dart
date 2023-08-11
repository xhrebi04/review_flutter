import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:review_flutter/services/error/error_service.dart';
import 'package:review_flutter/generated/l10n.dart';

class ErrorMessages {
  static String badResponse = 'Bad response!';
}

void main() async {
  String languageCode = 'en';
  final strings = await S.load(Locale(languageCode));

  void runTest(VoidCallback callback, String expectErrMsg) {
    try {
      callback();
    } catch (err) {
      expect(err, expectErrMsg);
    }
  }

  group('ErrorService', () {
    test('Handle Timeout Error', () {
      runTest(() => ErrorService.handleTimeoutError(), strings.timeout_error);
    });

    test('Handle Cancel Error', () {
      runTest(() => ErrorService.handleCancelError(), strings.cancel_error);
    });

    test('Handle Bad Certificate Error', () {
      runTest(() => ErrorService.handleBadCertificateError(),
          strings.bad_certificate_error);
    });

    test('Handle Connection Error', () {
      runTest(
          () => ErrorService.handleConnectionError(), strings.connection_error);
    });

    test('Handle Unknown Error', () {
      runTest(() => ErrorService.handleUnknownError(), strings.unknown_error);
    });

    test('Handle Unauthorized Error', () {
      runTest(
          () => ErrorService.handleUnauthorizedError(), strings.unknown_error);
    });

    test('Handle Internal Server Error', () {
      runTest(() => ErrorService.handleInternalServerError(),
          strings.internal_server_error);
    });

    test('Handle Bad Response Error #1', () {
      DioException exc = DioException(requestOptions: RequestOptions());

      runTest(() => ErrorService.handleBadResponseError(exc),
          strings.error_occurred_during_request);
    });

    test('Handle Bad Response Error #2', () {
      String message = ErrorMessages.badResponse;

      DioException exc =
          DioException(requestOptions: RequestOptions(), message: message);

      runTest(() => ErrorService.handleBadResponseError(exc), message);
    });
  });
}
