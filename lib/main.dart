import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/screens/login/login.dart';
import 'package:izi_repartidores/screens/pedidos/bloc/pedidos_bloc.dart';
import 'package:izi_repartidores/services/request.services.dart';
import 'package:background_location/background_location.dart' as bg;
import 'package:onesignal/onesignal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final PedidosBloc blocPedidos = PedidosBloc();

  @override
  Widget build(BuildContext context) {
    bg.BackgroundLocation.getPermissions(
      onGranted: () {
        bg.BackgroundLocation.startLocationService();
        bg.BackgroundLocation.getLocationUpdates((location) {
          RequestService.actualizarUbicacion(
              location.latitude, location.longitude);
        });
      },
      onDenied: () {
        // Show a message asking the user to reconsider or do something else
      },
    );

    return BlocProvider<PedidosBloc>(
      bloc: blocPedidos,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Izi Repartidores',
          theme: ThemeData(
            scaffoldBackgroundColor: kPrimaryColor,
            primaryColor: kPrimaryColor,
            fontFamily: "Roboto",
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Login()),
    );
  }
}
