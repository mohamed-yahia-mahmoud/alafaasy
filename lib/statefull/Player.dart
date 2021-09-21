import 'dart:async';
import 'dart:ui';

import 'package:alafaasy/mobx/QuranMobx.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';



class PlayerPage extends StatefulWidget {

  final bool newone;

  const PlayerPage({Key key, this.newone}) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}


 

class _PlayerPageState extends State<PlayerPage> with TickerProviderStateMixin {

  QuranMobx con;
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  AnimationController _animationIconController1;



  void initState() {
    super.initState();
    _animationIconController1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
      reverseDuration: Duration(milliseconds: 750),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      initConnectivity();
      _connectivitySubscription =
          _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

      if(widget.newone){
        con.my_position = con.my_slider;

        con.audioPlayer = new AudioPlayer();
        con.audioCache = new AudioCache(fixedPlayer: con.audioPlayer);
        con.audioPlayer.durationHandler = (d) {
          if(mounted){
            setState(() {
              con.my_duration = d;
            });
          }
        } ;

        con.audioPlayer.positionHandler = (p) {
          if(mounted){
            setState(() {
              con.my_position = p;
            });
          }
        };
      }else{

        con.audioPlayer.durationHandler = (d) {
          if(mounted){
            setState(() {
              con.my_duration = d;
            });
          }
        } ;

        con.audioPlayer.positionHandler = (p) {
          if(mounted){
            setState(() {
              con.my_position = p;
            });
          }
        };
        _animationIconController1.forward();
      }
    });
  }


  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Container(height: 25,child: Center(child: Text(value,style: TextStyle(fontSize: 18,color: Colors.white),)))));

  }

  Future<void> initConnectivity() async {

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      con.result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(con.result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        _connectionStatus="connected";

        break;
      case ConnectivityResult.mobile:
        _connectionStatus="connected";

        break;
      case ConnectivityResult.none:

        try {
          showInSnackBar("لا يوجد اتصال بالانترنت 🙁");
          setState(() => _connectionStatus = result.toString());
        } on PlatformException catch (e) {
          print(e.toString());
        }

        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {

    con = Provider.of<QuranMobx>(context);



    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.green,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("القرآن الكريم للشيخ مشارى بن راشد العفاسى",style: TextStyle(color: Colors.white,fontSize: 15),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (mounted) {
              Navigator.pop(context);
            }

          }
        ),
        actions: [
          /*   Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.exit_to_app),
          ),*/
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100.withOpacity(0.55),
          image: DecorationImage(
            image: AssetImage("assets/img.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              width: (MediaQuery.of(context).size.width),
              height: (MediaQuery.of(context).size.height),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: 5,),
                    ClipOval(
                      child: Image(
                        image: AssetImage("assets/affasy.jpg"),
                        width: (MediaQuery.of(context).size.width) - 200,
                        height: (MediaQuery.of(context).size.width) - 200,
                        fit: BoxFit.fill,
                      ),
                    ),

                    Column(
                      children: [
                        Slider(
                          activeColor: Colors.green[300],
                          inactiveColor: Colors.white,
                          value: con.my_position.inSeconds.toDouble(),
                          max: con.my_duration.inSeconds.toDouble() ,
                          onChanged: (double v) {
                            if (this.mounted) {
                              setState(() {
                                con.seekToSecond(v.toInt());
                              });
                            }

                          },
                        ),
                        SizedBox(height: 0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right:20.0),
                                child: Container(
                                  child: Text(
                                    con.suarsNames[con.currentIndex],style: TextStyle(color: Colors.white,fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left:20.0),
                                child: Container(
                                  child: Text(
                                    "${con.getCurrentPositionTime(con.my_position)}",style: TextStyle(color: Colors.white,fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                     SizedBox(height: 20,),


                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                // the previous sura
                                InkWell(
                                  onTap: () {
                                    if(mounted) {

                                      if(_connectionStatus!=null&&_connectionStatus=="connected"){
                                        setState(() {
                                          con.isSuraPlaying = true;
                                          _animationIconController1.forward();
                                          con.currentIndex = con.currentIndex - 1;
                                          con.audioPlayer.play(
                                              "${con.url}${con.surasId[con
                                                  .currentIndex]}.mp3");
                                        });
                                      }
                                      else{
                                        showInSnackBar("لا يوجد اتصال بالانترنت 🙁");
                                      }
                                    }
                                    },
                                  child: Icon(
                                    Icons.fast_forward,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ),



                                //backward 10 seconds
                                InkWell(
                                  onTap: () {

                                    if(_connectionStatus!=null&&_connectionStatus=="connected"){
                                      con.audioPlayer.seek(
                                        Duration(
                                          milliseconds: con.my_position.inMilliseconds - 10000,
                                        ),
                                      );
                                    }
                                    else{
                                      showInSnackBar("لا يوجد اتصال بالانترنت 🙁");
                                    }

                                  },
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(math.pi),
                                    child: Icon(Icons.replay, size: 35, color: Colors.white,),
                                  ),
                                ),

                                //play pause button
                                GestureDetector(
                                  onTap: () {
                                    if(mounted){

                                      if(_connectionStatus!=null&&_connectionStatus=="connected"){
                                        setState(() {
                                          if (!con.isSuraPlaying) {
                                            print('my url :  ${con.url}${con.surasId[con.currentIndex]}.mp3');
                                            con.audioPlayer.play("${con.url}${con.surasId[con.currentIndex]}.mp3");
                                            _animationIconController1.forward();

                                            con.audioPlayer.onPlayerCompletion.listen((event) {

                                              setState(() {
                                                _animationIconController1.reverse();
                                                if(con.currentIndex<113){
                                                  con.isSuraPlaying=true;
                                                  _animationIconController1.forward();
                                                  con.currentIndex=con.currentIndex+1;
                                                  con.audioPlayer.play("${con.url}${con.surasId[con.currentIndex]}.mp3");

                                                }
                                              });


                                            });

                                          } else {
                                            con.audioPlayer.pause();
                                            _animationIconController1.reverse();
                                          }
                                          con.isSuraPlaying = !con.isSuraPlaying;
                                        },
                                        );
                                      }else{
                                        showInSnackBar("لا يوجد اتصال بالانترنت 🙁");
                                      }

                                    }
                                  },
                                  child: ClipOval(
                                    child: Container(
                                      color: Colors.green[400],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child:  AnimatedIcon(
                                          icon: AnimatedIcons.play_pause,
                                          size: 35,
                                          progress: _animationIconController1,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //forward 10 seconds
                                InkWell(
                                  onTap: () {
                                    if(_connectionStatus!=null&&_connectionStatus=="connected"){
                                      con.audioPlayer.seek(
                                        Duration(
                                          milliseconds: con.my_position.inMilliseconds + 10000,
                                        ),
                                      );
                                    }
                                    else{
                                      showInSnackBar("لا يوجد اتصال بالانترنت 🙁");
                                    }
                                  },
                                  child: Icon(
                                    Icons.replay,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ),
                                //next sura
                                InkWell(
                                  onTap: () {
                                    if(mounted){
                                      if(_connectionStatus!=null&&_connectionStatus=="connected"){
                                        setState(() {
                                          con.isSuraPlaying=true;
                                          _animationIconController1.forward();
                                          con.currentIndex=con.currentIndex+1;
                                          con.audioPlayer.play("${con.url}${con.surasId[con.currentIndex]}.mp3");
                                        });
                                      }
                                      else{
                                        showInSnackBar("لا يوجد اتصال بالانترنت 🙁");
                                      }
                                    }


                                    },
                                  child: Icon(
                                    Icons.fast_rewind,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 25,),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}