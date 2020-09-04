import 'package:json_annotation/json_annotation.dart';

part 'sucursal.g.dart';

@JsonSerializable()
class Sucursal{
  @JsonKey(name: "direccion")
  String direccion;
  @JsonKey(name: "id_afiliado")
  int codigoAfiliado;
  @JsonKey(name: "referencia")
  String referencia;
  @JsonKey(name: "lat")
  String latitud;
  @JsonKey(name: "lng")
  String longitud;
  @JsonKey(name: "nombre_afiliado")
  String nombreAfiliado;

  Sucursal({this.direccion,this.codigoAfiliado,this.referencia,this.latitud,this.longitud,this.nombreAfiliado});

  factory Sucursal.fromJson(Map<String, dynamic> json) => _$SucursalFromJson(json);

  Map<String, dynamic> toJson() => _$SucursalToJson(this);
}