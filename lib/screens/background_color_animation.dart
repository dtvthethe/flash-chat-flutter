import 'package:flutter/material.dart';

class BackgroundColorAnimation extends StatefulWidget {
  static const String id = 'background-color_animation';

  @override
  State<StatefulWidget> createState() => _BackgroundColorAnimation();
}

class _BackgroundColorAnimation extends State<BackgroundColorAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _colorTween;
  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _animationController.forward();
    _colorTween =
        ColorTween(begin: Colors.yellowAccent, end: Colors.orangeAccent)
            .animate(_animationController);
    _animationController.addListener(() {
      // print(_animationController.value);
      setState(() {}); // Empty! so this code can update value
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Background color Change'),
        ),
        body: Container(
          color: _colorTween.value,
          child: Text(_animationController.value.toString()),
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
