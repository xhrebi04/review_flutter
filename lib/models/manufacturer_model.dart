import 'package:review_flutter/repository/base_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manufacturer_model.g.dart';

@JsonSerializable()
class ManufacturerModel implements Serializable {
  @JsonKey(name: 'Mfr_ID')
  int id;
  @JsonKey(name: 'Mfr_Name', defaultValue: '-')
  String name;
  @JsonKey(name: 'Country', defaultValue: '-')
  String country;

  ManufacturerModel(this.id, this.name, this.country);

  factory ManufacturerModel.fromJson(Map<String, dynamic> json) =>
      _$ManufacturerModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ManufacturerModelToJson(this);
}
