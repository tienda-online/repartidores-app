import 'package:equatable/equatable.dart';

abstract class DetallesEvent extends Equatable{
  DetallesEvent([List props = const []]) : super(props);
}

class GetDetalles extends DetallesEvent{
  int codigoOrden;

    GetDetalles({this.codigoOrden}):super([codigoOrden]);
}