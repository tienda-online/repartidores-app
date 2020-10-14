import 'dart:convert';
import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/model/Mensaje.dart';
import 'package:izi_repartidores/model/Respuesta.dart';
import 'package:izi_repartidores/model/orden.dart';
import 'package:izi_repartidores/model/repartidor.dart';
import 'package:onesignal/onesignal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestService {
  static Future<dynamic> fetchLogin(String usuario, String contrasena) async {
    try {
      if (Platform.isAndroid) {
        OneSignal.shared.init("9975151b-07df-4e4c-8763-3e90e5eccace");
      } else {
        OneSignal.shared.init("9975151b-07df-4e4c-8763-3e90e5eccace",
            iOSSettings: {
              OSiOSSettings.autoPrompt: false,
              OSiOSSettings.inAppLaunchUrl: true
            });
      }
      var subscription =
          await OneSignal.shared.getPermissionSubscriptionState();
      String notificationToken = subscription.subscriptionStatus.userId;

      String jsonBody =
          '{"correo": "$usuario", "contrasena": "$contrasena","token_notificacion":"$notificationToken"}';
      Response response = await put(kapiUrl + "/login", body: jsonBody);
      var respuesta = json.decode(response.body);
      if (respuesta["error"] == "true") {
        return respuesta["respuesta"];
      }
      token = response.headers["token"];
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("token_auth", token);
      return Repartidor.fromJson(respuesta["respuesta"]);
    } catch (e) {
      return "Error de conexion de servidor";
    }
  }

  static Future<dynamic> getPedidoActual() async {
    try {
      Map<String, String> headers = {"token": token};
      var response = await get("${kapiUrl}/ordenes/actual", headers: headers);
      var respuesta = json.decode(response.body);
      if (respuesta["error"] == "true") {
        return respuesta["respuesta"];
      }
      return Orden.fromJson(respuesta["respuesta"]);
    } catch (e) {
      return "Error de conexion con el servidor";
    }
  }

  static Future<Respuesta> getPedidos() async {
    try {
      Map<String, String> headers = {"token": token};
      var response = await get("${kapiUrl}/ordenes", headers: headers);
      return Respuesta.fromJson(json.decode(response.body));
    } catch (e) {
      return Respuesta(
          error: "true", respuesta: "Error de conexion con el servidor");
    }
  }

  static Future<Respuesta> getDetalles(int codigoOrden) async {
    try {
      Map<String, String> headers = {"token": token};
      var response = await get("${kapiUrl}/ordenes/${codigoOrden}/detalles",
          headers: headers);
      return Respuesta.fromJson(json.decode(response.body));
    } catch (e) {
      return Respuesta(
          error: "true", respuesta: "Error de conexion con el servidor");
    }
  }

  static Future<Respuesta> aceptarOrden(int codigoOrden) async {
    try {
      Map<String, String> headers = {"token": token};
      var response = await put("${kapiUrl}/ordenes/${codigoOrden}/aceptar",
          headers: headers);
      return Respuesta.fromJson(json.decode(response.body));
    } catch (e) {
      return Respuesta(
          error: "true", respuesta: "Error de conexion con el servidor");
    }
  }

  static Future<Respuesta> getMensajesOrden(int codigoOrden) async {
    try {
      Map<String, String> headers = {"token": token};
      var response = await get("${kapiUrl}/ordenes/${codigoOrden}/mensajes",
          headers: headers);
      return Respuesta.fromJson(json.decode(response.body));
    } catch (e) {
      return Respuesta(
          error: "true", respuesta: "Error de conexion con el servidor");
    }
  }

  static Future<Respuesta> createMensaje(
      int codigoOrden, String mensaje) async {
    try {
      String jsonBody = '{"mensaje": "${mensaje}"}';
      Map<String, String> headers = {
        "token": token,
        'Content-Type': 'application/json; charset=UTF-8'
      };
      Map data = {'mensaje': mensaje};
      Response response = await post(
          "${kapiUrl}/ordenes/${codigoOrden}/mensajes",
          body: jsonBody,
          headers: headers);
      return Respuesta.fromJson(json.decode(response.body));
    } catch (e) {
      return Respuesta(
          error: "true", respuesta: "Error de conexion con el servidor");
    }
  }

  static void actualizarModoDescanso(String modo, num idRepartidor) {
    String jsonBody = '{"in_descanso":"$modo"}';
    Map<String, String> headers = {
      "token": token,
      'Content-Type': 'application/json; charset=UTF-8'
    };
    put("$kapiUrl/update/$idRepartidor", body: jsonBody, headers: headers);
  }

  static Future<Respuesta> recogerPedido(num codigoOrden) async {
    Map<String, String> headers = {
      "token": token,
      'Content-Type': 'application/json; charset=UTF-8'
    };
    try {
      Response response =
          await put("$kapiUrl/ordenes/$codigoOrden/recogida", headers: headers);
      return Respuesta.fromJson(json.decode(response.body));
    } catch (e) {
      return Respuesta(
          error: "true", respuesta: "Error de conexion con el servidor");
    }
  }

  static Future<Respuesta> terminarPedido(num codigoOrden) async {
    Map<String, String> headers = {
      "token": token,
      'Content-Type': 'application/json; charset=UTF-8'
    };
    try {
      Response response =
          await put("$kapiUrl/ordenes/$codigoOrden/terminar", headers: headers);
      return Respuesta.fromJson(json.decode(response.body));
    } catch (e) {
      return Respuesta(
          error: "true", respuesta: "Error de conexion con el servidor");
    }
  }

  static void actualizarUbicacion(double latitud, double longitud) async {
    String jsonBody = '{"latitud": ${latitud},"longitud":${longitud}}';
    SharedPreferences pref = await SharedPreferences.getInstance();
    var tokenAuth = pref.getString("token_auth");
    Map<String, String> headers = {
      "token": tokenAuth,
      'Content-Type': 'application/json; charset=UTF-8'
    };
    Response response =
        await put("$kapiUrl/ubicacion", headers: headers, body: jsonBody);
    var respuesta = Respuesta.fromJson(json.decode(response.body));
    print(respuesta.respuesta);
  }
}
