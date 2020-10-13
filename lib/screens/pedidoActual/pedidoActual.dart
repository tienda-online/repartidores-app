import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izi_repartidores/components/loading.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/screens/pedidoActual/bloc/pedido_actual_bloc.dart';
import 'package:izi_repartidores/screens/pedidoActual/bloc/pedido_actual_event.dart';
import 'package:izi_repartidores/screens/pedidoActual/bloc/pedido_actual_state.dart';
import 'package:izi_repartidores/screens/pedidoActual/components/PedidoTerminado.dart';
import 'package:izi_repartidores/screens/pedidoActual/components/pedidoActualComponent.dart';
import 'package:izi_repartidores/size_config.dart';

class PedidoActualPage extends StatefulWidget {
  @override
  _PedidoActualPageState createState() => _PedidoActualPageState();
}

class _PedidoActualPageState extends State<PedidoActualPage> {
  final pedidoActualBloc = PedidoActualBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pedidoActualBloc.dispatch(GetPedidoActual());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => Navigator.of(context).pop(),
        child: Icon(
          Icons.close,
          color: kPrimaryColor,
          size: getProportionateScreenHeight(30),
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocProvider<PedidoActualBloc>(
        bloc: pedidoActualBloc,
        child: BlocBuilder(
            bloc: pedidoActualBloc,
            builder: (context, state) {
              if (state is PedidoActualLoading) {
                return Loading();
              } else if (state is PedidoActualFailed) {
                return Center(child: Text(state.error));
              } else if (state is PedidoActualCompleted) {
                return PedidoActualComponent(
                  ordenActual: state.orden,
                  estado: state.estado,
                );
              } else if (state is PedidoActualTerminado) {
                return PedidoTerminado(
                  orden: state.orden,
                );
              }
            }),
      ),
    );
  }
}
