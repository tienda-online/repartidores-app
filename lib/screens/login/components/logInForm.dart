import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izi_repartidores/components/default_button.dart';
import 'package:izi_repartidores/components/input_text.dart';
import 'package:izi_repartidores/screens/login/bloc/login_bloc.dart';
import 'package:izi_repartidores/screens/login/bloc/login_event.dart';
import 'package:izi_repartidores/size_config.dart';

class LogInForm extends StatefulWidget {
  final String error;
  const LogInForm(this.error);

  

  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
   TextEditingController usuarioController;
   TextEditingController contrasenaController;
   @override
  void initState() {
    usuarioController=new TextEditingController(text: "drmendozal98@gmail.com");
    contrasenaController=new TextEditingController(text: "admin");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(children: [
      FormInput(controller: usuarioController,hintText: "Correo Electronico",isContrasena: false,),
      FormInput(controller:contrasenaController, hintText: "Contrasena",isContrasena: true,onSubmit: (string){
        final logInBloc=BlocProvider.of<LogInBloc>(context);
        logInBloc.dispatch(GetlogIn(usuarioController.text,contrasenaController.text,context));
      },),
      olvidasteContrasena(),
      SizedBox(height: getProportionateScreenHeight(35),),
      Text(widget.error,style:TextStyle(color:Colors.red,fontSize: getProportionateScreenHeight(15),fontWeight: FontWeight.bold)),
      SizedBox(height: getProportionateScreenHeight(10),),
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
    logInBloc.dispatch(GetlogIn(usuarioController.text,contrasenaController.text,context));
  }
}



