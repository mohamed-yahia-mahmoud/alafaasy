import 'package:flutter/material.dart';

class AlertLogOut extends StatelessWidget {

  final VoidCallback onYesPressed;
  final VoidCallback onNoPressed;

  AlertLogOut({
    this.onYesPressed,
    this.onNoPressed

  });



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        SizedBox(
          height: 50,
        ),

        Align(
          alignment: AlignmentDirectional.topStart,
          child: Container(
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
              )),
        ),
        Center(
          child: Wrap(
            children: <Widget>[
              AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.white)),
                content: Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "هل تريد مغادرة التطبيق ؟",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Color(0xffFF2650)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
//                      Text(
//                        "مغادرة التطبيق",
//                        textAlign: TextAlign.center,
//                        style: TextStyle(fontSize: 14, color: Colors.black),
//                      ),
//                      SizedBox(
//                        height: 10,
//                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                              color: Colors.green[400],
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.green[400])),
                              onPressed: onNoPressed,
                              child: Container(
                                alignment: AlignmentDirectional.center,
                                height: 45,
                                child: Text(
                                 "لا اريد",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14, color: Colors.white),
                                ),
                              )),
                          FlatButton(
                              color: Colors.redAccent,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.redAccent)),
                              onPressed: onYesPressed,
                              child: Container(
                                alignment: AlignmentDirectional.center,
                                height: 45,
                                child: Text(
                                  "نعم",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14, color: Colors.white),
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
