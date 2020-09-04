import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:izi_repartidores/components/loading.dart';
import 'package:izi_repartidores/components/showMessage.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/model/Respuesta.dart';
import 'package:izi_repartidores/model/orden.dart';
import 'package:izi_repartidores/screens/detallesPedido/bloc/detalles_bloc.dart';
import 'package:izi_repartidores/screens/detallesPedido/bloc/detalles_event.dart';
import 'package:izi_repartidores/screens/detallesPedido/bloc/detalles_state.dart';
import 'package:izi_repartidores/screens/pedidoActual/components/views/resumen/resumen.dart';
import 'package:izi_repartidores/screens/pedidos/bloc/pedidos_bloc.dart';
import 'package:izi_repartidores/services/request.services.dart';
import 'package:izi_repartidores/size_config.dart';

class DetallesPedido extends StatefulWidget {
  final Orden orden;
 bool nuevo;
  DetallesPedido({Key key,this.orden,this.nuevo}) : super(key: key);

  @override
  _DetallesPedidoState createState() => _DetallesPedidoState();
}

class _DetallesPedidoState extends State<DetallesPedido> {
  final detallesBloc= DetallesBloc();
  @override
  Widget build(BuildContext context) {
    detallesBloc.dispatch(GetDetalles(codigoOrden: widget.orden.codigoOrden));
    return Scaffold(
      appBar: AppBar(
        title: Text("Solicitud de Entrega"),
        centerTitle: true,
        backgroundColor: kPrimaryLightColor,
        elevation: 0,
        ),
      backgroundColor: kPrimaryLightColor,
      body: BlocBuilder(
        bloc: detallesBloc,
        builder: (context,state){
          if (state is DetallesLoading){
            return Loading();
          }else if (state is DetallesFailed){
            return Center(child: Text(state.error),);
          }else if (state is DetallesCompleted){
            return Column(children: [
          Flexible(
            flex: 10,
            child: ResumenPedido(orden: state.orden,)),
          bottomButtons()
        ],
        );
          }
        },
           
      ),
    );
  }

  

  Widget bottomButtons(){
    if ( widget.nuevo==true){
      return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Container(
        decoration: BoxDecoration(color: kPrimaryColor,borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            boton(Colors.red,rechazarOrden,"Rechazar"),
            boton(Colors.green,aceptarOrden,"Aceptar")
        ],),
      ),
    );
    }
    return SizedBox(height: 0,);
  }

  Widget boton(Color color,Function funcion,String texto){
    return GestureDetector(
      onTap:funcion,
      child: Container(
        width: getProportionateScreenWidth(150),
        height: getProportionateScreenHeight(40),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: color),
        child:  Center(child: Text(texto,style:TextStyle(fontSize: getProportionateScreenHeight(20),color: kPrimaryLightColor),),),
        )
    );
  }

  void aceptarOrden() async{
    Respuesta respuesta= await RequestService.aceptarOrden(widget.orden.codigoOrden);
    if (respuesta.error=="true"){
      ShowMessage.showErrorDialog(context, "Error", respuesta.respuesta);
      setState(() { 
        widget.nuevo=false;
      });
    }else{
      ShowMessage.showErrorDialog(context, "Ok", respuesta.respuesta);
    }
  }
  void rechazarOrden(){

  }
}