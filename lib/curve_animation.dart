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
        duration: Duration(milliseconds: 2000), vsync: this);

    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = Tween(begin: 100.0, end: 300.0).animate(curve);

    animation.addStatusListener(listener);

    controller.forward();
  }

  void listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      controller.forward();
    }
  }

  Widget builder(BuildContext context, Widget child) {
    return Container(
      height: animation.value,
      width: animation.value,
      child: FlutterLogo(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AnimatedBuilder(animation: animation, builder: builder),
      ),
    );
  }
}
