import 'package:flutter/material.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/model/orden.dart';
import 'package:izi_repartidores/screens/login/login.dart';
import 'package:izi_repartidores/screens/pedidos/components/PedidoComponent.dart';

class PedidosNuevos extends StatefulWidget {
  List<Orden> ordenesNuevas;
  PedidosNuevos({Key key,this.ordenesNuevas}) : super(key: key);

  @override
  _PedidosNuevosState createState() => _PedidosNuevosState();
}

class _PedidosNuevosState extends State<PedidosNuevos> {
  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
         titulo(),
         pedidosNuevos()
       ],
    );
  }


  Widget titulo(){
    return Text("Ordenes pendientes (${widget.ordenesNuevas.length})",style: TextStyle(color: kSecondaryColor),);
  }

  Column pedidosNuevos(){
    return Column(children: List.generate(widget.ordenesNuevas.length, (index) {
      return PedidoComponent(orden: widget.ordenesNuevas[index],nuevo: true,);
    }),);
  }

  
}