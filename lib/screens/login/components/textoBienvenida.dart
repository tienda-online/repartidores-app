import 'package:flutter/material.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/size_config.dart';

class TextoBienvenida extends StatelessWidget {
  const TextoBienvenida({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding:  EdgeInsets.symmetric(vertical: getProportionateScreenHeight(40)),
                child: RichText(text: TextSpan(
                  style: TextStyle(fontWeight:FontWeight.bold,fontSize: getProportionateScreenHeight(17)),
                  children: [
                    TextSpan(text:"Bienvenido a la aplicacion de repartidores de Izi,\n",style: TextStyle(color:Colors.black)),
                    TextSpan(text: "para empezar primero debes iniciar sesion",style: TextStyle(color:kPrimaryColor))
                  ]
                )),
              );
  }
}