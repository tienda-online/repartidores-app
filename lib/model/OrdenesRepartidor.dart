import 'package:izi_repartidores/model/orden.dart';
import 'package:json_annotation/json_annotation.dart';
part 'OrdenesRepartidor.g.dart';
@JsonSerializable(explicitToJson: true)
class OrdenesRepartidor{
  @JsonKey(name:"ordenes_por_confirmar")
  List<Orden> ordenesConfirmar;
  @JsonKey(name:"ordenes_realizadas")
  List<Orden> ordenesRealizadas;

  OrdenesRepartidor({this.ordenesConfirmar,this.ordenesRealizadas});

    factory OrdenesRepartidor.fromJson(Map<String, dynamic> json) => _$OrdenesRepartidorFromJson(json);

    Map<String, dynamic> toJson() => _$OrdenesRepartidorToJson(this);


}