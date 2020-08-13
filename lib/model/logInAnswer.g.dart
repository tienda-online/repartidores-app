// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logInAnswer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogInAnswer _$LogInAnswerFromJson(Map<String, dynamic> json) {
  return LogInAnswer(
    json['error'] as String,
    json['respuesta'] == null
        ? null
        : Repartidor.fromJson(json['respuesta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LogInAnswerToJson(LogInAnswer instance) =>
    <String, dynamic>{
      'error': instance.error,
      'respuesta': instance.repartidor,
    };
