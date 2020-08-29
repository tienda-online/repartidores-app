
import 'package:json_annotation/json_annotation.dart';

part 'Respuesta.g.dart';

@JsonSerializable(explicitToJson: true)
class Respuesta{
  @JsonKey(name: "error")
  String error;
  @JsonKey(name: "respuesta")
  dynamic respuesta;

  Respuesta({this.error,this.respuesta});

  factory Respuesta.fromJson(Map<String, dynamic> json) => _$RespuestaFromJson(json);

  Map<String, dynamic> toJson() => _$RespuestaToJson(this);

}