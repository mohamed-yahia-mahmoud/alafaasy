
import 'package:json_annotation/json_annotation.dart';
part 'QuranReq.g.dart';


@JsonSerializable()
class QuranReq{

  int reader_id;
  @JsonKey(includeIfNull: false)
  String sura;



  QuranReq({
    this.reader_id,
    this.sura,

  });


  factory QuranReq.fromJson(Map<String, dynamic> json) =>
      _$QuranReqFromJson(json);
  Map<String, dynamic> toJson() => _$QuranReqToJson(this);

}