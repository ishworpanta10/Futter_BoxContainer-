import 'package:flutter/material.dart';

class CurvedAnimationPage extends StatefulWidget {
  @override
  _CurvedAnimationPageState createState() => _CurvedAnimationPageState();
}

class _CurvedAnimationPageState extends State<CurvedAnimationPage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);

    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = Tween(begin: 0.0, end: 600.0).animate(curve);

    controller.forward();
  }

  Widget builder(BuildContext context, Widget child) {
    return Container(
      height: animation.value,
      width: animation.value,
      child: FlutterLogo(size: 400,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 200, left: 100, right: 100),
        child: Center(
          child: AnimatedBuilder(animation: animation, builder: builder),
        ),
      ),
    );
  }
}
