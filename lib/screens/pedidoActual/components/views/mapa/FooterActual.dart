import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:izi_repartidores/components/showMessage.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/model/Respuesta.dart';
import 'package:izi_repartidores/model/orden.dart';
import 'package:izi_repartidores/screens/pedidoActual/bloc/pedido_actual_bloc.dart';
import 'package:izi_repartidores/screens/pedidoActual/bloc/pedido_actual_event.dart';
import 'package:izi_repartidores/services/request.services.dart';
import 'package:izi_repartidores/size_config.dart';

class FooterActual extends StatelessWidget {
  final Orden ordenActual;
  final String estado;
  FooterActual({Key key, this.ordenActual, this.estado}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String buttonText = estado;
    if (estado == "Entregando pedido") {
      buttonText = "Finalizar pedido";
    } else if (estado == "Recogiendo pedido") {
      buttonText = "Pedido Recogido";
    }
    return Container(
      decoration: BoxDecoration(color: kPrimaryColor),
      child: Row(
        children: [
          buildLogo(),
          buildInfo(),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        getProportionateScreenHeight(10))),
                color: Colors.green,
                padding: EdgeInsets.zero,
                child: Text(
                  buttonText,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (estado == "Recogiendo pedido") {
                    Respuesta respuesta = await RequestService.recogerPedido(
                        ordenActual.codigoOrden);
                    if (respuesta.error == "true") {
                      ShowMessage.showErrorDialog(
                          context, "Error", respuesta.respuesta);
                    } else {
                      BlocProvider.of<PedidoActualBloc>(context)
                          .dispatch(GetPedidoActual());
                    }
                  } else if (estado == "Entregando pedido") {
                    // Funcion de terminar oden
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Flexible buildInfo() {
    String nombre = ordenActual.sucursal.nombreAfiliado;
    String direccion = ordenActual.sucursal.direccion;
    String referencia = ordenActual.sucursal.referencia;
    if (estado != "Recogiendo pedido") {
      nombre = "${ordenActual.cliente.nombre}  ${ordenActual.cliente.apellido}";
      direccion = ordenActual.cliente.direccion.direccion;
      referencia = ordenActual.cliente.direccion.referencia;
    }
    return Flexible(
      fit: FlexFit.tight,
      flex: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(nombre, maxLines: 1, style: TextStyle(color: Colors.white)),
          Text(
            direccion,
            maxLines: 1,
            style: TextStyle(color: Colors.white),
          ),
          if (estado == "Recogiendo pedido")
            Text(referencia,
                maxLines: 1, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget buildLogo() {
    String imagen = ordenActual.sucursal.imagen;
    if (estado != "Recogiendo pedido") {
      imagen = ordenActual.cliente.imagen;
    }
    return Flexible(
      flex: 2,
      fit: FlexFit.tight,
      child: Container(
        height: getProportionateScreenHeight(60),
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.contain, image: NetworkImage(imagen)),
            shape: BoxShape.circle),
      ),
    );
  }
}
