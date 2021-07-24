
import 'package:flutter/material.dart';

class SettingListItem extends StatelessWidget {

  final String text;
  final Widget icon;
  final VoidCallback onPressed;
  final Color txtColor;
  final String itemValue;
  final double left;
  final double right;
  final double top;
  final String counter;
  final Widget child;

  const SettingListItem({
    Key key,
    this.text,
    this.icon,
    this.onPressed,
    this.txtColor=Colors.black,
    this.itemValue,
    this.left=20,
    this.right=20,
    this.top=20,
    this.counter,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Padding(
          padding:  EdgeInsets.only(top:top,left: left,right: right,bottom: 8),
          child: InkWell(
            child: new Row(
              children: <Widget>[
//        ================ setting item name   ========================
                new Expanded(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Text(
                            text,
                            style: TextStyle(
                              color:txtColor,
                                fontSize: 16,fontWeight: FontWeight.w400 ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                     counter!=null? new Container(
                        padding: EdgeInsets.all(2),
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          '$counter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ): Container(),
                    ],
                  ),
                ),

//        ================= arrow icon ============================
                icon== null ? Container() :icon,


//        ================= value of item eg. price ============================
                itemValue==null?Container(): Text(itemValue,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)

              ],
            ),
            onTap: onPressed,
          ),
        ),

//         ====================== Divider =======================
        Padding(
          padding:  EdgeInsets.only(top:0.0,left: left,right: right,bottom: 0),
          child: Container(
            margin: EdgeInsetsDirectional.only(start: 10, top: 6),
            child: Divider(
              height: 1,
              thickness: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
