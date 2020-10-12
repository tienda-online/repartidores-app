import 'package:json_annotation/json_annotation.dart';

part 'repartidor.g.dart';

@JsonSerializable()
class Repartidor {
  @JsonKey(name: 'id_repartidor')
  int codigoRepartidor;
  @JsonKey(name: 'nombre')
  String nombre;
  @JsonKey(name: 'apellido')
  String apellido;
  @JsonKey(name: 'correo')
  String correo;
  @JsonKey(name: 'imagen')
  String imagen;
  @JsonKey(name: 'telefono')
  String telefono;
  @JsonKey(name: 'estado')
  String estado;
  @JsonKey(name: "in_descanso")
  String inDescanso;
  Repartidor(
      {this.codigoRepartidor,
      this.correo,
      this.nombre,
      this.imagen,
      this.telefono,
      this.apellido,
      this.estado,
      this.inDescanso});
  factory Repartidor.fromJson(Map<String, dynamic> json) =>
      _$RepartidorFromJson(json);

  Map<String, dynamic> toJson() => _$RepartidorToJson(this);
}
