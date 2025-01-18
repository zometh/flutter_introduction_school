import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction/common/size_config.dart';
import 'package:introduction/routes/routes.dart';
import 'package:introduction/views/home.dart';

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
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _rotationAnimation = CurvedAnimation(
        parent: _animationController, curve: Curves.linearToEaseOut);
    _startAnimation();
  }

  void _startAnimation() {
    _animationController.forward();
    _animationController.addStatusListener((status) {
      print(status.toString());
      if (status == AnimationStatus.completed) {
        // _animationController.reset();
        //_animationController.repeat();
        Navigator.pushReplacementNamed(context, NavigationRoutes.home);
        
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
              ? SizeConfig.getProportionateScreenWidth(200)
              : SizeConfig.getProportionateScreenWidth(60),
          child: AnimatedBuilder(
              animation: _rotationAnimation,
              builder: (context, child) {
                return Transform.rotate(
                  //alignment: Alignment.bottomLeft,
                  //origin: Offset(0, -1),
                  angle: _rotationAnimation.value * 2 * pi,
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

  nav() async {
    await Future.delayed(const Duration(seconds: 3)).then((onValue) {
      Navigator.pop(context);
    });
  }
}
