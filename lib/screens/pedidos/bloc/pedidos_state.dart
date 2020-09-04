import 'package:equatable/equatable.dart';
import 'package:izi_repartidores/model/OrdenesRepartidor.dart';
import 'package:izi_repartidores/model/orden.dart';
import 'package:izi_repartidores/screens/pedidoActual/bloc/pedido_actual_state.dart';

abstract class PedidosState extends Equatable {
  PedidosState([List props = const []]) : super(props);
}

class PedidosLoading extends PedidosState{}

class PedidosFailed extends PedidosState{
  final String error;
  PedidosFailed(this.error):super([error]);
}

class PedidosCompleted extends PedidosState{
  final OrdenesRepartidor ordenes;
  PedidosCompleted(this.ordenes):super([ordenes]);
}