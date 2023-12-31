import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/asstes_variables.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideTextAnimate;

  @override
  void initState() {
    super.initState();

    //init Sliding Animation
    initSlidingAnimation();
    //to navigate to home screen after duration with animation
    navigateToHomeView();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsVariables.bookingLogo),
        // AnimatedBuilder to refresh widget
        AnimatedBuilder(
            animation: slideTextAnimate,
            builder: (context, _) {
              return SlideTransition(
                position: slideTextAnimate,
                child: const Text(
                  'Read Free Books',
                  textAlign: TextAlign.center,
                ),
              );
            }),
      ],
    );
  }

//Method to navigate to home screen after duration with animation
  void navigateToHomeView() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }

//Method to init Sliding Animation
  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    slideTextAnimate =
        Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
