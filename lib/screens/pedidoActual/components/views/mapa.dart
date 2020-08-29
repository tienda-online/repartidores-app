import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show PlatformException, rootBundle;
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/model/orden.dart';
import 'package:location/location.dart';

class Mapa extends StatefulWidget {
  Orden ordenActual;
  
  Mapa({Key key,this.ordenActual}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Mapa> {
  String _mapStyle;
  GoogleMapController mapController;
  Location _locationTracker= Location();
  StreamSubscription _locationSubscription;
  Set<Marker> markers={};
  Marker marker;
  Polyline polyline;
  GoogleMapPolyline googleMapPolyline= new GoogleMapPolyline(apiKey: "AIzaSyBJcHU6IPzrdUP5-09i3s4LXE8G0AUDaXQ");
  LatLng coordenadasSucursal;
  LatLng coordenadasUsuario;


  @override
  void initState() { 
    coordenadasSucursal=transformarCoordenadas(widget.ordenActual.sucursal.latitud, widget.ordenActual.sucursal.longitud);
    coordenadasUsuario= transformarCoordenadas(widget.ordenActual.cliente.direccion.latitud, widget.ordenActual.sucursal.latitud);
    rootBundle.loadString('assets/map_style.txt').then((string) {
    _mapStyle = string;
  });
    super.initState();
    
  }
  CameraPosition _initialPosition = CameraPosition(target: LatLng(-2.184101, -79.994533),zoom: 14);
  

void _onMapCreated(GoogleMapController controller) {
    mapController=controller;
    mapController.setMapStyle(_mapStyle);
    markers.addAll([
      Marker(
        markerId: MarkerId("sucursal"),
          position: coordenadasSucursal,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),),
      Marker(
        markerId: MarkerId("cliente"),
          position: coordenadasUsuario,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),)]
      );
    setState(() {

      getCurrentLocation();
    });
}
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30)),
          
          ),
      child: GoogleMap(   
        zoomGesturesEnabled: true, 
                onMapCreated: _onMapCreated,
                initialCameraPosition: _initialPosition,
                markers: markers,
                polylines: Set.of((polyline !=null) ? [polyline] :[]),
      ),
    );
  }

    void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      markers.remove(marker);
      marker = Marker(
          markerId: MarkerId("repartidor"),
          position: latlng,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
          markers.add(marker);
    }
    
    );
  }

  void getCurrentLocation() async{
     try {

      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData); 
      await getRuta(location, coordenadasSucursal);
      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }
      _locationSubscription = _locationTracker.onLocationChanged.listen((newLocalData) async{
        if (mapController != null) {
          double zoom= await mapController.getZoomLevel();
          mapController.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(newLocalData.latitude, newLocalData.longitude),
              tilt: newLocalData.heading,
              zoom: zoom)));
          updateMarkerAndCircle(newLocalData, imageData);
        }
      });

    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  Future<Uint8List> getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context).load("assets/images/icons8-car-48.png");
    return byteData.buffer.asUint8List();
  }
  Future<void> getRuta(LocationData ubicacion,LatLng destino) async{
    List<LatLng> puntos= await googleMapPolyline.getCoordinatesWithLocation(
      origin: LatLng(ubicacion.latitude,ubicacion.longitude), 
      destination: destino, 
      mode: RouteMode.driving
      );
      setState(() {
        polyline=Polyline(
        polylineId: PolylineId('RutaSucursal'),
        color: kPrimaryColor, 
        points: puntos,
        visible: true,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        width: 4
        );
      });
      
  }

  LatLng transformarCoordenadas(String latitud, String longitud){
    double lat=double.parse(latitud);
    double lng=double.parse(longitud);
    return LatLng(lat,lng);

  }
}