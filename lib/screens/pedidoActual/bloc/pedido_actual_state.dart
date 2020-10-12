import 'package:equatable/equatable.dart';
import 'package:izi_repartidores/model/orden.dart';
import 'package:izi_repartidores/model/orden.dart';

abstract class PedidoActualState extends Equatable {
  PedidoActualState([List props = const []]) : super(props);
}

class PedidoActualLoading extends PedidoActualState {}

class PedidoActualFailed extends PedidoActualState {
  final String error;
  PedidoActualFailed(this.error) : super([error]);
}

class PedidoActualCompleted extends PedidoActualState {
  final Orden orden;
  final String estado;
  PedidoActualCompleted(this.orden, this.estado) : super([orden, estado]);
}
