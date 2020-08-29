
import 'package:flutter/rendering.dart';
import 'package:izi_repartidores/model/OrdenesRepartidor.dart';
import 'package:izi_repartidores/model/Respuesta.dart';
import 'package:izi_repartidores/screens/pedidoActual/bloc/pedido_actual_state.dart';
import 'package:izi_repartidores/screens/pedidos/bloc/pedidos_event.dart';
import 'package:izi_repartidores/screens/pedidos/bloc/pedidos_state.dart';
import 'package:izi_repartidores/services/request.services.dart';
import 'package:bloc/bloc.dart';

class PedidosBloc extends Bloc<PedidosEvent,PedidosState>{
  @override
  PedidosState get initialState => PedidosLoading();

  @override
  Stream<PedidosState> mapEventToState(PedidosEvent event) async* {
    if (event is GetPedidos){
      Respuesta respuesta= await RequestService.getPedidos();
      if (respuesta.error=="false"){
        OrdenesRepartidor ordenes=OrdenesRepartidor.fromJson(respuesta.respuesta);
        yield PedidosCompleted(ordenes);
      }else{
        yield PedidosFailed(respuesta.respuesta);
      }
    }
  }
}