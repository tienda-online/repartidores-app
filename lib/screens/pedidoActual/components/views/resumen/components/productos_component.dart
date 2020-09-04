import 'package:flutter/material.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/model/producto.dart';
import 'package:izi_repartidores/size_config.dart';

class ProductosComponent extends StatefulWidget {
  final List<Producto> productos;
  ProductosComponent({Key key,this.productos}) : super(key: key);

  @override
  _ProductosComponentState createState() => _ProductosComponentState();
}

class _ProductosComponentState extends State<ProductosComponent> {
  @override
  Widget build(BuildContext context) {
    return buildProductos();
  }

  Widget buildProductos(){
    return Column(
      children: List.generate(widget.productos.length, (index) {
      return Container(child: Column(
        children: [
          Row(
            children:
           [
             Flexible(
               fit: FlexFit.loose,
               flex: 1,
               child: Text("${widget.productos[index].cantidad}",style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold,fontSize: getProportionateScreenHeight(18))),),
               Spacer(flex:1),
              Flexible(
                fit: FlexFit.loose,
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                 [
                  Text(widget.productos[index].nombreProducto,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: getProportionateScreenHeight(18)),),
                  Text("Tamano mediana,extra de queso, con oregano masa fina",style: TextStyle(color: Colors.grey[500]),)
                ],)),
                Spacer(flex:1),
              Flexible(flex: 2,
              
                child: RichText(text: TextSpan(
                  children: [
                    TextSpan(text:"\$",style:TextStyle(color: Colors.green)),
                    TextSpan(text:"${(widget.productos[index].precio*1).toStringAsFixed(2)}",style:TextStyle(color: Colors.black))
                  ],
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: getProportionateScreenHeight(16))
                ),),
              )   
                ],

              ),
              SizedBox(height: getProportionateScreenHeight(20),)           
        ],
      ),
      );
      })
    );
  }

}