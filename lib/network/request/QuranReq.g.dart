// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuranReq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranReq _$QuranReqFromJson(Map<String, dynamic> json) {
  return QuranReq(
    reader_id: json['reader_id'] as int,
    sura: json['sura'] as String,
  );
}

Map<String, dynamic> _$QuranReqToJson(QuranReq instance) {
  final val = <String, dynamic>{
    'reader_id': instance.reader_id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sura', instance.sura);
  return val;
}
