// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MySura.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MySura _$MySuraFromJson(Map<String, dynamic> json) {
  return MySura(
    id: json['id'] as String,
    sora: json['sora'] as String,
    link: json['link'] as String,
    readerName: json['readerName'] as String,
    pageNumber: json['pageNumber'] as String,
    type: json['type'] as String,
    soraNumber: json['soraNumber'] as String,
    ayatsNumber: json['ayatsNumber'] as String,
  );
}

Map<String, dynamic> _$MySuraToJson(MySura instance) => <String, dynamic>{
      'id': instance.id,
      'sora': instance.sora,
      'link': instance.link,
      'readerName': instance.readerName,
      'pageNumber': instance.pageNumber,
      'type': instance.type,
      'soraNumber': instance.soraNumber,
      'ayatsNumber': instance.ayatsNumber,
    };
