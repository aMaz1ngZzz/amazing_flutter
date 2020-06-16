import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TextFieldState();
    ;
  }
}

class TextFieldState extends State<TextFieldDemo> {
  TextEditingController _nameController = new TextEditingController();

  //  定义多个焦点，分别绑定多个输入框，在第一个输入框完成输入之后自动将焦点移动到下个输入框
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          TextField(
            textDirection: TextDirection.ltr,
            autofocus: true,
            controller: _nameController,
            onChanged: (v) {
              print(_nameController.text);
            },
            onEditingComplete: (){
              if(null == focusScopeNode){
                focusScopeNode = FocusScope.of(context);
              }
              focusScopeNode.requestFocus(focusNode1);
            },
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person)),
          ),
          TextField(
            textDirection: TextDirection.ltr,
            obscureText: true, //  是否隐藏输入字段
            focusNode: focusNode1,
            onEditingComplete: (){
              focusScopeNode.requestFocus(focusNode2);
            },
            decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock)),
          ),
          TextField(
            autofocus: true,
            textDirection: TextDirection.ltr,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.newline,
            focusNode: focusNode2,
            onChanged: (v) {
              print("onChange: $v");
              _nameController.text = _nameController.text + v;
            },
            // 输入字段类型
            decoration: InputDecoration(
                labelText: "年龄",
                hintText: "请输入数字",
                prefixIcon: Icon(Icons.person)),
          ),
        ],
      ),
    );
  }
}
