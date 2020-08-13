import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/screens/login/login.dart';

class LogIn extends Equatable {
  final String usuario;
  final String contrasena;

  LogIn({
    @required this.usuario,
    @required this.contrasena,
  }) : super([usuario, contrasena]);
}