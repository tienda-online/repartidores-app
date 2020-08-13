import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/model/logInAnswer.dart';
import 'package:shop_app/model/login.dart';
import 'package:shop_app/model/repartidor.dart';
import 'package:shop_app/screens/login/bloc/login_event.dart';
import 'package:shop_app/screens/login/bloc/login_state.dart';
import 'package:http/http.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  @override
  LogInState get initialState => LoginInitial();

  // Under the hood, the Bloc library works with regular Dart Streams.
  // The "async*" makes this method an async generator, which outputs a Stream
  @override
  Stream<LogInState> mapEventToState(
    LogInEvent event,
  ) async* {
    // Distinguish between different events, even though this app has only one
    if (event is GetlogIn) {
      // Outputting a state from the asynchronous generator
      yield LoginLoading();
      final login = await _fetchLogin(event.usuario,event.contrasena);
      if (login.error=="true"){
        yield LoginFailed();
      }else{
        yield LogInLoaded(login);
      }
      
    }
  }

  Future<LogInAnswer> _fetchLogin(String usuario,String contrasena) async {
    try{
    String jsonBody = '{"correo": "${usuario}", "contrasena": "${contrasena}"}';
    Response response = await put(kapiUrl+"/login", body: jsonBody);
    var respuesta=json.decode(response.body);
    return LogInAnswer.fromJson(respuesta);
    }
    catch(e){
      return LogInAnswer("true",null);
    }
  }
}