import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: EdgeInsets.all(20.0),
      children: [
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('Row布局'),
          onPressed: () {
            Navigator.pushNamed(context, '/RowLayout');
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('Column布局'),
          onPressed: () {
            Navigator.pushNamed(context, '/ColumnLayout');
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('Stack布局'),
          onPressed: () {
            Navigator.pushNamed(context, '/StackLayout');
          },
        ),
        new MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('IndexedStack布局'),
          onPressed: () {
            Navigator.pushNamed(context, '/IndexedStackLayout');
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
