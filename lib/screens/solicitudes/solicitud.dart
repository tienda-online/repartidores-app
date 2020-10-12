import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izi_repartidores/components/loading.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/screens/pedidoActual/pedidoActual.dart';
import 'package:izi_repartidores/screens/pedidos/bloc/pedidos_bloc.dart';
import 'package:izi_repartidores/screens/pedidos/bloc/pedidos_event.dart';
import 'package:izi_repartidores/screens/pedidos/bloc/pedidos_state.dart';
import 'package:izi_repartidores/screens/solicitudes/components/SolicitudBuilder.dart';
import 'package:izi_repartidores/size_config.dart';

class Solicitudes extends StatefulWidget {
  @override
  _SolicitudesState createState() => _SolicitudesState();
}

class _SolicitudesState extends State<Solicitudes> {
  @override
  Widget build(BuildContext context) {
    PedidosBloc blocPedidos = BlocProvider.of<PedidosBloc>(context);
    blocPedidos.dispatch(GetPedidos());
    return Column(
      children: [
        Flexible(
          flex: 20,
          fit: FlexFit.tight,
          child: BlocBuilder(
              bloc: blocPedidos,
              builder: (context, state) {
                if (state is PedidosLoading) {
                  return Loading();
                } else if (state is PedidosFailed) {
                  return Center(child: Text(state.error));
                } else if (state is PedidosCompleted) {
                  return SolicitudesBuilder(
                    ordenes: state.ordenes,
                  );
                }
              }),
        ),
      ],
    );
  }
}
