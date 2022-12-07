import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset('assets/images/waiting.json'),
      );
  }
}