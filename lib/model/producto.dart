import 'package:izi_repartidores/model/Extra.dart';
import 'package:izi_repartidores/model/Preferencia.dart';
import 'package:json_annotation/json_annotation.dart';


import 'package:json_annotation/json_annotation.dart';
part 'producto.g.dart';
@JsonSerializable(explicitToJson: true)
class Producto{
  @JsonKey(name:"cantidad")
  int cantidad;
  @JsonKey(name:"id_producto")
  int idProducto;
  @JsonKey(name: "id_orden_producto")
  int codigoOrdenProducto;
  @JsonKey(name:"nombre")
  String nombreProducto;
  @JsonKey(name:"precio")
  double precio;
  @JsonKey(name: "extras_orden")
  List<Extra> extras;
  @JsonKey(name: "preferencias_orden")
  List<PreferenciaOrden> preferencias;

  Producto({this.idProducto,this.nombreProducto,this.precio,this.cantidad,this.extras,this.codigoOrdenProducto});

  factory Producto.fromJson(Map<String, dynamic> json) => _$ProductoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductoToJson(this);
}