import 'package:json_annotation/json_annotation.dart';
import 'package:izi_repartidores/model/repartidor.dart';

part 'logInAnswer.g.dart';

@JsonSerializable()
class LogInAnswer{
  @JsonKey(name: 'error')
  String error;
  @JsonKey(name: 'respuesta')
  Repartidor repartidor;
  LogInAnswer(this.error,this.repartidor);
  factory LogInAnswer.fromJson(Map<String, dynamic> json) => _$LogInAnswerFromJson(json);

  Map<String, dynamic> toJson() => _$LogInAnswerToJson(this);

}