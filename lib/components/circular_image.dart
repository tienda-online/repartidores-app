import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final String url;
  final double height;
  const CircularImage({Key key,this.url,this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: height,
      height: height,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
          fit: BoxFit.fill,
          image: new NetworkImage(
                 this.url)
                 )
    ));
  }
}