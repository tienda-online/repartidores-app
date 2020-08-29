
import 'dart:convert';

import 'package:http/http.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/model/Respuesta.dart';
import 'package:izi_repartidores/model/orden.dart';
import 'package:izi_repartidores/model/repartidor.dart';
class RequestService {

  static Future<dynamic> fetchLogin(String usuario,String contrasena) async {
    try{
    String jsonBody = '{"correo": "${usuario}", "contrasena": "${contrasena}"}';
    Response response = await put(kapiUrl+"/login", body: jsonBody);
    var respuesta=json.decode(response.body);
    if (respuesta["error"]=="true"){
      return respuesta["respuesta"];
    }
    token=response.headers["token"];
    return Repartidor.fromJson(respuesta["respuesta"]);
    }
    catch(e){
      return "Error de conexion de servidor";
    }
  }

  static Future<dynamic> getPedidoActual() async{
    try{
    Map<String,String> headers={"token":token};
    var response= await get("${kapiUrl}/ordenes/actual",headers: headers);
    var respuesta=json.decode(response.body);
    if (respuesta["error"]=="true"){
      return respuesta["respuesta"];
    }
    return Orden.fromJson(respuesta["respuesta"]);
    }
    catch(e){
      return "Error de conexion con el servidor";
    }
  }

  static Future<Respuesta> getPedidos() async{
    try{
      Map<String,String> headers={"token":token};
      var response= await get("${kapiUrl}/ordenes",headers: headers);
      return Respuesta.fromJson(json.decode(response.body));
    }catch (e){
      return Respuesta(error: "true",respuesta: "Error de conexion con el servidor");
    }
  }

   static Future<Respuesta> getDetalles(int codigoOrden) async{
    try{
      Map<String,String> headers={"token":token};
      var response= await get("${kapiUrl}/ordenes/${codigoOrden}/detalles",headers: headers);
      return Respuesta.fromJson(json.decode(response.body));
    }catch (e){
      return Respuesta(error: "true",respuesta: "Error de conexion con el servidor");
    }
  }

   static Future<Respuesta> aceptarOrden(int codigoOrden) async{
    try{
      Map<String,String> headers={"token":token};
      var response= await put("${kapiUrl}/ordenes/${codigoOrden}/aceptar",headers: headers);
      return Respuesta.fromJson(json.decode(response.body));
    }catch (e){
      return Respuesta(error: "true",respuesta: "Error de conexion con el servidor");
    }
  }

}
