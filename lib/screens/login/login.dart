import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/input_text.dart';
import 'package:shop_app/components/showMessage.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/login/bloc/login_bloc.dart';
import 'package:shop_app/screens/login/bloc/login_state.dart';
import 'package:shop_app/screens/login/components/logInForm.dart';
import 'package:shop_app/screens/login/components/textoBienvenida.dart';
import 'package:shop_app/size_config.dart';

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
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
            child: BlocProvider(
                bloc: logInBLOC,
                child: BlocBuilder(bloc: logInBLOC,
                builder: (BuildContext context,LogInState state) {
                  if (state is LoginInitial){
                    return buildLogInForm();
                  }else if (state is LoginLoading){
                    return buildLoading();
                  } else if (state is LogInLoaded){
                    return Center(child:Text("Logeado Correctamente"));
                  }else{
                    return buildLogInForm();
                  }
                },           
              ),
            )
              
            ), 
    );
  }

   Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }


  Column buildLogInForm() {
    
    return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextoBienvenida(),
              LogInForm()
            ],
          );
  }
  @override
  void dispose() {
    logInBLOC.dispose();
    super.dispose();
  }
}



