import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Recent extends StatelessWidget {
  const Recent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/images/waiting.json'),
      ),
    );
  }
}