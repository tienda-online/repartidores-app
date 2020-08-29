import 'package:flutter/material.dart';
import 'package:izi_repartidores/components/circular_image.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/model/repartidor.dart';
import 'package:izi_repartidores/size_config.dart';
import 'package:izi_repartidores/size_config.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Perfil extends StatefulWidget {
  Repartidor repartidor;
  Perfil({Key key,this.repartidor}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
            Container(
            margin: EdgeInsets.symmetric(vertical:getProportionateScreenHeight(30),horizontal: getProportionateScreenWidth(20)),
            width: SizeConfig.screenWidth,
            child: Center(
                child: RichText(
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  text: TextSpan(
                    style:TextStyle(fontWeight: FontWeight.bold,fontSize:getProportionateScreenHeight(22),),
                    children: [
                      TextSpan(text: "Bienvenido ",style: TextStyle(color: Colors.black)),
                      TextSpan(text:"${widget.repartidor.nombre} ${widget.repartidor.apellido}",style: TextStyle(color: kPrimaryColor))
                    ]
                  )
                ),
              ),
            ),
            CircularImage(height: getProportionateScreenHeight(130),url: widget.repartidor.imagen,),
            SizedBox(height: getProportionateScreenHeight(30),),
            starsRating(4),
            buildInfo()
            ],
        );
  }

  Widget buildInfo(){
    return Container(
      height: SizeConfig.screenHeight*0.2,
      margin: EdgeInsets.symmetric(vertical:getProportionateScreenHeight(60),horizontal: getProportionateScreenWidth(40)),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        border: Border.all(color:kPrimaryColor,width:2 )
      ),
      child: Center(child: Text("holadrmendoz"),) ,
      );
  }
}

Widget starsRating(double rating){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SmoothStarRating(
              starCount: 5,
              rating: rating,
              size: 20.0,
              isReadOnly:true,
              color: kPrimaryColor,
              defaultIconData: Icons.star_border,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_half_outlined,
              borderColor: kPrimaryColor,
              spacing:0.0
        ),
        Text("(${rating})",style: TextStyle(color: Colors.grey[500]),)
    ],
    
  );
}
