import 'package:flutter/material.dart';
import 'package:izi_repartidores/constants.dart';
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
  List<String> titulos = ["Perfil", "Historial", "Solicitudes"];
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Perfil(repartidor: widget.repartidor),
      PedidosPage(),
      Solicitudes()
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
      floatingActionButton: FloatingActionButton(
        heroTag: "verOrdenActual",
        onPressed: () {
          MaterialPageRoute route =
              MaterialPageRoute(builder: (_) => PedidoActualPage());
          Navigator.push(context, route);
        },
        child: Icon(Icons.article),
        backgroundColor: kPrimaryColor,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        titulos[page],
        style: TextStyle(
            color: Colors.white,
            fontSize: getProportionateScreenHeight(20),
            fontWeight: FontWeight.bold),
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
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Perfil"),
        BottomNavigationBarItem(
            icon: Icon(Icons.assessment), label: "Historial"),
        BottomNavigationBarItem(
            icon: Icon(Icons.drive_eta_outlined), label: "Solicitudes")
      ],
      onTap: (index) {
        setState(() {
          page = index;
        });
      },
    );
  }
}
