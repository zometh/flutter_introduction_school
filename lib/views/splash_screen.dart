import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction/common/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SizedBox(
        width: (SizeConfig.orientation == Orientation.portrait)
            ? SizeConfig.getProportionateScreenWidth(60)
            : SizeConfig.getProportionateScreenHeigth(40),
        child: Image.network(
          "https://th.bing.com/th/id/OIP.tVLLFUWBDhGWMyGb0ke-4wHaFS?rs=1&pid=ImgDetMain"
        ),
      ),
    );
  }
}
