import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/utils/injector.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
// with TickerProviderStateMixin
{
  // late final AnimationController _controller = AnimationController(
  //   duration: const Duration(seconds: 2),
  //   vsync: this,
  // )..repeat(reverse: false);

  // late final Animation<double> _animation = CurvedAnimation(
  //   parent: _controller,
  //   curve: Curves.easeInToLinear,
  // );

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  void initState() {
    initialAction();
    super.initState();
  }

  Future<Timer> initialAction() async {
    return Timer(
      const Duration(seconds: 3),
      () {
        GoRouter.of(context).go(
          '/home',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: injector.palette.primaryColor,
        child: const Center(
          child: SizedBox(
              height: 59,
              width: 230,
              child:
                  FlutterLogo() //Image.asset('assets/images/buysmallsmallwhite.png'),
              ),
        ),
        // child: ScaleTransition(
        //   //scale: _animation,
        //   child: SizedBox(
        //     height: autoAdjustHeight(59),
        //     width: autoAdjustWidth(230),
        //     child: Image.asset('assets/images/buysmallsmallwhite.png'),
        //   ),
        // ),
      ),
    );
  }
}
