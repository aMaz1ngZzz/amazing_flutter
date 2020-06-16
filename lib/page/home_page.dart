import 'package:amazing_flutter/entity/common/choice.dart';
import 'package:amazing_flutter/page/common_widget_demo.dart';
import 'package:amazing_flutter/page/hardware_demo.dart';
import 'package:amazing_flutter/page/http_demo.dart';
import 'package:amazing_flutter/page/layout_demo.dart';
import 'package:amazing_flutter/route_config.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  final List<Choice> choices = const <Choice>[
    const Choice(title: '布局', icon: Icons.developer_board),
    const Choice(title: 'HTTP请求', icon: Icons.https),
    const Choice(title: '访问硬件', icon: Icons.smartphone),
    const Choice(title: '常用控件', icon: Icons.widgets)
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes:  RouteConfig.getRoutes(),
      home: new DefaultTabController(
        length: choices.length,
        child: new Scaffold(
          appBar: new AppBar(
            title: const Text('a aMaz1ng flutter demo'),
            bottom: new TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return new Tab(
                  text: choice.title,
                  icon: new Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: new TabBarView(
            children: [
              new LayoutDemo(),
              new HttpDemo(),
              new HardwareDemo(),
              new CommonWidgetDemo(),
            ]
          ),
        ),
      ),
    );
  }

  void goToNewPage(String title, String routes) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
