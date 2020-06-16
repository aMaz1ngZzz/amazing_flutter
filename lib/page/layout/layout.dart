import 'package:amazing_flutter/service/http_service.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

/// Row布局
/// 在Flutter中非常常见的一个多子节点控件，将children排列成一行。估计是借鉴了Web中Flex布局，所以很多属性和表现，都跟其相似。但是注意一点，自身不带滚动属性，如果超出了一行，在debug下面则会显示溢出的提示
class RowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Row布局'),
          centerTitle: true,
        ),
        body: Row(
          children: <Widget>[
            const FlutterLogo(),
            const Expanded(
              child: Text(
                  'Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
            ),
            const Icon(Icons.sentiment_very_satisfied),
          ],
        ));
  }
}

//  Column布局
class ColumnLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Column布局'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('We move under cover and we move as one'),
            Text('Through the night, we have one shot to live another day'),
            Text('We cannot let a stray gunshot give us away'),
            Text('We will fight up close, seize the moment and stay in it'),
            Text('It’s either that or meet the business end of a bayonet'),
            Text('The code word is ‘Rochambeau,’ dig me?'),
            Text('Rochambeau!',
                style: DefaultTextStyle.of(context)
                    .style
                    .apply(fontSizeFactor: 2.0)),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('点我'),
              onPressed: () {
                HttpService.getPlatformService().then((data) {
                  return showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('获取用户信息'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text(JsonCodec().decode(data)[0]['name']),
                              Text('You\’re like me. I’m never satisfied.'),
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
        ));
  }
}

///  Stack布局
///  Stack可以类比web中的absolute，绝对布局。绝对布局一般在移动端开发中用的较少，但是在某些场景下，还是有其作用。当然，能用Stack绝对布局完成的，用其他控件组合也都能实现
class StackLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Stack布局'),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              width: 250,
              height: 250,
              color: Colors.red,
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.all(5.0),
              width: 200,
              height: 200,
              color: Colors.green,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
          ],
        ));
  }
}

///  IndexedStack布局
///  IndexedStack继承自Stack，它的作用是显示第index个child，其他child都是不可见的。所以IndexedStack的尺寸永远是跟最大的子节点尺寸一致。
class IndexedStackLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('IndexedStack布局'),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: 2,
          children: <Widget>[
            Container(
              width: 250,
              height: 250,
              color: Colors.red,
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.all(5.0),
              width: 200,
              height: 200,
              color: Colors.green,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
          ],
        ));
  }
}

///  Flow布局
///  Flow按照解释的那样，是一个实现流式布局算法的控件。流式布局在大前端是很常见的布局方式，但是一般使用Flow很少，因为其过于复杂，很多场景下都会去使用Wrap
class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

class FlowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const width = 80.0;
    const height = 60.0;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Flow布局'),
          centerTitle: true,
        ),
        body: Flow(
          delegate: TestFlowDelegate(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0)),
          children: <Widget>[
            new Container(
              width: width,
              height: height,
              color: Colors.yellow,
            ),
            new Container(
              width: width,
              height: height,
              color: Colors.green,
            ),
            new Container(
              width: width,
              height: height,
              color: Colors.red,
            ),
            new Container(
              width: width,
              height: height,
              color: Colors.black,
            ),
            new Container(
              width: width,
              height: height,
              color: Colors.blue,
            ),
            new Container(
              width: width,
              height: height,
              color: Colors.lightGreenAccent,
            ),
          ],
        ));
  }
}

///  Table布局
///  每一种移动端布局中都会有一种table布局，这种控件太常见了。至于其表现形式，完全可以借鉴其他移动端的，通俗点讲，就是表格
class TableLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('table布局'),
          centerTitle: true,
        ),
        body: Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(50.0),
            1: FixedColumnWidth(100.0),
            2: FixedColumnWidth(50.0),
            3: FixedColumnWidth(100.0),
          },
          border: TableBorder.all(
              color: Colors.red, width: 1.0, style: BorderStyle.solid),
          children: const <TableRow>[
            TableRow(
              children: <Widget>[
                Text('A1'),
                Text('B1'),
                Text('C1'),
                Text('D1'),
              ],
            ),
            TableRow(
              children: <Widget>[
                Text('A2'),
                Text('B2'),
                Text('C2'),
                Text('D2'),
              ],
            ),
            TableRow(
              children: <Widget>[
                Text('A3'),
                Text('B3'),
                Text('C3'),
                Text('D3'),
              ],
            ),
          ],
        ));
  }
}

