import 'package:equatable/equatable.dart';
import 'package:izi_repartidores/model/orden.dart';

abstract class PedidoActualEvent extends Equatable {
  PedidoActualEvent([List props = const []]) : super(props);
}

class GetPedidoActual extends PedidoActualEvent {
  GetPedidoActual() : super([]);
}

class FinalizarPedidoActual extends PedidoActualEvent {
  final Orden orden;
  FinalizarPedidoActual(this.orden) : super([orden]);
}
