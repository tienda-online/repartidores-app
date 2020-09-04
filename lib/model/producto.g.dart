// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Producto _$ProductoFromJson(Map<String, dynamic> json) {
  return Producto(
    idProducto: json['id_producto'] as int,
    nombreProducto: json['nombre'] as String,
    precio: (json['precio'] as num)?.toDouble(),
    cantidad: json['cantidad'] as int,
    extras: (json['extras_orden'] as List)
        ?.map(
            (e) => e == null ? null : Extra.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    codigoOrdenProducto: json['id_orden_producto'] as int,
  )..preferencias = (json['preferencias_orden'] as List)
      ?.map((e) => e == null
          ? null
          : PreferenciaOrden.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$ProductoToJson(Producto instance) => <String, dynamic>{
      'cantidad': instance.cantidad,
      'id_producto': instance.idProducto,
      'id_orden_producto': instance.codigoOrdenProducto,
      'nombre': instance.nombreProducto,
      'precio': instance.precio,
      'extras_orden': instance.extras?.map((e) => e?.toJson())?.toList(),
      'preferencias_orden':
          instance.preferencias?.map((e) => e?.toJson())?.toList(),
    };
