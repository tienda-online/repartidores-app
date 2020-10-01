// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Cliente.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cliente _$ClienteFromJson(Map<String, dynamic> json) {
  return Cliente(
    direccion: json['direccion'] == null
        ? null
        : ClienteDireccion.fromJson(json['direccion'] as Map<String, dynamic>),
    codigoCliente: json['id_cliente'] as num,
    nombre: json['nombres'] as String,
    apellido: json['apellidos'] as String,
    imagen: json['imagen'] as String,
  );
}

Map<String, dynamic> _$ClienteToJson(Cliente instance) => <String, dynamic>{
      'direccion': instance.direccion,
      'id_cliente': instance.codigoCliente,
      'nombres': instance.nombre,
      'apellidos': instance.apellido,
      'imagen': instance.imagen,
    };
