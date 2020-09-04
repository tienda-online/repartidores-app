
import 'package:equatable/equatable.dart';

abstract class PedidosEvent extends Equatable{
  PedidosEvent([List props= const []]): super(props);
}

class GetPedidos extends PedidosEvent {
  GetPedidos():super([]);
}