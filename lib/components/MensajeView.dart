import 'package:flutter/material.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/model/Mensaje.dart';
import 'package:izi_repartidores/size_config.dart';

class MensajeView extends StatelessWidget {
  final Mensaje mensaje;
  const MensajeView({Key key,this.mensaje}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:mensaje.rol=="Usuario" ? Alignment.centerLeft :Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(
          top: getProportionateScreenHeight(5),
          bottom:getProportionateScreenHeight(5),
          left:mensaje.rol=="Usuario" ? getProportionateScreenWidth(10): getProportionateScreenWidth(40),
          right: mensaje.rol=="Usuario" ? getProportionateScreenWidth(40):getProportionateScreenWidth(10)
          ),
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(10),vertical:10),
        decoration: BoxDecoration(
          color:mensaje.rol=="Usuario" ? Colors.black: kPrimaryColor,
          borderRadius: BorderRadius.circular(getProportionateScreenHeight(20))
         ),
        child: Text(mensaje.mensaje,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}