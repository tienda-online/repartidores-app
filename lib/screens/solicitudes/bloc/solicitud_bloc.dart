import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:izi_repartidores/model/OrdenesRepartidor.dart';
import 'package:izi_repartidores/model/Respuesta.dart';
import 'package:izi_repartidores/services/request.services.dart';

part 'solicitud_event.dart';
part 'solicitud_state.dart';

class SolicitudBloc extends Bloc<SolicitudEvent, SolicitudState> {
  @override
  Stream<SolicitudState> mapEventToState(
    SolicitudEvent event,
  ) async* {
    if (event is GetSolicitudes) {
      yield SolicitudLoading();
      Respuesta respuesta = await RequestService.getPedidos();
      if (respuesta.error == "false") {
        OrdenesRepartidor ordenes =
            OrdenesRepartidor.fromJson(respuesta.respuesta);
        yield SolicitudesCompleted(ordenes);
      } else {
        yield SolicitudesFailed(respuesta.respuesta);
      }
    }
  }

  @override
  // TODO: implement initialState
  SolicitudState get initialState => SolicitudLoading();
}
