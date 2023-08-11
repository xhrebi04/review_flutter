import 'package:review_flutter/repository/base_repository.dart';

class ListResponse<T extends Serializable> {
  final List<T> data;

  const ListResponse({
    required this.data,
  });

  factory ListResponse.fromJson(
      Map<String, dynamic> json, Function(List<dynamic>) create) {
    return ListResponse<T>(data: create((json)['Results'] as List<dynamic>));
  }
}
