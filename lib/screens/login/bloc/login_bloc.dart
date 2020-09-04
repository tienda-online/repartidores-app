import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:izi_repartidores/components/showMessage.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/model/logInAnswer.dart';
import 'package:izi_repartidores/model/login.dart';
import 'package:izi_repartidores/model/repartidor.dart';
import 'package:izi_repartidores/screens/login/bloc/login_event.dart';
import 'package:izi_repartidores/screens/login/bloc/login_state.dart';
import 'package:http/http.dart';
import 'package:izi_repartidores/services/request.services.dart';

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
      final login = await RequestService.fetchLogin(event.usuario,event.contrasena);
      if (login is String){
        yield LoginFailed(login);
      }else{
        yield LogInLoaded(login);
      }
      
    }

  }

  
}