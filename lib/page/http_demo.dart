import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:amazing_flutter/service/http_service.dart';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: EdgeInsets.all(20.0),
      children: [
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('GET请求'),
          onPressed: () {
            HttpService.getPlatformService().then((json) {
              List data = json.data;
              String name = '';
              for (int i = 0; i < data.length; i++) {
                name += data[i]['name'] + ';';
              }
              return showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('GET获取服务套餐'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text(name),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('确认'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            });
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('POST请求'),
          onPressed: () {
            HttpService.getAppManage().then((json) {
              List data = json.data['Items'];
              String name = '';
              for (int i = 0; i < data.length; i++) {
                name += data[i]['AppName'] + ';';
              }
              return showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('POST获取企业信息'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text(name),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('确认'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            });
          },
        ),
      ],
    );
  }
}
