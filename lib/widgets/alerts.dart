
import 'package:flutter/material.dart';
showAlertDialog(BuildContext context,String message){
  AlertDialog alert=AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(),
        Container(margin: EdgeInsets.only(left: 10),child:Text("Please Wait\n"+message )),
      ],),
  );
  showDialog(barrierDismissible: true,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}