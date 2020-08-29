import 'package:flutter/material.dart';

class Estado extends StatefulWidget {
  Estado({Key key}) : super(key: key);

  @override
  _EstadoState createState() => _EstadoState();
}

class _EstadoState extends State<Estado> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(child:Text("Estado Orden")),
    );
  }
}