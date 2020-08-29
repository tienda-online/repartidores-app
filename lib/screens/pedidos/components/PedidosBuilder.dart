import 'package:flutter/material.dart';
import 'package:izi_repartidores/model/OrdenesRepartidor.dart';
import 'package:izi_repartidores/screens/pedidos/components/PedidosNuevos.dart';
import 'package:izi_repartidores/screens/pedidos/components/PedidosRealizados.dart';
import 'package:izi_repartidores/size_config.dart';

class PedidosBuilder extends StatefulWidget {
  final OrdenesRepartidor ordenes;
  PedidosBuilder({Key key,this.ordenes}) : super(key: key);

  @override
  _PedidosBuilderState createState() => _PedidosBuilderState();
}

class _PedidosBuilderState extends State<PedidosBuilder> {
  @override
  Widget build(BuildContext context) {
    return  ListView(
        children:[
          Padding(
            padding: EdgeInsets.symmetric(vertical:getProportionateScreenHeight(20),horizontal: getProportionateScreenWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titulo(),
                ordenes()
              ],),
          )
        ]
    );
  }

  Widget titulo(){
    return Text("Ordenes",style: TextStyle(color: Colors.black,fontSize: getProportionateScreenHeight(30)),);
  }
  
  Widget  ordenes(){
    return Column(children: [
      PedidosNuevos(ordenesNuevas: widget.ordenes.ordenesConfirmar,),
      PedidosRealizados(ordenesRealizadas: widget.ordenes.ordenesRealizadas,)
      ]
    );
  }
}