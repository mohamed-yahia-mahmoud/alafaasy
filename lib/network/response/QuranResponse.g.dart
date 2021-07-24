// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuranResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranResponse _$QuranResponseFromJson(Map<String, dynamic> json) {
  return QuranResponse(
    message: json['message'] as String,
    count: json['count'] as int,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : MySura.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$QuranResponseToJson(QuranResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'count': instance.count,
      'data': instance.data,
    };
