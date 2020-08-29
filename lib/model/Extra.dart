
import 'package:json_annotation/json_annotation.dart';


part 'Extra.g.dart';
@JsonSerializable()
class Extra {
  @JsonKey(name: "id_orden_extra")
  int codigoExtra;
  @JsonKey(name: "nombre")
  String nombre;
  @JsonKey(name: "precio")
  int precio;

  Extra({this.codigoExtra,this.nombre,this.precio});
  factory Extra.fromJson(Map<String, dynamic> json) => _$ExtraFromJson(json);

  Map<String, dynamic> toJson() => _$ExtraToJson(this);
}