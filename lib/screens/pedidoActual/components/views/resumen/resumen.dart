import 'package:flutter/material.dart';
import 'package:izi_repartidores/model/orden.dart';
import 'package:izi_repartidores/model/producto.dart';
import 'package:izi_repartidores/screens/pedidoActual/components/views/resumen/components/productos_component.dart';
import 'package:izi_repartidores/size_config.dart';

class ResumenPedido extends StatefulWidget {
  final Orden orden;

  const ResumenPedido({Key key, this.orden}) : super(key: key);
  @override
  _ResumenPedidoState createState() => _ResumenPedidoState();
}

class _ResumenPedidoState extends State<ResumenPedido> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:getProportionateScreenHeight(25),left:getProportionateScreenWidth(20),right:getProportionateScreenWidth(10)),
      child: Column(
        children: [
          Flexible(flex:8,
          child: ListView(
            addRepaintBoundaries: false,
            children: [
            tituloPedido(),
            SizedBox(height: SizeConfig.screenHeight*0.02,),
            informacionDetalle("Direccion de afiliado",widget.orden.sucursal.direccion),
            SizedBox(height: SizeConfig.screenHeight*0.02,),
            informacionDetalle("Direccion de entrega",widget.orden.cliente.direccion.direccion),
            SizedBox(height: SizeConfig.screenHeight*0.02,),
            informacionDetalle("Metodo de Pago","Tarjeta de Credito"),
            SizedBox(height: SizeConfig.screenHeight*0.02,),
            Divider(height:20,thickness: 2),
            ProductosComponent(productos: widget.orden.productos,),
            Divider(height:20,thickness: 2),
            subTotales("Subtotal", widget.orden.subtotal),
            subTotales("Descuento", widget.orden.descuento),
            subTotales("Costo de envio", widget.orden.envio),
            total(widget.orden.total)
          ],))
        ],
      ),
    );
  }

  Widget tituloPedido(){
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pedido # ${widget.orden.codigoOrden}",style: TextStyle(color: Colors.black,fontSize: getProportionateScreenHeight(20),fontWeight: FontWeight.bold,)),
            Text(widget.orden.sucursal.nombreAfiliado,style: TextStyle(color: Colors.grey[500],fontSize: getProportionateScreenHeight(16)),)  
          ],
    );
  }

  Widget informacionDetalle(String titulo,String detalle){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Text(titulo,style: TextStyle(color: Colors.grey[500],fontSize: getProportionateScreenHeight(16)),),
        Text(detalle,style: TextStyle(color: Colors.black,fontSize: getProportionateScreenHeight(18),fontWeight: FontWeight.bold,)),
      ]
    );
  }

  Widget subTotales(String total, double numero){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),vertical: getProportionateScreenHeight(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(total,style: TextStyle(fontSize: getProportionateScreenHeight(16),color: Colors.grey[500]),),
          RichText(
            text:TextSpan(
            style: TextStyle(fontSize: getProportionateScreenHeight(18),fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: "\$",style: TextStyle(color: Colors.green)),
              TextSpan(text:"${numero.toStringAsFixed(2)}",style: TextStyle(color: Colors.black))
            ] 
            ),
          )
        ],
      ),
    );
  }

  Widget total(double numero){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),vertical: getProportionateScreenHeight(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("TOTAL",style: TextStyle(fontSize: getProportionateScreenHeight(20),color: Colors.black,fontWeight: FontWeight.bold),),
          RichText(
            text:TextSpan(
            style: TextStyle(fontSize: getProportionateScreenHeight(24),fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: "\$",style: TextStyle(color: Colors.green)),
              TextSpan(text:"${numero.toStringAsFixed(2)}",style: TextStyle(color: Colors.black))
            ] 
            ),
          )
        ],
      ),
    );
  }

}