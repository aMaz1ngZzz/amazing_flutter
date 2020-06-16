import 'package:amazing_flutter/entity/common/icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageIconDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ImageIconDemoState();
    ;
  }
}

class ImageIconDemoState extends State<ImageIconDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("图片/图标"),
        centerTitle: true,
      ),
      body: new ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          new Container(
            width: 90,
            height: 90,
            child: Image(
              image: AssetImage("assets/images/star1.jpg"),
              width: 50.0,
              fit: BoxFit.fitHeight,
            ),
          ),
          new Container(
              width: 90,
              height: 90,
              child: Text(
                '\uE000',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "MaterialIcons",
                    fontSize: 24.0,
                    color: Colors.green),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.accessible,
                color: Colors.green,
              ),
              Icon(
                Icons.error,
                color: Colors.green,
              ),
              Icon(
                Icons.fingerprint,
                color: Colors.green,
              ),
              //  自定义图标
              Icon(
                AntDesignIcons.logout,
              ),
            ],
          )
        ],
      ),
    );
  }
}
