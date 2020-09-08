import 'package:flutter/material.dart';
import 'package:izi_repartidores/model/OrdenesRepartidor.dart';
import 'package:izi_repartidores/screens/pedidos/components/PedidosNuevos.dart';
import 'package:izi_repartidores/size_config.dart';

class SolicitudesBuilder extends StatefulWidget {
  final OrdenesRepartidor ordenes;
  SolicitudesBuilder({Key key, this.ordenes}) : super(key: key);
  @override
  _SolicitudesBuilderState createState() => _SolicitudesBuilderState();
}

class _SolicitudesBuilderState extends State<SolicitudesBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(20),
            horizontal: getProportionateScreenWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [titulo(), ordenes()],
        ),
      )
    ]);
  }

  Widget titulo() {
    return Text(
      "Solicitudes de Entrega",
      style: TextStyle(
          color: Colors.black, fontSize: getProportionateScreenHeight(30)),
    );
  }

  Widget ordenes() {
    return Column(children: [
      PedidosNuevos(
        ordenesNuevas: widget.ordenes.ordenesConfirmar,
      ),
    ]);
  }
}
