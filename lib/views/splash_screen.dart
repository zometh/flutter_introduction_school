import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction/common/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    _rotationAnimation = CurvedAnimation(
        parent: _animationController, curve: Curves.bounceInOut);
    _startAnimation();
  }

  void _startAnimation() {
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
        _animationController.repeat();
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: (SizeConfig.orientation == Orientation.portrait)
              ? SizeConfig.getProportionateScreenWidth(100)
              : SizeConfig.getProportionateScreenWidth(60),
          child: AnimatedBuilder(
              animation: _rotationAnimation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationAnimation.value,
                  child: Image.asset(
                    "assets/qr_code.png",
                    fit: BoxFit.contain,
                  ),
                );
              }),
        ),
      ),
    );
  }
}
