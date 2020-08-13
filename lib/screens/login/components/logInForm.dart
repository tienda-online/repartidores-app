import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/input_text.dart';
import 'package:shop_app/screens/login/bloc/login_bloc.dart';
import 'package:shop_app/screens/login/bloc/login_event.dart';
import 'package:shop_app/size_config.dart';

class LogInForm extends StatefulWidget {
  const LogInForm();

  

  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
   TextEditingController usuarioController;
   TextEditingController contrasenaController;
   @override
  void initState() {
    usuarioController=new TextEditingController();
    contrasenaController=new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(children: [
      FormInput(controller: usuarioController,hintText: "Correo Electronico",),
      FormInput(controller:contrasenaController, hintText: "Contrasena",),
      olvidasteContrasena(),
      SizedBox(height: getProportionateScreenHeight(40),),
      DefaultButton(text: "INICIAR SESION",press:iniciarSesion),
      SizedBox(height: getProportionateScreenHeight(40),),
      Divider(height:20,thickness: 2,indent: getProportionateScreenWidth(30),endIndent: getProportionateScreenWidth(30))
    ],));
  }

  Widget olvidasteContrasena(){
    return RichText(text: TextSpan(
      style: TextStyle(fontWeight:FontWeight.bold,color: Colors.grey[500],fontSize: getProportionateScreenHeight(16)),
      children:[
          TextSpan(text:"¿"),
          TextSpan(text: "Olvidaste tu contrasena",style: TextStyle(decoration:TextDecoration.underline)),
          TextSpan(text:"?"),
        ]
      )
    );
  }

  void iniciarSesion(){
    final logInBloc=BlocProvider.of<LogInBloc>(context);
    logInBloc.dispatch(GetlogIn(usuarioController.text,contrasenaController.text));
  }
}



