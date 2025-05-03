import 'package:bookly_app/features/Splash/presentation/Views/Widget/sliding_logo.dart';
import 'package:bookly_app/features/Splash/presentation/Views/Widget/sliding_text.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimatino;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    navigatorToHomeScreen();
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
        SlidingLogo(slidingAnimatino: slidingAnimatino),
        SlidingText(slidingAnimatino: slidingAnimatino),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    slidingAnimatino = Tween<Offset>(
      begin: Offset(0, 5),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void navigatorToHomeScreen() {
    Future.delayed(Duration(seconds: 2), () {
      Get.to(
        HomeView(),
        transition: Transition.fade,
        duration: Duration(milliseconds: 250),
      );
    });
  }
}
