import 'package:flutter/material.dart';

class ShowMessage{
  static void showErrorDialog(BuildContext context,String title,String body) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          
          title: new Text(title,textAlign: TextAlign.center,),
          content: new Text(body),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            Center(
              child: FlatButton(

                child: new Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}