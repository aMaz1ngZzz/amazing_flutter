import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ButtonDemoState();
    ;
  }
}

class ButtonDemoState extends State<ButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("按钮"),
        centerTitle: true,
      ),
      body: new ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          RaisedButton(
            child: Text("RaisedButton"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () => {},
          ),
          FlatButton(
            child: Text("FlatButton"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () => {},
          ),
          OutlineButton(
            child: Text("OutlineButton"),
            color: Colors.blue,
            textColor: Colors.black,
            onPressed: () => {},
          ),
          DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.red, Colors.orange[700]]), //背景渐变
                borderRadius: BorderRadius.circular(3.0), //3像素圆角
                boxShadow: [
                  //阴影
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0)
                ]),
            child: OutlineButton(
              child: Text("OutlineButton"),
              color: Colors.blue,
              textColor: Colors.black,
              onPressed: () => {},
            ),
          ),
          IconButton(
            icon: Icon(Icons.thumb_up),
            color: Colors.blue,
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
