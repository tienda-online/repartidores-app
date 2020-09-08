import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:izi_repartidores/size_config.dart';

class Estado extends StatefulWidget {
  Estado({Key key}) : super(key: key);

  @override
  _EstadoState createState() => _EstadoState();
}

class _EstadoState extends State<Estado> {
  CameraPosition _initialPosition =
      CameraPosition(target: LatLng(-2.184101, -79.994533), zoom: 14);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: getProportionateScreenHeight(200),
        width: getProportionateScreenWidth(200),
        child: GoogleMap(initialCameraPosition: _initialPosition));
  }
}
