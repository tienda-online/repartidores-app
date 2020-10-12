import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:izi_repartidores/constants.dart';
import 'package:izi_repartidores/model/Tracking.dart';
import 'package:izi_repartidores/size_config.dart';

class TrackingComponent extends StatelessWidget {
  Tracking tracking;
  TrackingComponent(this.tracking);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
      child: Column(children: [
        Row(
          children: [
            Container(
              width: getProportionateScreenHeight(40),
              height: getProportionateScreenHeight(40),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenHeight(10))),
              child: Icon(
                Icons.check,
                color: kPrimaryLightColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
              child: Container(
                  width: getProportionateScreenWidth(280),
                  child: Text(tracking.mensaje)),
            )
          ],
        ),
        VerticalDivider(
          indent: 3,
          endIndent: 3,
          width: 3,
          thickness: 20,
          color: kPrimaryColor,
        )
      ]),
    );
  }
}
