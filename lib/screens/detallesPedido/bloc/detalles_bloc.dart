
import 'package:izi_repartidores/model/orden.dart';
import 'package:izi_repartidores/screens/detallesPedido/bloc/detalles_event.dart';
import 'package:izi_repartidores/screens/detallesPedido/bloc/detalles_state.dart';
import 'package:izi_repartidores/services/request.services.dart';
import 'package:bloc/bloc.dart';
class DetallesBloc extends Bloc<DetallesEvent, DetallesState>{
 
  @override
  // TODO: implement initialState
  DetallesState get initialState => DetallesLoading();

  @override
  Stream<DetallesState> mapEventToState(DetallesEvent event,) async* {
    if (event is GetDetalles){
      yield DetallesLoading();
      var pedido= await RequestService.getDetalles(event.codigoOrden);
      if (pedido.error=="true"){
        yield DetallesFailed(pedido.respuesta);
      }else{
        yield DetallesCompleted(Orden.fromJson(pedido.respuesta));
      }
    }
  }

  

}