import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchCheckboxDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SwitchCheckboxState();
  }
}

class SwitchCheckboxState extends State<SwitchCheckboxDemo> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('单选框和复选框'),
        centerTitle: true,
      ),
      body: new ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('switch'),
              Expanded(child: Container()
                  /// 此组件会填满Row在主轴方向的剩余空间，撑开Row
                  ),
              Switch(
                value: _switchSelected, //当前状态
                onChanged: (value) {
                  //重新构建页面
                  setState(() {
                    _switchSelected = value;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('这是用row布局独立出来的一个Text'),
              Expanded(child: Container()
                  /// 此组件会填满Row在主轴方向的剩余空间，撑开Row
                  ),
              Checkbox(
                value: _checkboxSelected,
                activeColor: Colors.red,
                //选中时的颜色
                onChanged: (value) {
                  setState(() {
                    _checkboxSelected = value;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('a'),
              Expanded(child: Container()

                  /// 此组件会填满Row在主轴方向的剩余空间，撑开Row
                  ),
              Checkbox(
                value: _checkboxSelected,
                activeColor: Colors.red,
                //选中时的颜色
                onChanged: (value) {
                  setState(() {
                    _checkboxSelected = value;
                  });
                },
              ),
            ],
          ),
          CheckboxListTile(
            value: _checkboxSelected,
            activeColor: Colors.red,
            //选中时的颜色
            title: new Text('CheckboxListTile主标题'),
            subtitle: new Text('CheckboxListTile副标题'),
            onChanged: (value) {
              setState(() {
                _checkboxSelected = value;
              });
            },
          ),
          CheckboxListTile(
            value: _checkboxSelected,
            activeColor: Colors.red,
            //选中时的颜色
            title: new Text(
                '这是一个很长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长的CheckboxListTile主标题'),
            subtitle: new Text(
                '这是一个很长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长的CheckboxListTile副标题'),
            onChanged: (value) {
              setState(() {
                _checkboxSelected = value;
              });
            },
          )
        ],
      ),
    );
  }
}
