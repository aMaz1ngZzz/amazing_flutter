import 'dart:convert';
import 'dart:io';

import 'package:amazing_flutter/config/sys_config.dart';
import 'package:amazing_flutter/service/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:amazing_flutter/common/skip_down_time.dart';
import 'package:amazing_flutter/common/common_utils.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() {
    return new _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage>
    implements OnSkipClickListener {
  var welcomeImageUrl = SysConfig.WELCOME_DEFAULT_IMG;

  @override
  void initState() {
    super.initState();
    _getWelcomeImage();
    _delayedGoHomePage();
  }

  _delayedGoHomePage() {
    Future.delayed(new Duration(seconds: 5), () {
      _goHomePage();
    });
  }

  _goHomePage() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  /// 获取欢迎页图片
  _getWelcomeImage() async {
    setState(() {
      welcomeImageUrl = SysConfig.WELCOME_DEFAULT_IMG;
      // HttpService.getWelcomeImage().then((json) {
      //   var data = json.data;
      //   if (data != null && data.length > 0) {
      //     welcomeImageUrl = data[0]['field_app_ad_cover'];
      //   } else {
      //     welcomeImageUrl = SysConfig.WELCOME_DEFAULT_IMG;
      //   }
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        new Container(
          color: Colors.white,
          child: new Image.network(
            welcomeImageUrl,
            fit: BoxFit.cover,
          ),
          constraints: new BoxConstraints.expand(),
        ),
        new Image.asset(
          'assets/images/wenshan_wel_logon.jpg',
          fit: BoxFit.fitWidth,
        ),
        new Container(
          child: Align(
            alignment: Alignment.topRight,
            child: new Container(
              padding: const EdgeInsets.only(top: 30.0, right: 20.0),
              child: new SkipDownTimeProgress(
                Colors.red,
                22.0,
                new Duration(seconds: 5),
                new Size(25.0, 25.0),
                skipText: "跳过",
                clickListener: this,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void onSkipClick() {
    _goHomePage();
  }
}
