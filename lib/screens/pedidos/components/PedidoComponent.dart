import 'package:flutter/material.dart';
import 'package:izi_repartidores/components/default_button.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/model/orden.dart';
import 'package:izi_repartidores/screens/detallesPedido/DetallesPedido.dart';
import 'package:izi_repartidores/size_config.dart';

class PedidoComponent extends StatefulWidget {
  final Orden orden;
  final bool nuevo;
  PedidoComponent({Key key,this.orden,this.nuevo}) : super(key: key);

  @override
  _PedidoComponentState createState() => _PedidoComponentState();
}

class _PedidoComponentState extends State<PedidoComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:getProportionateScreenHeight(10)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color:kSecondaryColor,offset: Offset(3,2),spreadRadius: getProportionateScreenWidth(2),blurRadius: 5)]),
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenHeight(10)) ,
          child: Column(
            children: [
              getEncabezado("Standard"),
              Divider(thickness: 2,),
              getNombres()
            ],
          ),
          ),
          
      )
    );
  } 

  Widget getEncabezado(String titulo){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
      Column(children: [
        Text("Orden # ${widget.orden.codigoOrden}",style: TextStyle(fontSize:getProportionateScreenHeight(22),color: kPrimaryColor, ),),
        Text("Fecha: ${widget.orden.fechaCreacion.split(" ")[0]}",style: TextStyle(color: kSecondaryColor,fontSize: getProportionateScreenHeight(20)),),
        RichText(text: TextSpan(
          style: TextStyle(fontSize: getProportionateScreenHeight(20),fontFamily: 'Roboto'),
          children: [
          TextSpan(text: "Envio: ",style: TextStyle(color: Colors.black)),
          TextSpan(text: "\$",style:TextStyle(color: Colors.green)),
          TextSpan(text: "${widget.orden.envio.toStringAsFixed(2)}",style: TextStyle(color: Colors.black))
        ]))
      ],
      ),
      buttonColumn()
    ],);
  }

  Widget getNombres(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
      Column(children: [
        Text("Afiliado Izi",style: TextStyle(color: kSecondaryColor,fontSize: getProportionateScreenHeight(15)),),
        Container(
          width: getProportionateScreenWidth(150),
          child: Center(child: Text("${widget.orden.sucursal.nombreAfiliado}",style: TextStyle(fontSize: getProportionateScreenHeight(20),color:Colors.black))))
      ],),
      Icon(Icons.arrow_forward),
      Column(
        children: [
        Text("Cliente",style: TextStyle(color: kSecondaryColor,fontSize: getProportionateScreenHeight(15)),),
        Container(
          width: getProportionateScreenWidth(145),
          child: Center(child: Text("${widget.orden.cliente.nombre} ${widget.orden.cliente.apellido}",style: TextStyle(fontSize: getProportionateScreenHeight(20),color: Colors.black),textAlign: TextAlign.center,)))
      ],),
    ],);
  }

 Widget button(String texto, Function funcion){
   Color color=kPrimaryColor;
   if(texto=="Rechazar"){
     color= Colors.redAccent;
   }
   return GestureDetector(
      onTap:funcion,
      child: Container(
        width: getProportionateScreenWidth(100),
        decoration: BoxDecoration(color:color,borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenHeight(5)),
          child: Center(child: Text(texto,style: TextStyle(fontSize: getProportionateScreenHeight(15),color: Colors.white),)),
        ),

   ));
 }
 Widget buttonColumn(){
   return Column(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: [
     button("Ver detalles",verOrden),
     SizedBox(height: getProportionateScreenHeight(10),),
     if (widget.nuevo==true) button("Rechazar",verOrden)
   ],);
 }

 void verOrden(){
   MaterialPageRoute route= MaterialPageRoute(builder: (context)=>DetallesPedido(orden: widget.orden,nuevo: widget.nuevo,));
   Navigator.of(context).push(route);
 }

}