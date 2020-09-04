import 'package:equatable/equatable.dart';

abstract class PedidoActualEvent extends Equatable{
  PedidoActualEvent([List props = const []]) : super(props);
}

class GetPedidoActual extends PedidoActualEvent{
    GetPedidoActual():super([]);
}