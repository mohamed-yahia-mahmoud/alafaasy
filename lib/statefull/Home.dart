import 'dart:io';
import 'dart:ui';
import 'package:alafaasy/mobx/QuranMobx.dart';
import 'package:alafaasy/statefull/AboutShikh.dart';
import 'package:alafaasy/statefull/Player.dart';
import 'package:alafaasy/statless/AlertLogOut.dart';
import 'package:alafaasy/statless/settingListItem.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';


const String testDevice ='3ADF6D1F2FF900409FCD7AFFF73CF972';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  QuranMobx con;



  //---------------------------------- ad initialization -------------------------------------


  static const MobileAdTargetingInfo targetingInfo=MobileAdTargetingInfo(
      keywords: <String>['quran', 'alafasy'],
      contentUrl: 'https://flutter.io',
      childDirected: false,
      testDevices: <String>[testDevice]
  );


  BannerAd _bannerAd;

  final String IOS_AD_UNIT_BANNER="";

  final String ANDROID_AD_UNIT_BANNER="ca-app-pub-8165719959159108/7154726200";

  final String IOS_APP_ID="";

  final String ANDROID_APP_ID="ca-app-pub-8165719959159108~7737411643";


  int myIndex=0;


  String getAppId() {

    print ("get app id ");
    print(Platform.isIOS);
    print(Platform.isAndroid);
    if (Platform.isIOS) {
      return IOS_APP_ID;
    } else if (Platform.isAndroid) {
      return ANDROID_APP_ID;
    }
    return null;
  }

  BannerAd createBannerAd(){
    return BannerAd(
        adUnitId:  getBannerAdUnitId() ,
        size: AdSize.fullBanner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            _bannerAd.show(anchorOffset: -10.0, anchorType: AnchorType.bottom,  horizontalCenterOffset: 0.0,);

          }
        }
    );
  }

  String getBannerAdUnitId() {
    print("*******************");
    print("getBannerAdUnitId");
    print(Platform.isAndroid);

    if (Platform.isAndroid) {
      return ANDROID_AD_UNIT_BANNER;
    } else {
      return IOS_AD_UNIT_BANNER;

    }

  }

