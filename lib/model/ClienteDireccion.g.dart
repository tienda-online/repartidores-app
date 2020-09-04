// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClienteDireccion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClienteDireccion _$ClienteDireccionFromJson(Map<String, dynamic> json) {
  return ClienteDireccion(
    codigoClienteDireccion: json['id_usuario_direccion'] as num,
    direccion: json['direccion'] as String,
    referencia: json['referencia'] as String,
    latitud: json['latitud'] as String,
    longitud: json['longitud'] as String,
  );
}

Map<String, dynamic> _$ClienteDireccionToJson(ClienteDireccion instance) =>
    <String, dynamic>{
      'id_usuario_direccion': instance.codigoClienteDireccion,
      'direccion': instance.direccion,
      'referencia': instance.referencia,
      'latitud': instance.latitud,
      'longitud': instance.longitud,
    };
