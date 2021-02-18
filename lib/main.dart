import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:spring_button/spring_button.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';

void main() => runApp(MillionApp());

class MillionApp extends StatefulWidget {
  @override
  _MillionAppState createState() => _MillionAppState();
}

class _MillionAppState extends State<MillionApp> {
  int _score = 0;
  double _percentage = 0;
  String _number;
  double bar1;
  double bar2;
  double bar3;
  double bar4;
  double bar5;
  double bar6;
  double bar7;
  double bar8;
  double bar9;
  double bar10;
  Timer timer;
  final _nativeAdController = NativeAdmobController();


  @override
  void initState() {
    super.initState();
    _loadScore();
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-7785242093995268~8111724851');
  }

  _loadScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _score = (prefs.getInt('score') ?? 0);
    });
  }

  _incrementScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _score = (prefs.getInt('score') ?? 0) + 1;
      prefs.setInt('score', _score);
      _percentage = (_score / 1000000) * 100;
      _number = _percentage.toStringAsFixed(1);
      bar1 = _score / 1000000;
      bar2 = (_score - 100000) / 1000000;
      bar3 = (_score - 200000) / 1000000;
      bar4 = (_score - 300000) / 1000000;
      bar5 = (_score - 400000) / 1000000;
      bar6 = (_score - 500000) / 1000000;
      bar7 = (_score - 600000) / 1000000;
      bar8 = (_score - 700000) / 1000000;
      bar9 = (_score - 800000) / 1000000;
      bar10 = (_score - 900000) / 1000000;
    });
  }

  Expanded _buildBar({Color color, double value}) {
    return Expanded(
      child: RotatedBox(
        quarterTurns: 3,
        child: LiquidLinearProgressIndicator(
          backgroundColor: Colors.white,
          value: value,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
    );
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.greenAccent, Colors.lightBlueAccent],
  ).createShader(Rect.fromLTWH(0, 0, 200, 70));

  @override
  Widget build(BuildContext context) {
    // Timer(Duration(seconds: 5), () {
    //   _bannerAd?.show();
    // });
    return MaterialApp(
      theme: ThemeData(fontFamily: 'OClock'),
      home: Scaffold(
        backgroundColor: Color(0xff363636),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      _buildBar(color: Colors.black, value: bar10),
                      _buildBar(color: Colors.brown, value: bar9),
                      _buildBar(color: Colors.grey, value: bar8),
                      _buildBar(color: Colors.pink[200], value: bar7),
                      _buildBar(color: Colors.purple, value: bar6),
                      _buildBar(color: Colors.blue, value: bar5),
                      _buildBar(color: Colors.green, value: bar4),
                      _buildBar(color: Colors.yellow, value: bar3),
                      _buildBar(color: Colors.orange, value: bar2),
                      _buildBar(color: Colors.red, value: bar1),
                      Expanded(
                        child: NativeAdmob(
                          adUnitID: NativeAd.testAdUnitId,
                          controller: _nativeAdController,
                          type: NativeAdmobType.full,
                          loading: Center(child: CircularProgressIndicator()),
                          error: Text('failed to load'),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        ' 1000000',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      Text(
                        '900000',
                        style: TextStyle(color: Colors.brown, fontSize: 12),
                      ),
                      Text(
                        '800000',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        '700000',
                        style: TextStyle(color: Colors.pink[200], fontSize: 12),
                      ),
                      Text(
                        '600000',
                        style: TextStyle(color: Colors.purple, fontSize: 12),
                      ),
                      Text(
                        '500000',
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      ),
                      Text(
                        '400000',
                        style: TextStyle(color: Colors.green, fontSize: 12),
                      ),
                      Text(
                        '300000',
                        style: TextStyle(color: Colors.yellow, fontSize: 12),
                      ),
                      Text(
                        '200000',
                        style: TextStyle(color: Colors.orange, fontSize: 12),
                      ),
                      Text(
                        '100000',
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                      Text(
                        'lmao :)',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '$_score',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 60,
                        ),
                      ),
                      Text(
                        '$_number%',
                        style: TextStyle(
                          fontFamily: 'OClock',
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  SpringButton(
                    SpringButtonType.OnlyScale,
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 25, 50, 0),
                      child: Container(
                        padding: EdgeInsets.all(50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.pinkAccent,
                                Colors.deepPurpleAccent
                              ]),
                        ),
                        child: Center(
                          child: GradientText(
                            'push me\n1000000\ntimes',
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.greenAccent,
                                  Colors.lightBlueAccent
                                ]),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    scaleCoefficient: 0.75,
                    onTapDown: (_) {
                      _incrementScore();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}