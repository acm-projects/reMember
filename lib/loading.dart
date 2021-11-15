import 'package:flutter/material.dart';
import 'dart:math';
import 'home.dart';

class Loading extends StatefulWidget {
  final double radius;
  final double dotRadius;

  Loading({this.radius = 170.0, this.dotRadius = 17.0});

  @override
  _LoadingState createState() => _LoadingState();
}


class _LoadingState extends State<Loading>

    with SingleTickerProviderStateMixin {
  Animation<double> animation_rotation;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;
  AnimationController controller;

  double radius;
  double dotRadius;

  @override
  void initState() {
    super.initState();

    _navigatetohome();

    radius = widget.radius;
    dotRadius = widget.dotRadius;

    print(dotRadius);

    controller = AnimationController(
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: const Duration(milliseconds: 3000),
        vsync: this);

    animation_rotation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    animation_radius_in = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.elasticIn),
      ),
    );

    animation_radius_out = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0)
          radius = widget.radius * animation_radius_in.value;
        else if (controller.value >= 0.0 && controller.value <= 0.25)
          radius = widget.radius * animation_radius_out.value;
      });
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });

    controller.repeat();
  }

  _navigatetohome() async{
    await Future.delayed(Duration(milliseconds: 8000), (){});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Home()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      color: const Color.fromARGB(255, 232, 214, 203),

      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Center(
                child: new RotationTransition(
                  turns: animation_rotation,
                  child: new Container(
                    child: new Center(
                      child: Stack(
                        children: <Widget>[
                          new Transform.translate(
                            offset: Offset(0.0, 0.0),
                            child: Dot(
                              radius: radius,
                              color: Color.fromARGB(255, 34, 34, 59),
                            ),
                          ),
                          new Transform.translate(
                            child: Dot(
                              radius: dotRadius,
                              color: const Color.fromARGB(255, 154, 134, 152),
                            ),
                            offset: Offset(
                              radius * cos(0.0),
                              radius * sin(0.0),
                            ),
                          ),
                          new Transform.translate(
                            child: Dot(
                              radius: dotRadius,
                              color: Color.fromARGB(255, 173, 106, 108),
                            ),
                            offset: Offset(
                              radius * cos(0.0 + 1 * pi / 4),
                              radius * sin(0.0 + 1 * pi / 4),
                            ),
                          ),
                          new Transform.translate(
                            child: Dot(
                              radius: dotRadius,
                              color: Color.fromARGB(255, 93, 46, 70),
                            ),
                            offset: Offset(
                              radius * cos(0.0 + 2 * pi / 4),
                              radius * sin(0.0 + 2 * pi / 4),
                            ),
                          ),
                          new Transform.translate(
                            child: Dot(
                              radius: dotRadius,
                              color: Color.fromARGB(255, 74, 78, 105),
                            ),
                            offset: Offset(
                              radius * cos(0.0 + 3 * pi / 4),
                              radius * sin(0.0 + 3 * pi / 4),
                            ),
                          ),
                          new Transform.translate(
                            child: Dot(
                              radius: dotRadius,
                              color: const Color.fromARGB(255, 154, 134, 152),
                            ),
                            offset: Offset(
                              radius * cos(0.0 + 4 * pi / 4),
                              radius * sin(0.0 + 4 * pi / 4),
                            ),
                          ),
                          new Transform.translate(
                            child: Dot(
                              radius: dotRadius,
                              color: Color.fromARGB(255, 173, 106, 108),
                            ),
                            offset: Offset(
                              radius * cos(0.0 + 5 * pi / 4),
                              radius * sin(0.0 + 5 * pi / 4),
                            ),
                          ),
                          new Transform.translate(
                            child: Dot(
                              radius: dotRadius,
                              color: Color.fromARGB(255, 93, 46, 70),
                            ),
                            offset: Offset(
                              radius * cos(0.0 + 6 * pi / 4),
                              radius * sin(0.0 + 6 * pi / 4),
                            ),
                          ),
                          new Transform.translate(
                            child: Dot(
                              radius: dotRadius,
                              color: Color.fromARGB(255, 74, 78, 105),
                            ),
                            offset: Offset(
                              radius * cos(0.0 + 7 * pi / 4),
                              radius * sin(0.0 + 7 * pi / 4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ),
              Center(
                  child: Image.asset('assets/image.png',
                    width: 150,
                    height: 150,
                  )
              ),

              const SizedBox(
                height: 650.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('Loading reMember...',
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 34, 59),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {

    controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  Dot({this.radius, this.color}); //take out image thing

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}