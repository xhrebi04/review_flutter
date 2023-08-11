import 'package:review_flutter/repository/base_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Model implements Serializable {
  @JsonKey(name: 'Model_ID')
  int id;
  @JsonKey(name: 'Model_Name')
  String name;

  Model(this.id, this.name);

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ModelToJson(this);
}
