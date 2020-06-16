import 'package:amazing_flutter/page/hardware/database.dart';
import 'package:flutter/material.dart';

class HardwareDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: EdgeInsets.all(20.0),
      children: [
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('调用摄像头'),
          onPressed: () {
            Navigator.pushNamed(context, '/RowLayout');
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('文件选择'),
          onPressed: () {
            Navigator.pushNamed(context, '/ColumnLayout');
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('定位'),
          onPressed: () {
            Navigator.pushNamed(context, '/StackLayout');
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('语音'),
          onPressed: () {
            Navigator.pushNamed(context, '/IndexedStackLayout');
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('sqflite数据库'),
          onPressed: () {
            DataBase _database = new DataBase();
            //var a = await _database.get();
          },
        ),
      ],
    );
  }
}
