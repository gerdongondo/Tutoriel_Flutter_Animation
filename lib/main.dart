import 'package:flutter/material.dart';
import 'package:animator/animator.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:animate_do/animate_do.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Animation Dynamique';
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          title: Text('Animation Flutter'),
          backgroundColor: Colors.black.withOpacity(0.8),
          actions: [IconButton(icon: Icon(Icons.refresh), onPressed: () {})],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black87,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DelayedDisplay(
                  delay: Duration(milliseconds: 500),
                  child: topIcon,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 1000),
                  child: slider,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 1500),
                  child: infoBox,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 2000),
                  child: customButtonPlay,
                ),
                SizedBox(
                  height: 20,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 2000),
                  child: customButtonStop,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LineData extends StatelessWidget {
  final IconData iconName;
  final Color lineColor;
  final String lineTitle;
  final String lineNumber;
  final Duration animationDuration;
  const LineData(
      {Key? key,
      required this.iconName,
      required this.lineColor,
      required this.lineTitle,
      required this.lineNumber,
      required this.animationDuration})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      duration: animationDuration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: lineColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 15,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(iconName, color: Colors.white, size: 35),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lineNumber,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                lineTitle,
                style: TextStyle(color: lineColor, fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IconLogo extends StatelessWidget {
  final IconData iconName;
  final Color iconColor;
  final Duration animationDuration;
  const IconLogo(
      {Key? key,
      required this.iconName,
      required this.iconColor,
      required this.animationDuration})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Animator<double>(
      tween: Tween<double>(begin: 0, end: 50),
      cycles: 1,
      duration: animationDuration,
      builder: (context, animatorState, child) => Center(
        child: Container(
          width: animatorState.value,
          height: animatorState.value,
          decoration: BoxDecoration(
            color: iconColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 15,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(
            iconName,
            color: Colors.white,
            size: animatorState.value / 2,
          ),
        ),
      ),
    );
  }
}

Widget topIcon = Container(
  height: 130,
  padding: const EdgeInsets.all(30),
  margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconLogo(
        iconName: Icons.directions_walk,
        iconColor: Colors.tealAccent.shade700,
        animationDuration: const Duration(milliseconds: 500),
      ),
      const IconLogo(
        iconName: Icons.directions_run,
        iconColor: Colors.lightBlue,
        animationDuration: Duration(milliseconds: 600),
      ),
      const IconLogo(
        iconName: Icons.directions_bike,
        iconColor: Colors.purple,
        animationDuration: Duration(milliseconds: 700),
      ),
      const IconLogo(
        iconName: Icons.favorite,
        iconColor: Colors.pink,
        animationDuration: Duration(milliseconds: 800),
      ),
      IconLogo(
        iconName: Icons.more_vert,
        iconColor: Colors.grey.shade800,
        animationDuration: const Duration(milliseconds: 900),
      ),
    ],
  ),
);

Widget slider = SleekCircularSlider(
  appearance: CircularSliderAppearance(
    size: 250,
    customWidths: CustomSliderWidths(progressBarWidth: 25),
    infoProperties: InfoProperties(
      mainLabelStyle: const TextStyle(
        fontSize: 50,
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
      bottomLabelText: 'Complété',
      bottomLabelStyle: const TextStyle(
        fontSize: 25,
        color: Colors.white70,
        fontWeight: FontWeight.w300,
      ),
    ),
  ),
  min: 0,
  max: 100,
  initialValue: 79,
);

Widget infoBox = Container(
  margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
  width: 250,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      LineData(
        iconName: Icons.directions_walk,
        lineColor: Colors.purple,
        lineTitle: 'Pas',
        lineNumber: '12967',
        animationDuration: Duration(milliseconds: 500),
      ),
      SizedBox(
        height: 30,
      ),
      LineData(
        iconName: Icons.fastfood,
        lineColor: Colors.orange,
        lineTitle: 'Calories',
        lineNumber: '967',
        animationDuration: Duration(milliseconds: 700),
      ),
      SizedBox(
        height: 30,
      ),
      LineData(
        iconName: Icons.directions_bike,
        lineColor: Colors.brown,
        lineTitle: 'Vitesse',
        lineNumber: '14.3',
        animationDuration: Duration(milliseconds: 900),
      ),
      SizedBox(
        height: 30,
      ),
      LineData(
        iconName: Icons.watch,
        lineColor: Colors.blue,
        lineTitle: 'Durée',
        lineNumber: '00:31:06',
        animationDuration: Duration(milliseconds: 900),
      ),
    ],
  ),
);

Widget customButtonPlay = ElevatedButton(
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  ),
  onPressed: () {},
  child: Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
        gradient: LinearGradient(
            colors: <Color>[Colors.pink, Colors.purple, Colors.blue])),
    padding: const EdgeInsets.fromLTRB(60, 15, 60, 15),
    child: const Text(
      'Jouer',
      style: TextStyle(fontSize: 20),
    ),
  ),
);

Widget customButtonStop = ElevatedButton(
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  ),
  onPressed: () {},
  child: Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
        gradient: LinearGradient(colors: <Color>[
          Colors.pink,
          Colors.purple,
          Colors.blue,
          Colors.brown,
          Colors.amber
        ])),
    padding: const EdgeInsets.fromLTRB(60, 15, 60, 15),
    child: const Text(
      'Arreter',
      style: TextStyle(fontSize: 20),
    ),
  ),
);
