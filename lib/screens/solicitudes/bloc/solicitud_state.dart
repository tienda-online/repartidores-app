part of 'solicitud_bloc.dart';

abstract class SolicitudState extends Equatable {
  SolicitudState([List props = const []]) : super(props);
}

class SolicitudLoading extends SolicitudState {}

class SolicitudesFailed extends SolicitudState {
  final String error;
  SolicitudesFailed(this.error) : super([error]);
}

class SolicitudesCompleted extends SolicitudState {
  final OrdenesRepartidor ordenes;
  SolicitudesCompleted(this.ordenes) : super([ordenes]);
}
