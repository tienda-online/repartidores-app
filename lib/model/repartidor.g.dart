// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repartidor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repartidor _$RepartidorFromJson(Map<String, dynamic> json) {
  return Repartidor(
    json['id_repartidor'] as int,
    json['correo'] as String,
    json['nombre'] as String,
    json['imagen'] as String,
    json['telefono'] as String,
    json['apellido'] as String,
  );
}

Map<String, dynamic> _$RepartidorToJson(Repartidor instance) =>
    <String, dynamic>{
      'id_repartidor': instance.codigoRepartidor,
      'nombre': instance.nombre,
      'apellido': instance.apellido,
      'correo': instance.correo,
      'imagen': instance.imagen,
      'telefono': instance.telefono,
    };
