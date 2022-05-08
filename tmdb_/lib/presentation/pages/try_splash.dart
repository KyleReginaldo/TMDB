import 'package:damovie/core/design/colors.dart';
import 'package:damovie/presentation/widgets/home/custom_oswald_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomOswaldText(
        text: 'Welcome',
        color: WHITE,
      ),
    );
  }
}
