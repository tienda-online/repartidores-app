// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repartidor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repartidor _$RepartidorFromJson(Map<String, dynamic> json) {
  return Repartidor(
    codigoRepartidor: json['id_repartidor'] as int,
    correo: json['correo'] as String,
    nombre: json['nombre'] as String,
    imagen: json['imagen'] as String,
    telefono: json['telefono'] as String,
    apellido: json['apellido'] as String,
    estado: json['estado'] as String,
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
      'estado': instance.estado,
    };
