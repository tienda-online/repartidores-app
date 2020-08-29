import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/screens/login/login.dart';
import 'package:izi_repartidores/screens/pedidos/bloc/pedidos_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Izi Repartidores',
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
        primaryColor: kPrimaryColor,
        fontFamily: "Roboto",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
       home:  Login()
    );
  }
}
