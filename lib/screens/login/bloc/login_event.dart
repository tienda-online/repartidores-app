
import 'package:equatable/equatable.dart';

abstract class LogInEvent extends Equatable{
  LogInEvent([List props = const []]) : super(props);
}

class GetlogIn extends LogInEvent {
  final String usuario;
  final String contrasena;

  // Equatable allows for a simple value equality in Dart.
  // All you need to do is to pass the class fields to the super constructor.
  GetlogIn(this.usuario,this.contrasena) : super([usuario,contrasena]);
}