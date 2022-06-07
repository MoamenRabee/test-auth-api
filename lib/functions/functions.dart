
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateTo(BuildContext context,Widget page){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
}

void navigateOff(BuildContext context,Widget page){
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => page), (Route<dynamic> route) => false);
}

void showMessage({required String message,required Color color}) async {
  await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0
  );
}