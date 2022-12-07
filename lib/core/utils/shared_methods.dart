import 'package:flutter/material.dart';

Future navigateTo(context, Widget screen) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => screen));
}

Future navigateAndFinish(context, Widget screen) {
  return Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => screen), (route) => false);
}


