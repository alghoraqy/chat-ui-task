import 'package:chat_ui/core/Theme/light.dart';
import 'package:chat_ui/presentation/layout/home_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chat app',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child!);
      },
      home:const HomeLayout(),
    );
  }
}
