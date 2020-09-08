import 'package:flutter/material.dart';
import 'package:izi_repartidores/model/repartidor.dart';
import 'package:izi_repartidores/screens/pedidoActual/pedidoActual.dart';
import 'package:izi_repartidores/screens/pedidos/pedidos.dart';
import 'package:izi_repartidores/screens/perfil/perfil.dart';
import 'package:izi_repartidores/screens/solicitudes/solicitud.dart';
import 'package:izi_repartidores/size_config.dart';

class Home extends StatefulWidget {
  final Repartidor repartidor;

  const Home({Key key, this.repartidor}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page = 0;
  List<String> titulos = [
    "Perfil",
    "Historial",
    "Solicitudes",
    "Pedido Actual"
  ];
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Perfil(repartidor: widget.repartidor),
      PedidosPage(),
      Solicitudes(),
      PedidoActualPage()
    ];
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: buildAppBar(),
      body: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.white),
          child: screens[page]),
      bottomNavigationBar: buildNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        titulos[page],
        style: TextStyle(
            color: Colors.white, fontSize: getProportionateScreenHeight(20)),
      ),
      elevation: 0,
      centerTitle: true,
    );
  }

  BottomNavigationBar buildNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: page,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Perfil")),
        BottomNavigationBarItem(
            icon: Icon(Icons.assessment), title: Text("Historial")),
        BottomNavigationBarItem(
            icon: Icon(Icons.drive_eta_outlined), title: Text("Solicitudes")),
        BottomNavigationBarItem(
            icon: Icon(Icons.bike_scooter), title: Text("Pedido Actual")),
      ],
      onTap: (index) {
        setState(() {
          page = index;
        });
      },
    );
  }
}
