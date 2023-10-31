import 'package:bookly_app/core/utils/asstes_variables.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
   const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsVariables.bookingLogo),
      ],
    );
  }
}