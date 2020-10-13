import 'dart:convert';

import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/model/Respuesta.dart';
import 'package:izi_repartidores/model/orden.dart';
import 'package:izi_repartidores/screens/pedidoActual/bloc/pedido_actual_event.dart';
import 'package:izi_repartidores/screens/pedidoActual/bloc/pedido_actual_state.dart';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:izi_repartidores/services/request.services.dart';

class PedidoActualBloc extends Bloc<PedidoActualEvent, PedidoActualState> {
  @override
  // TODO: implement initialState
  PedidoActualState get initialState => PedidoActualLoading();

  @override
  Stream<PedidoActualState> mapEventToState(
    PedidoActualEvent event,
  ) async* {
    if (event is GetPedidoActual) {
      yield PedidoActualLoading();
      var pedido = await RequestService.getPedidoActual();
      if (pedido is String) {
        yield PedidoActualFailed(pedido);
      } else {
        Orden ordenActual = pedido;
        if (ordenActual.estado == "OPRC" || ordenActual.estado == "OLRC") {
          yield PedidoActualCompleted(pedido, "Recogiendo pedido");
        } else if (ordenActual.estado == "T") {
          yield PedidoActualTerminado(pedido);
        } else {
          yield PedidoActualCompleted(pedido, "Entregando pedido");
        }
      }
    }
    if (event is FinalizarPedidoActual) {
      yield PedidoActualLoading();
      Respuesta respuesta =
          await RequestService.terminarPedido(event.orden.codigoOrden);
      if (respuesta.error == "true") {
        yield PedidoActualFailed(respuesta.respuesta);
      } else {
        yield PedidoActualTerminado(event.orden);
      }
    }
  }
}
