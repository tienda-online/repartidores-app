import 'package:flutter/cupertino.dart';
import 'package:izi_repartidores/size_config.dart';


class LogoLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
    width: SizeConfig.screenWidth*0.4,
    height: SizeConfig.screenHeight*0.2,
      alignment: Alignment.center,
      decoration: new BoxDecoration(

      image: DecorationImage(
          image: AssetImage('assets/images/logo_principal.png'),
          fit: BoxFit.fill
      ),
    ),
  );
  }

}