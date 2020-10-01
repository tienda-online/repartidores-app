import 'package:flutter/material.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/model/orden.dart';
import 'package:izi_repartidores/screens/pedidoActual/components/views/chat.dart';
import 'package:izi_repartidores/screens/pedidoActual/components/views/estado.dart';
import 'package:izi_repartidores/screens/pedidoActual/components/views/mapa.dart';
import 'package:izi_repartidores/screens/pedidoActual/components/views/resumen/resumen.dart';
import 'package:izi_repartidores/size_config.dart';

class PedidoActualComponent extends StatefulWidget {
  final Orden ordenActual;
  PedidoActualComponent({Key key, this.ordenActual}) : super(key: key);
  @override
  _PedidoActualComponentState createState() => _PedidoActualComponentState();
}

class _PedidoActualComponentState extends State<PedidoActualComponent> {
  PageController pageController=PageController(initialPage: 0);
  int pageNumber=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex:12,
          child: Container(
          child: PageView(
            onPageChanged: (index){
              setState(() {
                pageNumber=index;
              });
            },
                controller: pageController,
                children: [
                  //Mapa(ordenActual: widget.ordenActual,),
                  Container(child: Text("hola"),),
                  ResumenPedido(orden: widget.ordenActual,),
                  Estado(),
                  Chat(ordenActual: widget.ordenActual,)
                ],
                
              ),
              
            ),
        ),
        Flexible(
          flex: 1,
          child: bottomBarActual())
        
      ],
    );
  }

  Widget bottomBarActual(){
  return Container(
    padding: EdgeInsets.only(top:getProportionateScreenHeight(10)),
    width: SizeConfig.screenWidth,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:[
        boton("Mapa", 0),
        boton("Resumen", 1),
        boton("Estado", 2),
        boton("Chat", 3),
        ]
      ),
    );
  }

  GestureDetector boton(String text,int numero){
    Color colorFondo= Colors.white;
    Color colorTexto=kPrimaryColor;
    if(numero==pageNumber ){
      colorFondo=kPrimaryColor;
      colorTexto=Colors.white;
    }
    return GestureDetector(
      onTap: (){
        pageController.jumpToPage(numero);
              setState(() {
                pageNumber=numero;
              });
      },
      child: Container(
        width:SizeConfig.screenWidth*0.23 ,
        height: SizeConfig.screenHeight*0.05,
        padding: EdgeInsets.only(left: 0),
        decoration: BoxDecoration(color:colorFondo,borderRadius: BorderRadius.circular(20),
        border: Border.all(color:kPrimaryColor,width:2 )),
        child: Center(child: Text(text,style: TextStyle(color: colorTexto,fontSize: getProportionateScreenHeight(15)),))
        ),
    );
  }

}



