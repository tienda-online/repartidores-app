import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class FormInput extends StatelessWidget{
  final TextEditingController controller ;
  final String hintText;
  final bool isContrasena;

  const FormInput({Key key, this.controller, this.hintText,this.isContrasena}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(getProportionateScreenHeight(20)),
      child: Container(
        width: getProportionateScreenWidth(300),
        height: getProportionateScreenHeight(40),
        child: TextFormField(
          controller: controller,
          obscureText: isContrasena,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20),
            hintText: hintText,
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color:Colors.grey[50],width: 3.0),

              )
          ),
        ),
      ),
    );
  
  }
  
}