import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izi_repartidores/components/inicio.dart';
import 'package:izi_repartidores/components/input_text.dart';
import 'package:izi_repartidores/components/loading.dart';
import 'package:izi_repartidores/components/showMessage.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/screens/login/bloc/login_bloc.dart';
import 'package:izi_repartidores/screens/login/bloc/login_event.dart';
import 'package:izi_repartidores/screens/login/bloc/login_state.dart';
import 'package:izi_repartidores/screens/login/components/logInForm.dart';
import 'package:izi_repartidores/screens/login/components/logo.dart';
import 'package:izi_repartidores/screens/login/components/textoBienvenida.dart';
import 'package:izi_repartidores/screens/perfil/perfil.dart';
import 'package:izi_repartidores/size_config.dart';

class Login extends StatefulWidget {
 Login({Key key}) : super(key: key);

  @override
   LoginState createState() =>  LoginState();
}

class  LoginState extends State<Login> {
  final logInBLOC=LogInBloc();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    return BlocProvider<LogInBloc>(
      bloc: logInBLOC,
      child: buildScaffoldLogin());
  }

  Widget buildScaffoldLogin() {
    return  BlocListener(
      bloc: logInBLOC,
      listener: (context, state) {
        if (state is LogInLoaded) {
          MaterialPageRoute route=MaterialPageRoute(builder: (context)=>Home(repartidor:state.login));
          Navigator.of(context).pushReplacement(route);
        }
      },
          child: Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
        appBar: AppBar(title: 
        Text("Inicio de Sesion",
          style: TextStyle(color: Colors.white,fontSize: getProportionateScreenHeight(20)),),
          elevation: 0,
          centerTitle: true,
        ),
        body:Container(
            width:SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30)),
              color: Colors.white
            ), 
            child: BlocBuilder(bloc: logInBLOC,
                builder: (BuildContext context,LogInState state) {
                  if (state is LoginInitial){
                    return buildLogInForm("");
                  }else if (state is LoginLoading){
                    return Loading();
                  }else if (state is LoginFailed){
                    return buildLogInForm(state.error);
                  }
                  return buildLogInForm("");
                },           
              ),
              
            ), 
  ),
    );
  }



  Widget buildLogInForm(String error) {

    return ListView(
            children: [
              Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              SizedBox(height: getProportionateScreenHeight(30),),
              LogoLogin(),
              TextoBienvenida(),
              LogInForm(error,)
              ],)
              
            ],
          );
  }
  @override
  void dispose() {
    logInBLOC.dispose();
    super.dispose();
  }
}



