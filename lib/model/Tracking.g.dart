// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Tracking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tracking _$TrackingFromJson(Map<String, dynamic> json) {
  return Tracking(
    codigoOrdenTracking: json['id_orden_tracking'] as num,
    codigoUsuario: json['id_usuario'] as num,
    mensaje: json['mensaje'] as String,
    estado: json['estado'] as String,
    fechaCreacion: json['fecha_creacion'] as String,
    codigoOrden: json['id_orden'] as num,
    rol: json['rol'] as String,
  );
}

Map<String, dynamic> _$TrackingToJson(Tracking instance) => <String, dynamic>{
      'id_orden_tracking': instance.codigoOrdenTracking,
      'id_usuario': instance.codigoUsuario,
      'mensaje': instance.mensaje,
      'estado': instance.estado,
      'fecha_creacion': instance.fechaCreacion,
      'id_orden': instance.codigoOrden,
      'rol': instance.rol,
    };
