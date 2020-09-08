part of 'solicitud_bloc.dart';

abstract class SolicitudEvent extends Equatable {
  SolicitudEvent([List props = const []]) : super(props);
}

class GetSolicitudes extends SolicitudEvent {
  GetSolicitudes() : super([]);
}
