import 'package:izi_repartidores/model/Cliente.dart';
import 'package:izi_repartidores/model/Tracking.dart';
import 'package:izi_repartidores/model/producto.dart';
import 'package:izi_repartidores/model/sucursal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orden.g.dart';

@JsonSerializable(explicitToJson: true)
class Orden {
  @JsonKey(name: "id_orden")
  int codigoOrden;
  @JsonKey(name: "sucursal")
  Sucursal sucursal;
  @JsonKey(name: "cliente")
  Cliente cliente;
  @JsonKey(name: "subtotal")
  double subtotal;
  @JsonKey(name: "iva")
  double iva;
  @JsonKey(name: "envio")
  double envio;
  @JsonKey(name: "total")
  double total;
  @JsonKey(name: "descuento")
  double descuento;
  @JsonKey(name: "productos")
  List<Producto> productos;
  @JsonKey(name: "fecha_creacion")
  String fechaCreacion;
  @JsonKey(name: "estado")
  String estado;
  @JsonKey(name: "trackings")
  List<Tracking> trackings;

  Orden(
      {this.codigoOrden,
      this.sucursal,
      this.cliente,
      this.subtotal,
      this.iva,
      this.total,
      this.descuento,
      this.productos,
      this.fechaCreacion,
      this.estado});

  factory Orden.fromJson(Map<String, dynamic> json) => _$OrdenFromJson(json);

  Map<String, dynamic> toJson() => _$OrdenToJson(this);
}
