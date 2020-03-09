import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);

    animation = Tween(begin: 0.0, end: 400.0).animate(controller);
    animation.addListener(() {
      //the sate of the animation changed
      setState(() {});
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tween Animation"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(size: 200,)
      ),
    );
  }
}
