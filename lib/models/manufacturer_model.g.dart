// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manufacturer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManufacturerModel _$ManufacturerModelFromJson(Map<String, dynamic> json) =>
    ManufacturerModel(
      json['Mfr_ID'] as int,
      json['Mfr_Name'] as String? ?? '-',
      json['Country'] as String? ?? '-',
    );

Map<String, dynamic> _$ManufacturerModelToJson(ManufacturerModel instance) =>
    <String, dynamic>{
      'Mfr_ID': instance.id,
      'Mfr_Name': instance.name,
      'Country': instance.country,
    };
