import 'package:json_annotation/json_annotation.dart';

part 'MySura.g.dart';

@JsonSerializable()
class MySura {
  String id;
  String sora;
  String link;
  String readerName;
  String pageNumber;
  String type;
  String soraNumber;
  String ayatsNumber;


  MySura({this.id, this.sora, this.link, this.readerName, this.pageNumber,
      this.type, this.soraNumber, this.ayatsNumber});

  factory MySura.fromJson(Map<String,dynamic> json)=> _$MySuraFromJson(json);
  Map<String,dynamic>toJson()=>_$MySuraToJson(this);

}


