import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:izi_repartidores/screens/login/login.dart';

class LogIn extends Equatable {
  final String usuario;
  final String contrasena;

  LogIn({
    @required this.usuario,
    @required this.contrasena,
  }) : super([usuario, contrasena]);
}