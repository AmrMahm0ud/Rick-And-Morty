// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteInfoModel _$RemoteInfoModelFromJson(Map<String, dynamic> json) =>
    RemoteInfoModel(
      count: (json['count'] as num?)?.toInt(),
      pages: (json['pages'] as num?)?.toInt(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$RemoteInfoModelToJson(RemoteInfoModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };
