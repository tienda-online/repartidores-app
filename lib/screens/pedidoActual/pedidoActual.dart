import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izi_repartidores/components/loading.dart';
import 'package:izi_repartidores/screens/pedidoActual/bloc/pedido_actual_bloc.dart';
import 'package:izi_repartidores/screens/pedidoActual/bloc/pedido_actual_event.dart';
import 'package:izi_repartidores/screens/pedidoActual/bloc/pedido_actual_state.dart';
import 'package:izi_repartidores/screens/pedidoActual/components/views/chat.dart';
import 'package:izi_repartidores/screens/pedidoActual/components/views/estado.dart';
import 'package:izi_repartidores/screens/pedidoActual/components/views/mapa.dart';
import 'package:izi_repartidores/screens/pedidoActual/components/pedidoActualComponent.dart';

class PedidoActualPage extends StatefulWidget {
  
  @override
  _PedidoActualPageState createState() => _PedidoActualPageState();
}

class _PedidoActualPageState extends State<PedidoActualPage> {
  final pedidoActualBloc=PedidoActualBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pedidoActualBloc.dispatch(GetPedidoActual());
    return BlocProvider<PedidoActualBloc>(
      bloc: pedidoActualBloc,
      child: BlocBuilder(
        bloc: pedidoActualBloc,
        builder: (context,state){
          if (state is PedidoActualLoading){
            return Loading();
          }
          else if (state is PedidoActualFailed){
            return Center(child:Text(state.error));
          }
          else if (state is PedidoActualCompleted){
            return PedidoActualComponent(ordenActual:state.orden);
          }
        }),
    );
  }


}

