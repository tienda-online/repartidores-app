import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF33BECA);
const kPrimaryLightColor = Color(0xFFFFFFFF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFECDF), Color(0xFF33BECA)],
);
const kSecondaryColor = Color(0xFF979797);

const kAnimationDuration = Duration(milliseconds: 200);
const kapiUrl = "https://api.izi.ec/repartidores";
var token = "";
