import 'package:equatable/equatable.dart';
import 'package:shop_app/model/logInAnswer.dart';
import 'package:shop_app/model/login.dart';


abstract class LogInState extends Equatable {
  LogInState([List props = const []]) : super(props);
}

class LoginInitial extends LogInState {}

class LoginLoading extends LogInState {}
class LoginFailed extends LogInState {}

// Only the LogInLoaded event needs to contain data
class LogInLoaded extends LogInState {
  final LogInAnswer login;

  LogInLoaded(this.login) : super([login]);
}