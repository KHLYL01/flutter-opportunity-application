import 'package:flutter/material.dart';
import 'package:opportunity_app/core/constants/app_images.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Image.asset(AppImages.splash).center(),
    );
  }
}
