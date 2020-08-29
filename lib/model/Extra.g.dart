// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Extra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Extra _$ExtraFromJson(Map<String, dynamic> json) {
  return Extra(
    codigoExtra: json['id_orden_extra'] as int,
    nombre: json['nombre'] as String,
    precio: json['precio'] as int,
  );
}

Map<String, dynamic> _$ExtraToJson(Extra instance) => <String, dynamic>{
      'id_orden_extra': instance.codigoExtra,
      'nombre': instance.nombre,
      'precio': instance.precio,
    };
