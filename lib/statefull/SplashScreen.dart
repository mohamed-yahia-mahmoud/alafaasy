import 'dart:core';
import 'dart:async';
import 'package:alafaasy/statefull/Home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final int seconds;
  final Text title;
  final Color backgroundColor;
  final TextStyle styleTextUnderTheLoader;
  final dynamic navigateAfterSeconds;
  final double photoSize;
  final dynamic onClick;
  final Color loaderColor;
  final Image image;
  final Text loadingText;
  final ImageProvider imageBackground;
  final Gradient gradientBackground;
  SplashScreen(
      {
        this.loaderColor,
        @required this.seconds,
        this.photoSize,
        this.onClick,
        this.navigateAfterSeconds,
        this.title = const Text(''),
        this.backgroundColor = Colors.white,
        this.styleTextUnderTheLoader = const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
        this.image,
        this.loadingText  = const Text(""),
        this.imageBackground,
        this.gradientBackground
      }
      );


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: widget.seconds),
            () {
          if (widget.navigateAfterSeconds is String) {

            Navigator.of(context).pushReplacementNamed(widget.navigateAfterSeconds);
          } else if (widget.navigateAfterSeconds is Widget) {
            Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => widget.navigateAfterSeconds));
          }
          else {

            Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => Home()));

            throw new ArgumentError(
                'widget.navigateAfterSeconds must either be a String or Widget' + widget.navigateAfterSeconds.toString()
            );
          }
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new InkWell(
        onTap: widget.onClick,
        child:new Stack(
          //fit: StackFit.expand,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: widget.imageBackground == null
                    ? null
                    : new DecorationImage(
                  fit: BoxFit.cover,
                  image: widget.imageBackground,
                ),
                gradient: widget.gradientBackground,
                color: widget.backgroundColor,
              ),
            ),
            new Container(

                child: Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width:    200,
                        height:    200,
                        child: new CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: new Container(
                            decoration: new BoxDecoration(
                              color: const Color(0xff7c94b6),
                              borderRadius: new BorderRadius.all(new Radius.circular(90.0)),
                              border: new Border.all(
                                color: Colors.white,
                                width: 4.0,
                              ),
                            ),

                              child:  ClipOval(
                                child: Image(
                                  image: AssetImage("assets/affasy.jpg"),
                                  width:  (MediaQuery.of(context).size.width) -  200,
                                  height:  (MediaQuery.of(context).size.width) -  200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                          ),
                          radius: widget.photoSize,
                        ),
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height*.02,),

                    //  widget.loadingText,


                      Center(child: widget.title),
                      Center(child: widget.loadingText),
                      SizedBox(height: MediaQuery.of(context).size.height*.22,),


                    //  widget.loadingText
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
