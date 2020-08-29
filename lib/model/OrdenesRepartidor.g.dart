// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrdenesRepartidor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdenesRepartidor _$OrdenesRepartidorFromJson(Map<String, dynamic> json) {
  return OrdenesRepartidor(
    ordenesConfirmar: (json['ordenes_por_confirmar'] as List)
        ?.map(
            (e) => e == null ? null : Orden.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ordenesRealizadas: (json['ordenes_realizadas'] as List)
        ?.map(
            (e) => e == null ? null : Orden.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OrdenesRepartidorToJson(OrdenesRepartidor instance) =>
    <String, dynamic>{
      'ordenes_por_confirmar':
          instance.ordenesConfirmar?.map((e) => e?.toJson())?.toList(),
      'ordenes_realizadas':
          instance.ordenesRealizadas?.map((e) => e?.toJson())?.toList(),
    };
