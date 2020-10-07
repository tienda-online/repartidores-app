import 'package:json_annotation/json_annotation.dart';
part 'Tracking.g.dart';

@JsonSerializable()
class Tracking {
  @JsonKey(name: "id_orden_tracking")
  num codigoOrdenTracking;
  @JsonKey(name: "id_usuario")
  num codigoUsuario;
  @JsonKey(name: "mensaje")
  String mensaje;
  @JsonKey(name: "estado")
  String estado;
  @JsonKey(name: "fecha_creacion")
  String fechaCreacion;
  @JsonKey(name: "id_orden")
  num codigoOrden;
  @JsonKey(name: "rol")
  String rol;

  Tracking(
      {this.codigoOrdenTracking,
      this.codigoUsuario,
      this.mensaje,
      this.estado,
      this.fechaCreacion,
      this.codigoOrden,
      this.rol});
  factory Tracking.fromJson(Map<String, dynamic> json) =>
      _$TrackingFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingToJson(this);
}
