import 'package:flutter/material.dart';

//  常用组件展示列表
class CommonWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: EdgeInsets.all(20.0),
      children: [
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('输入框'),
          onPressed: () {
            Navigator.pushNamed(context, '/TextFieldDemo');
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('按钮'),
          onPressed: () {
            Navigator.pushNamed(context, '/ButtonDemo');
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('单选框/复选框'),
          onPressed: () {
            Navigator.pushNamed(context, '/SwitchCheckboxDemo');
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('图片/图标'),
          onPressed: () {
            Navigator.pushNamed(context, '/ImageIconDemo');
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('Flow布局'),
          onPressed: () {
            Navigator.pushNamed(context, '/FlowLayout');
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('Table布局'),
          onPressed: () {
            Navigator.pushNamed(context, '/TableLayout');
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('Wrap布局'),
          onPressed: () {
            Navigator.pushNamed(context, '/WarpLayout');
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('ListBody布局'),
          onPressed: () {
            Navigator.pushNamed(context, '/ListBodyLayout');
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('ListView布局'),
          onPressed: () {
            Navigator.pushNamed(context, '/ListViewLayout');
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('CustomMultiChildLayout布局'),
          onPressed: () {
            Navigator.pushNamed(context, '/MyCustomMultiChildLayout');
          },
        )
      ],
    );
  }
}
