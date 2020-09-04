import 'package:json_annotation/json_annotation.dart';

part 'ClienteDireccion.g.dart';

@JsonSerializable()
class ClienteDireccion {
  @JsonKey(name:"id_usuario_direccion")
  num codigoClienteDireccion;
  @JsonKey(name:"direccion")
  String direccion;
  @JsonKey(name: "referencia")
  String referencia;
  @JsonKey(name: "latitud")
  String latitud;
  @JsonKey(name:"longitud")
  String longitud;
  ClienteDireccion({this.codigoClienteDireccion,this.direccion,this.referencia,this.latitud,this.longitud});

   factory ClienteDireccion.fromJson(Map<String, dynamic> json) => _$ClienteDireccionFromJson(json);

  Map<String, dynamic> toJson() => _$ClienteDireccionToJson(this);
}