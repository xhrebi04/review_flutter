import 'package:dio/dio.dart';
import 'package:review_flutter/generated/l10n.dart';
import 'package:review_flutter/services/error/error_service.dart';

basicMiddleware(Response resp) {
  if (resp.data == null) {
    throw (S.current.could_not_namespace_json);
  }

  switch (resp.statusCode) {
    case 200:
      return resp.data;
    case 401:
      ErrorService.handleUnauthorizedError();
      break;
    case 500:
      ErrorService.handleInternalServerError();
      break;
    default:
      ErrorService.handleUnknownError();
      break;
  }
}
