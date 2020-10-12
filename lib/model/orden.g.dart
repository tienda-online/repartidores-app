// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orden.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orden _$OrdenFromJson(Map<String, dynamic> json) {
  return Orden(
    codigoOrden: json['id_orden'] as int,
    sucursal: json['sucursal'] == null
        ? null
        : Sucursal.fromJson(json['sucursal'] as Map<String, dynamic>),
    cliente: json['cliente'] == null
        ? null
        : Cliente.fromJson(json['cliente'] as Map<String, dynamic>),
    subtotal: (json['subtotal'] as num)?.toDouble(),
    iva: (json['iva'] as num)?.toDouble(),
    total: (json['total'] as num)?.toDouble(),
    descuento: (json['descuento'] as num)?.toDouble(),
    productos: (json['productos'] as List)
        ?.map((e) =>
            e == null ? null : Producto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    fechaCreacion: json['fecha_creacion'] as String,
    estado: json['estado'] as String,
  )
    ..envio = (json['envio'] as num)?.toDouble()
    ..trackings = (json['tracking'] as List)
        ?.map((e) =>
            e == null ? null : Tracking.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$OrdenToJson(Orden instance) => <String, dynamic>{
      'id_orden': instance.codigoOrden,
      'sucursal': instance.sucursal?.toJson(),
      'cliente': instance.cliente?.toJson(),
      'subtotal': instance.subtotal,
      'iva': instance.iva,
      'envio': instance.envio,
      'total': instance.total,
      'descuento': instance.descuento,
      'productos': instance.productos?.map((e) => e?.toJson())?.toList(),
      'fecha_creacion': instance.fechaCreacion,
      'estado': instance.estado,
      'tracking': instance.trackings?.map((e) => e?.toJson())?.toList(),
    };
