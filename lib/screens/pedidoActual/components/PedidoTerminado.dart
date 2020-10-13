import 'package:flutter/material.dart';
import 'package:izi_repartidores/model/orden.dart';

class PedidoTerminado extends StatelessWidget {
  final Orden orden;
  const PedidoTerminado({Key key, this.orden}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Pedido terminado correctamente"),
      ),
    );
  }
}
