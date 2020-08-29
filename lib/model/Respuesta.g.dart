// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Respuesta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Respuesta _$RespuestaFromJson(Map<String, dynamic> json) {
  return Respuesta(
    error: json['error'] as String,
    respuesta: json['respuesta'],
  );
}

Map<String, dynamic> _$RespuestaToJson(Respuesta instance) => <String, dynamic>{
      'error': instance.error,
      'respuesta': instance.respuesta,
    };