///  Wrap布局
///  看简介，其实Wrap实现的效果，Flow可以很轻松，而且可以更加灵活的实现出来。
class WarpLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Wrap布局'),
          centerTitle: true,
        ),
        body: Wrap(
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0, // gap between lines
          children: <Widget>[
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900,
                  child: new Text(
                    'AH',
                    style: TextStyle(fontSize: 10.0),
                  )),
              label: Text('Hamilton'),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900,
                  child: new Text(
                    'ML',
                    style: TextStyle(fontSize: 10.0),
                  )),
              label: Text('Lafayette'),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900,
                  child: new Text(
                    'HM',
                    style: TextStyle(fontSize: 10.0),
                  )),
              label: Text('Mulligan'),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900,
                  child: new Text(
                    'JL',
                    style: TextStyle(fontSize: 10.0),
                  )),
              label: Text('Laurens'),
            ),
          ],
        ));
  }
}

///  ListBody布局
///  ListBody是一个不常直接使用的控件，一般都会配合ListView或者Column等控件使用。ListBody的作用是按给定的轴方向，按照顺序排列子节点
class ListBodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('ListBody布局'),
          centerTitle: true,
        ),
        body: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            ListBody(
              mainAxis: Axis.horizontal,
              reverse: false,
              children: <Widget>[
                Container(
                  color: Colors.red,
                  width: 50.0,
                  height: 50.0,
                ),
                Container(
                  color: Colors.yellow,
                  width: 50.0,
                  height: 50.0,
                ),
                Container(
                  color: Colors.green,
                  width: 50.0,
                  height: 50.0,
                ),
                Container(
                  color: Colors.blue,
                  width: 50.0,
                  height: 50.0,
                ),
                Container(
                  color: Colors.black,
                  width: 50.0,
                  height: 50.0,
                ),
              ],
            )
          ],
        ));
  }
}

///  ListView布局
///  ListView是一个非常常用的控件，涉及到数据列表展示的，一般情况下都会选用该控件。ListView跟GridView相似，基本上是一个slivers里面只包含一个SliverList的CustomScrollView。
class ListViewLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('ListBody布局'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 1000,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
            );
          },
        ));
  }
}

///  CustomMultiChildLayout布局
///  之前单节点布局控件中介绍过一个类似的控件--CustomSingleChildLayout，都是通过delegate去实现自定义布局，只不过这次是多节点的自定义布局的控件，通过提供的delegate，可以实现控制节点的位置以及尺寸

class TestLayoutDelegate extends MultiChildLayoutDelegate {
  TestLayoutDelegate();

  static const String title = 'title';
  static const String description = 'description';

  @override
  void performLayout(Size size) {
    final BoxConstraints constraints = new BoxConstraints(maxWidth: size.width);

    final Size titleSize = layoutChild(title, constraints);
    positionChild(title, new Offset(0.0, 0.0));

    final double descriptionY = titleSize.height;
    layoutChild(description, constraints);
    positionChild(description, new Offset(0.0, descriptionY));
  }

  @override
  bool shouldRelayout(TestLayoutDelegate oldDelegate) => false;
}

class MyCustomMultiChildLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('CustomSingleChildLayout布局'),
          centerTitle: true,
        ),
        body: Container(
          width: 200.0,
          height: 100.0,
          color: Colors.yellow,
          child: CustomMultiChildLayout(
            delegate: TestLayoutDelegate(),
            children: <Widget>[
              LayoutId(
                id: TestLayoutDelegate.title,
                child: new Text("This is title",
                    style: TextStyle(fontSize: 20.0, color: Colors.black)),
              ),
              LayoutId(
                id: TestLayoutDelegate.description,
                child: new Text("This is description",
                    style: TextStyle(fontSize: 14.0, color: Colors.red)),
              ),
            ],
          ),
        ));
  }
}
