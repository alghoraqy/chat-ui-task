import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset('assets/images/waiting.json'),
      );
  }
}