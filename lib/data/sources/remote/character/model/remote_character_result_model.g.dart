// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_character_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteCharacterResultModel _$RemoteCharacterResultModelFromJson(
        Map<String, dynamic> json) =>
    RemoteCharacterResultModel(
      info: json['info'] == null
          ? null
          : RemoteInfoModel.fromJson(json['info'] as Map<String, dynamic>),
      remoteCharacterModels: (json['results'] as List<dynamic>?)
          ?.map((e) => RemoteCharacterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteCharacterResultModelToJson(
        RemoteCharacterResultModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.remoteCharacterModels,
    };
