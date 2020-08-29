// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Preferencia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreferenciaOrden _$PreferenciaOrdenFromJson(Map<String, dynamic> json) {
  return PreferenciaOrden(
    codigoPreferencia: json['id_orden_preferencia'] as int,
    nombre: json['nombre'] as String,
    titulo: json['titulo'] as String,
  )..precio = json['precio'] as num;
}

Map<String, dynamic> _$PreferenciaOrdenToJson(PreferenciaOrden instance) =>
    <String, dynamic>{
      'id_orden_preferencia': instance.codigoPreferencia,
      'nombre': instance.nombre,
      'precio': instance.precio,
      'titulo': instance.titulo,
    };
