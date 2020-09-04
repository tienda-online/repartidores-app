
import 'package:json_annotation/json_annotation.dart';

part 'Preferencia.g.dart';

@JsonSerializable(explicitToJson: true)
class PreferenciaOrden {
  @JsonKey(name: "id_orden_preferencia")
  int codigoPreferencia;
  @JsonKey(name: "nombre")
  String nombre;
  @JsonKey(name: "precio")
  num precio;
  @JsonKey(name: "titulo")
  String titulo;
  
  PreferenciaOrden({this.codigoPreferencia,this.nombre,this.titulo});

  factory PreferenciaOrden.fromJson(Map<String, dynamic> json) => _$PreferenciaOrdenFromJson(json);

  Map<String, dynamic> toJson() => _$PreferenciaOrdenToJson(this);


}