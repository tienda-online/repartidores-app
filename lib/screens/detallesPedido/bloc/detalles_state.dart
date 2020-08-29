import 'package:equatable/equatable.dart';
import 'package:izi_repartidores/model/orden.dart';

abstract class DetallesState extends Equatable{
  DetallesState([List props = const []]) : super(props);
}

class DetallesLoading extends DetallesState{}

class DetallesFailed extends DetallesState{
  final String error;
  DetallesFailed(this.error):super([error]);
}

class DetallesCompleted extends DetallesState{
  final Orden orden;
  DetallesCompleted(this.orden):super([orden]);
}