
import 'package:izi_repartidores/model/ClienteDireccion.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Cliente.g.dart';
@JsonSerializable()
class Cliente{
  @JsonKey(name: "direccion")
  ClienteDireccion direccion;
  @JsonKey(name:"id_cliente")
  num codigoCliente;
  @JsonKey(name:"nombres")
  String nombre;
  @JsonKey(name: "apellidos")
  String apellido;
  @JsonKey(name: "imagen")
  String imagen;

  Cliente({this.direccion,this.codigoCliente,this.nombre,this.apellido,this.imagen});


  factory Cliente.fromJson(Map<String, dynamic> json) => _$ClienteFromJson(json);

  Map<String, dynamic> toJson() => _$ClienteToJson(this);

}