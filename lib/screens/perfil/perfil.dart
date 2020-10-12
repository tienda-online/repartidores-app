import 'package:flutter/material.dart';
import 'package:izi_repartidores/components/circular_image.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/model/repartidor.dart';
import 'package:izi_repartidores/screens/login/login.dart';
import 'package:izi_repartidores/services/request.services.dart';
import 'package:izi_repartidores/size_config.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Perfil extends StatefulWidget {
  Repartidor repartidor;
  Perfil({Key key, this.repartidor}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(30),
              horizontal: getProportionateScreenWidth(20)),
          width: SizeConfig.screenWidth,
          child: Center(
            child: RichText(
                maxLines: 1,
                overflow: TextOverflow.fade,
                text: TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenHeight(22),
                    ),
                    children: [
                      TextSpan(
                          text: "Bienvenido ",
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text:
                              "${widget.repartidor.nombre} ${widget.repartidor.apellido}",
                          style: TextStyle(color: kPrimaryColor))
                    ])),
          ),
        ),
        CircularImage(
          height: getProportionateScreenHeight(130),
          url: widget.repartidor.imagen,
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        starsRating(5),
        descansoButton(),
        buildInfo(),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        cerrarSesion()
      ],
    );
  }

  Widget cerrarSesion() {
    return FloatingActionButton(
      onPressed: () {
        MaterialPageRoute route =
            MaterialPageRoute(builder: (context) => Login());
        Navigator.push(context, route);
      },
      backgroundColor: Colors.red,
      child: Icon(Icons.exit_to_app_outlined),
    );
  }

  Widget descansoButton() {
    bool descanso = false;
    if (widget.repartidor.inDescanso == "1") {
      descanso = true;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Modo descanso"),
        Switch(
          value: descanso,
          onChanged: (value) {
            setState(() {
              if (value) {
                widget.repartidor.inDescanso = "1";
              } else {
                widget.repartidor.inDescanso = "0";
              }
              RequestService.actualizarModoDescanso(
                  widget.repartidor.inDescanso,
                  widget.repartidor.codigoRepartidor);
            });
          },
          activeTrackColor: kPrimaryColor,
          activeColor: Colors.white,
        ),
      ],
    );
  }

  Widget buildInfo() {
    return Container(
      height: SizeConfig.screenHeight * 0.25,
      margin: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(10),
          horizontal: getProportionateScreenWidth(40)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.grey[500], blurRadius: 5)]),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Informacion Relevante"),
          ],
        ),
      ),
    );
  }
}

Widget starsRating(double rating) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SmoothStarRating(
          starCount: 5,
          rating: rating,
          size: getProportionateScreenHeight(50),
          isReadOnly: true,
          color: kPrimaryColor,
          defaultIconData: Icons.star_border,
          filledIconData: Icons.star,
          halfFilledIconData: Icons.star_half_outlined,
          borderColor: kPrimaryColor,
          spacing: 0.0),
      Text(
        "(${rating})",
        style: TextStyle(color: Colors.grey[500]),
      )
    ],
  );
}
