import 'package:flutter/material.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/model/orden.dart';
import 'package:izi_repartidores/screens/pedidoActual/components/views/chat.dart';
import 'package:izi_repartidores/screens/pedidoActual/components/views/estado.dart';
import 'package:izi_repartidores/screens/pedidoActual/components/views/mapa/mapa.dart';
import 'package:izi_repartidores/screens/pedidoActual/components/views/resumen/resumen.dart';
import 'package:izi_repartidores/size_config.dart';

class PedidoActualComponent extends StatefulWidget {
  final Orden ordenActual;
  final String estado;
  PedidoActualComponent({Key key, this.ordenActual, this.estado})
      : super(key: key);
  @override
  _PedidoActualComponentState createState() => _PedidoActualComponentState();
}

class _PedidoActualComponentState extends State<PedidoActualComponent> {
  int pageNumber = 0;
  List<Widget> widgets = [];
  @override
  void initState() {
    widgets = [
      Mapa(
        ordenActual: widget.ordenActual,
        estado: widget.estado,
      ),
      ResumenPedido(
        orden: widget.ordenActual,
      ),
      Estado(trackings: widget.ordenActual.trackings),
      Chat(
        ordenActual: widget.ordenActual,
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 12,
          child: Container(child: widgets[pageNumber]),
        ),
        Flexible(flex: 1, child: bottomBarActual())
      ],
    );
  }

  Widget bottomBarActual() {
    return Container(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
      width: SizeConfig.screenWidth,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        boton("Mapa", 0),
        boton("Resumen", 1),
        boton("Estado", 2),
        boton("Chat", 3),
      ]),
    );
  }

  GestureDetector boton(String text, int numero) {
    Color colorFondo = Colors.white;
    Color colorTexto = kPrimaryColor;
    Color colorBorder = kPrimaryColor;
    if (numero == pageNumber) {
      colorFondo = kPrimaryColor;
      colorTexto = Colors.white;
      colorBorder = Colors.white;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          pageNumber = numero;
        });
      },
      child: Container(
          width: SizeConfig.screenWidth * 0.23,
          height: SizeConfig.screenHeight * 0.05,
          padding: EdgeInsets.only(left: 0),
          decoration: BoxDecoration(
              color: colorFondo,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: colorBorder, width: 2)),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                color: colorTexto, fontSize: getProportionateScreenHeight(15)),
          ))),
    );
  }
}
