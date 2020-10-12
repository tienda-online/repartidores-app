import 'package:flutter/material.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/model/Tracking.dart';
import 'package:izi_repartidores/screens/pedidoActual/components/views/resumen/components/TrackingComponent.dart';
import 'package:izi_repartidores/size_config.dart';

class Estado extends StatefulWidget {
  final List<Tracking> trackings;
  Estado({Key key, this.trackings}) : super(key: key);

  @override
  _EstadoState createState() => _EstadoState();
}

class _EstadoState extends State<Estado> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Padding(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(30)),
              child: Text(
                "Estado del Pedido",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenHeight(20)),
              ),
            ),
          ),
          Flexible(
            flex: 10,
            fit: FlexFit.tight,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(10),
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: List.generate(
                    widget.trackings.length,
                    (index) => TrackingComponent(
                        widget.trackings[widget.trackings.length - index - 1])),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