//------------------------------------------------------------------------------------------------





  @override
  void initState() {

    FirebaseAdMob.instance.initialize(appId: getAppId());
    _bannerAd=createBannerAd()..load()..show(
      anchorOffset: 0.0,
      anchorType: AnchorType.bottom,
      horizontalCenterOffset: 0.0,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      con.getMySuraId();
    });
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }



  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertLogOut(onNoPressed: (){
        Navigator.of(context).pop(false);
      },onYesPressed: (){
        if(con.audioPlayer!=null&&con.isSuraPlaying!=null&&con.isSuraPlaying){
          con.isSuraPlaying=false;
          con.audioPlayer.stop();
          con.audioPlayer.dispose();
        }
        Navigator.of(context).pop(true);
      },)
    )) ?? false;
  }


  @override
  Widget build(BuildContext context) {
  con=Provider.of<QuranMobx>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _drawerKey, // assign key to Scaffold

        drawer:   Drawer(
          child: ListView(
            children: [

              Container(
                height: MediaQuery.of(context).size.height*.288,
                color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 15),
                    Container(

                      width:    120,
                      height:    120,
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

                      ),
                    ),

                    SizedBox(height: 5),

                    Center(child: Text("الشيخ مشارى بن راشد العفاسى",style: TextStyle(color: Colors.white,fontSize: 22),),),

                    //  widget.loadingText
                  ],
                ),
              ),


              ListTile(
                title: Center(child: Text("قيم التطبيق",style: TextStyle(color: Colors.green,fontSize: 18),)),
                onTap: (){},
              ),

              //         ====================== Divider =======================
              Padding(
                padding:  EdgeInsets.only(top:0.0,left: 5,right: 5,bottom: 0),
                child: Container(
                  margin: EdgeInsetsDirectional.only(start: 10, top: 6),
                  child: Divider(
                    height: 1,
                    thickness: 1.3,
                  ),
                ),
              ),

              ListTile(
                title: Center(child: Text("تطبيقات أخرى",style: TextStyle(color: Colors.green,fontSize: 18,),)),
                onTap: (){
                  Toast.show("حاليا لا توجد تطبيقات اخري ولكن سيتم اضافتها قريبا", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);

                },
              ),

              //         ====================== Divider =======================
              Padding(
                padding:  EdgeInsets.only(top:0.0,left: 5,right: 5,bottom: 0),
                child: Container(
                  margin: EdgeInsetsDirectional.only(start: 10, top: 6),
                  child: Divider(
                    height: 1,
                    thickness: 1.3,
                  ),
                ),
              ),

              ListTile(
                title: Center(child: Text("نبذة عن الشيخ",style: TextStyle(color: Colors.green,fontSize: 18),)),
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>
                      AboutShikh(about: "نبذة عن الشيخ",bio: "هو مشاري بن راشد بن غريب بن محمد بن راشد العفاسي، من مواليد دولة الكويت ليوم الأحد 11 رمضان 1396 هـ الموافق 5 سبتمبر 1976م، هو قاريء للقراّن الكريم و منشد، يتمتع بصوت عذب وروعة الأداء، له العديد من الإصدارات التي انتشرت في الوطن العربي والإسلامي والعالم. تخصص القراءات العشر والتفسير. ولقد تتلمذ الشيخ على أيدي كبار علماء ومقرئي علماء المدينة النبوية في كلية القراءات، وقد أجيز القارئ في قراءة عاصم بروايتيه حفص وشعبة من طريق الشاطبية وسافر القارئ مشاري إلى مصر للحصول على إجازات من كبار مقرئي العالم الإسلامي الذين كان لهم باعاً في القرآن وعلومه.",),
                  ));
                },
              ),

              //         ====================== Divider =======================
              Padding(
                padding:  EdgeInsets.only(top:0.0,left: 5,right: 5,bottom: 0),
                child: Container(
                  margin: EdgeInsetsDirectional.only(start: 10, top: 6),
                  child: Divider(
                    height: 1,
                    thickness: 1.3,
                  ),
                ),
              ),




            ],
          ),
        ),
        appBar: AppBar(
          shadowColor: Colors.green,
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text("القرآن الكريم للشيخ مشارى بن راشد العفاسى",style: TextStyle(color: Colors.white,fontSize: 15),),

          actions: [

          ],
        ),

        body: Observer(
          builder: (_) {
            return Container(
              child: Container(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    width: (MediaQuery.of(context).size.width),
                    height: (MediaQuery.of(context).size.height*.78),
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: con.suarsNames.length ,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
                            child: InkWell(
                              onTap: (){
                                if(mounted){
                                  setState(() {
                                    print("my suras${con.surasId}");

                                    if(con.audioPlayer!=null&&con.isSuraPlaying!=null&&con.isSuraPlaying&& con.currentIndex==index){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayerPage(newone: false,)));
                                      print('first called');
                                    }else if(con.audioPlayer!=null&&con.isSuraPlaying!=null&&con.isSuraPlaying){
                                      con.isSuraPlaying=false;
                                      con.audioPlayer.stop();
                                      con.audioPlayer.dispose();
                                      con.currentIndex=index;
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayerPage(newone: true,)));
                                      print('second called');
                                    }else{
                                      con.currentIndex=index;
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayerPage(newone: true,)));
                                      print('third called');
                                    }

                                  });

                                }



                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                height: 50,
                              //  color: Colors.grey,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [


                                   // index==con.currentIndex
                                    Observer(
                                      builder: (_) {
                                      return
                                             Visibility(
                                              visible: index==con.currentIndex,
                                              child: Padding(
                                                padding: const EdgeInsets.only(right:20.0),
                                                child: Icon(
                                                  Icons.play_arrow,
                                                  size: 25,
                                                  color: Colors.green[800],
                                                ),
                                              ),
                                            );
                                          }
                                    ),
                                    Observer(
                                    builder: (_) {
                                      return Visibility(
                                        visible: index != con.currentIndex,
                                        child: SizedBox(
                                          width: 0,
                                        ),
                                      );
                                    }
                                    ),
                                    Center(child: Text( con.suarsNames[index] ,style: TextStyle(fontSize: 22,color:Colors.green[800],),)),

                                    Observer(
                                        builder: (_) {
                                          return SizedBox(
                                            width: index != con.currentIndex?50:70,
                                          );
                                        }
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                ),
              ),
            );

          },
        ),

      ),
    );
  }
}
