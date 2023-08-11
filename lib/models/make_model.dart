import 'package:review_flutter/repository/base_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'make_model.g.dart';

@JsonSerializable()
class MakeModel implements Serializable {
  @JsonKey(name: 'Make_ID')
  int id;

  MakeModel(this.id);

  factory MakeModel.fromJson(Map<String, dynamic> json) =>
      _$MakeModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MakeModelToJson(this);
}
