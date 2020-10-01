// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Mensaje.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mensaje _$MensajeFromJson(Map<String, dynamic> json) {
  return Mensaje(
    codigoMensaje: json['id_mensaje'] as num,
    codigoUsuario: json['id_usuario'] as num,
    rol: json['rol'] as String,
    mensaje: json['mensaje'] as String,
    codigoOrden: json['id_orden'] as num,
    fechaCreacion: json['fecha_creacion'] as String,
  );
}

Map<String, dynamic> _$MensajeToJson(Mensaje instance) => <String, dynamic>{
      'id_mensaje': instance.codigoMensaje,
      'id_usuario': instance.codigoUsuario,
      'rol': instance.rol,
      'mensaje': instance.mensaje,
      'id_orden': instance.codigoOrden,
      'fecha_creacion': instance.fechaCreacion,
    };
