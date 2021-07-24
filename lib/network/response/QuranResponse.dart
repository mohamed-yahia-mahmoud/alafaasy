import 'package:json_annotation/json_annotation.dart';

import '../model/MySura.dart';

part 'QuranResponse.g.dart';

@JsonSerializable()
class QuranResponse {
  String message;
  int count;
  List<MySura> data;


  QuranResponse({this.message, this.count, this.data});

  factory QuranResponse.fromJson(Map<String,dynamic> json)=> _$QuranResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$QuranResponseToJson(this);

}


