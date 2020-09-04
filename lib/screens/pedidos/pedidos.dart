import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izi_repartidores/components/loading.dart';
import 'package:izi_repartidores/screens/pedidos/bloc/pedidos_bloc.dart';
import 'package:izi_repartidores/screens/pedidos/bloc/pedidos_event.dart';
import 'package:izi_repartidores/screens/pedidos/bloc/pedidos_state.dart';
import 'package:izi_repartidores/screens/pedidos/components/PedidosBuilder.dart';
import 'package:izi_repartidores/size_config.dart';

class PedidosPage extends StatefulWidget {
  @override
  _PedidosPageState createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  final PedidosBloc blocPedidos= PedidosBloc();
  @override
  Widget build(BuildContext context) {
    blocPedidos.dispatch(GetPedidos());
    return BlocProvider<PedidosBloc>(
      bloc: blocPedidos,
      child: BlocBuilder(bloc: blocPedidos, 
      builder: (context,state){
        if (state is PedidosLoading){
          return Loading();
        }
        else if (state is PedidosFailed){
          return Center(child:Text(state.error));
        }else if (state is PedidosCompleted){
          return PedidosBuilder(ordenes: state.ordenes,);
        }
        }
      ),
    );
  }

  

}