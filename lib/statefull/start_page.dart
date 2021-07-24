
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home.dart';
import 'SplashScreen.dart';


class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool isPortrait;
  Widget newWidget;
  SharedPreferences prefs;
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
       doit();
    });
  }

  void doit()async{
    prefs = await SharedPreferences.getInstance();
    try {
      newWidget =  Home();
    }catch(Exception)
    {
    newWidget =Home();
    }

  }

  @override
  Widget build(BuildContext context) {
    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;



    print(MediaQuery.of(context).size.aspectRatio*400);
    return Scaffold(
      body: new SplashScreen(
          seconds: 6,
          navigateAfterSeconds: newWidget,
          //images/splash-pro.png
          image: new Image.asset('assets/affasy.jpg',fit: BoxFit.fill,),
          backgroundColor: Colors.green,
          title: Text("القرآن الكريم للشيخ مشارى بن راشد العفاسى",style: TextStyle(color: Colors.white,fontSize: 21),),
          loadingText: Text("برواية حفص عن عاصم",style: TextStyle(color: Colors.white,fontSize: 18),),
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: isPortrait?MediaQuery.of(context).size.aspectRatio*500:MediaQuery.of(context).size.aspectRatio*90,
         // loaderColor: Colors.red
      ),
    );
  }
}
