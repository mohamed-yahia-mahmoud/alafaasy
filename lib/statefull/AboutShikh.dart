import 'package:flutter/material.dart';

class AboutShikh extends StatefulWidget {

 final String about;
 final String bio;

  AboutShikh( {this.about,this.bio});

 @override
 _AboutShikhState createState() => _AboutShikhState();
}

class _AboutShikhState extends State<AboutShikh> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  final formKey = new GlobalKey<FormState>();


  bool savedLocal=false;


  @override
  void initState() {
    // TODO: implement initState

    super.initState();

  }

  @override
  void dispose() {
     super.dispose();
  }




  @override
  Widget build(BuildContext context) {


    Future.delayed(const Duration(milliseconds: 60), () {
      if(mounted){
        setState(() {
          // Here you can write your code for open new view
        });
      }
    });




        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: Scaffold(
            key: _drawerKey,
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

            body:   Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,

                      child: Column(
                         children: <Widget>[

                           Padding(
                            padding: const EdgeInsets.only(top: 20.0, bottom: 8),
                            child: Container(
                              width: MediaQuery.of(context).size.width * .88,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                   Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: Text(
                                            'نبذة عن الشيخ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        child: RichText(
                                          text: TextSpan(

                                              children: [
                                                TextSpan( text: 'هو مشاري بن راشد بن غريب بن محمد بن راشد العفاسي، من مواليد دولة الكويت ليوم الأحد 11 رمضان 1396 هـ الموافق 5 سبتمبر 1976م، هو قاريء للقراّن الكريم و منشد، يتمتع بصوت عذب وروعة الأداء، له العديد من الإصدارات التي انتشرت في الوطن العربي والإسلامي والعالم. تخصص القراءات العشر والتفسير. ولقد تتلمذ الشيخ على أيدي كبار علماء ومقرئي علماء المدينة النبوية في كلية القراءات، وقد أجيز القارئ في قراءة عاصم بروايتيه حفص وشعبة من طريق الشاطبية وسافر القارئ مشاري إلى مصر للحصول على إجازات من كبار مقرئي العالم الإسلامي الذين كان لهم باعاً في القرآن وعلومه.',
                                                  style: TextStyle(
                                                      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),


                                              ]),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  }),
            ),
          ),
        );




  }
}


//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: <Widget>[
//
//        SizedBox(
//          height: 50,
//        ),
//
//        Center(
//          child: Wrap(
//            children: <Widget>[
//              Text(
//                about,
//                textAlign: TextAlign.center,
//                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24, color: Colors.black87),
//              ),
//            ],
//          ),
//        ),
//
//
//        Center(
//          child: Wrap(
//            children: <Widget>[
//              Text(
//                bio,
//                textAlign: TextAlign.center,
//                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Color(0xffFF2650)),
//              ),
//            ],
//          ),
//        ),
//      ],
//    );
//  }
//}
