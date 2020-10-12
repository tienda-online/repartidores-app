// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sucursal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sucursal _$SucursalFromJson(Map<String, dynamic> json) {
  return Sucursal(
    direccion: json['direccion'] as String,
    codigoAfiliado: json['id_afiliado'] as int,
    referencia: json['referencia'] as String,
    latitud: json['lat'] as String,
    longitud: json['lng'] as String,
    nombreAfiliado: json['nombre_afiliado'] as String,
    imagen: json['imagen'] as String,
  );
}

Map<String, dynamic> _$SucursalToJson(Sucursal instance) => <String, dynamic>{
      'direccion': instance.direccion,
      'id_afiliado': instance.codigoAfiliado,
      'referencia': instance.referencia,
      'lat': instance.latitud,
      'lng': instance.longitud,
      'nombre_afiliado': instance.nombreAfiliado,
      'imagen': instance.imagen,
    };
