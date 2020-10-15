import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:izi_repartidores/components/MensajeView.dart';
import 'package:izi_repartidores/components/input_text.dart';
import 'package:izi_repartidores/components/showMessage.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/model/Mensaje.dart';
import 'package:izi_repartidores/model/Respuesta.dart';
import 'package:izi_repartidores/model/orden.dart';
import 'package:izi_repartidores/services/request.services.dart';
import 'package:izi_repartidores/size_config.dart';

class Chat extends StatefulWidget {
  Orden ordenActual;
  Chat({Key key, this.ordenActual}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  Timer _timer;
  TextEditingController mensajeController = TextEditingController();
  List<Mensaje> mensajes = [];

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) async {
      Respuesta respuesta =
          await RequestService.getMensajesOrden(widget.ordenActual.codigoOrden);
      if (respuesta.error == "true") {
        return;
      } else {
        List<Mensaje> mensajes = [];
        for (var menJson in respuesta.respuesta["mensajes"]) {
          Mensaje mensaje = Mensaje.fromJson(menJson);
          mensajes.add(mensaje);
        }
        setState(() {
          this.mensajes = mensajes;
        });
      }
    });
    this.getMensajesNow();

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: getProportionateScreenHeight(50)),
        child: Container(
            width: getProportionateScreenWidth(340),
            height: getProportionateScreenHeight(650),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                _titulo(),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                    ),
                    child: Column(
                      children: [
                        Flexible(
                          flex: 10,
                          child: ListView.builder(
                            itemCount: this.mensajes.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: MensajeView(mensaje: mensajes[index]),
                              );
                            },
                          ),
                        ),
                        Container(
                          child: FormInput(
                            controller: mensajeController,
                            hintText: "Ingrese mensaje",
                            isContrasena: false,
                            onSubmit: (string) async {
                              Respuesta respuesta =
                                  await RequestService.createMensaje(
                                      widget.ordenActual.codigoOrden,
                                      mensajeController.text);
                              if (respuesta.error == "true") {
                                ShowMessage.showErrorDialog(
                                    context, "Error", respuesta.respuesta);
                              } else {
                                this.getMensajesNow();
                                mensajeController.clear();
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Flexible _titulo() {
    return Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: Container(
            decoration: BoxDecoration(color: kPrimaryColor),
            child: Padding(
              padding: EdgeInsets.only(left: getProportionateScreenHeight(20)),
              child: Row(
                children: [
                  Container(
                    height: getProportionateScreenHeight(50),
                    width: getProportionateScreenHeight(50),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image:
                                NetworkImage(widget.ordenActual.cliente.imagen),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: getProportionateScreenWidth(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: getProportionateScreenHeight(20)),
                          child: Text(
                            "${widget.ordenActual.cliente.nombre} ${widget.ordenActual.cliente.apellido}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionateScreenHeight(20)),
                          ),
                        ),
                        Container(
                            width: getProportionateScreenWidth(250),
                            child: Text(
                              widget.ordenActual.cliente.direccion.direccion,
                              style: TextStyle(
                                  fontSize: getProportionateScreenHeight(15)),
                              maxLines: 1,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )));
  }

  void getMensajesNow() async {
    Respuesta respuesta =
        await RequestService.getMensajesOrden(widget.ordenActual.codigoOrden);
    if (respuesta.error == "true") {
      return;
    } else {
      List<Mensaje> mensajes = [];
      for (var menJson in respuesta.respuesta["mensajes"]) {
        Mensaje mensaje = Mensaje.fromJson(menJson);
        mensajes.add(mensaje);
      }
      setState(() {
        this.mensajes = mensajes;
      });
    }
  }
}
