import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Mensaje.g.dart';

@JsonSerializable()
class Mensaje {
  @JsonKey(name:"id_mensaje")
  final num codigoMensaje;
  @JsonKey(name:"id_usuario")
  final num codigoUsuario;
  @JsonKey(name:"rol")
  final String rol;
  @JsonKey(name:"mensaje")
  final String mensaje;
  @JsonKey(name:"id_orden")
  final num codigoOrden;
  @JsonKey(name: "fecha_creacion")
  final String fechaCreacion;

  Mensaje({this.codigoMensaje, this.codigoUsuario, this.rol, this.mensaje, this.codigoOrden,this.fechaCreacion});

  factory Mensaje.fromJson(Map<String, dynamic> json) => _$MensajeFromJson(json);

  Map<String, dynamic> toJson() => _$MensajeToJson(this);

}