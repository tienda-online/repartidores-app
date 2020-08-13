import 'package:equatable/equatable.dart';
import 'package:izi_repartidores/model/logInAnswer.dart';
import 'package:izi_repartidores/model/login.dart';


abstract class LogInState extends Equatable {
  LogInState([List props = const []]) : super(props);
}

class LoginInitial extends LogInState {}

class LoginLoading extends LogInState {}

class LoginFailed extends LogInState {
  final String error;
  LoginFailed(this.error):super([error]);

}

// Only the LogInLoaded event needs to contain data
class LogInLoaded extends LogInState {
  final dynamic login;

  LogInLoaded(this.login) : super([login]);
}