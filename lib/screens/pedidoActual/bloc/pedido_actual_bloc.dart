import 'dart:convert';

import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/screens/pedidoActual/bloc/pedido_actual_event.dart';
import 'package:izi_repartidores/screens/pedidoActual/bloc/pedido_actual_state.dart';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:izi_repartidores/services/request.services.dart';
class PedidoActualBloc extends Bloc<PedidoActualEvent, PedidoActualState>{
 
  @override
  // TODO: implement initialState
  PedidoActualState get initialState => PedidoActualLoading();

  @override
  Stream<PedidoActualState> mapEventToState(PedidoActualEvent event,) async* {
    if (event is GetPedidoActual){
      yield PedidoActualLoading();
      var pedido= await RequestService.getPedidoActual();
      if (pedido is String){
        yield PedidoActualFailed(pedido);
      }else{
        yield PedidoActualCompleted(pedido);
      }
    }
  }

  

}