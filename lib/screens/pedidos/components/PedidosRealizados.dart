import 'package:flutter/material.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/model/orden.dart';
import 'package:izi_repartidores/screens/pedidos/components/PedidoComponent.dart';

class PedidosRealizados extends StatefulWidget {
  List<Orden> ordenesRealizadas;
  PedidosRealizados({Key key,ordenes,this.ordenesRealizadas}) : super(key: key);

  @override
  _PedidosRealizadosState createState() => _PedidosRealizadosState();
}

class _PedidosRealizadosState extends State<PedidosRealizados> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titulo(),
        pedidosRealizados()
      ],
    );
  }

  Widget titulo(){
    return Text("Ordenes realizadas (${widget.ordenesRealizadas.length})",style: TextStyle(color: kSecondaryColor),);
  }
  Column pedidosRealizados(){
    return Column(children: List.generate(widget.ordenesRealizadas.length, (index) {
      return PedidoComponent(orden: widget.ordenesRealizadas[index],nuevo: false,);
    }),);
  }

}