import 'package:amazing_flutter/page/common_widget/button/button.dart';
import 'package:amazing_flutter/page/common_widget/image_and_icon/image_and_icon.dart';
import 'package:amazing_flutter/page/common_widget/switch_and_checkbox/switch_and_heckbox.dart';
import 'package:amazing_flutter/page/common_widget/text_field/text_field.dart';
import 'package:amazing_flutter/page/home_page.dart';
import 'package:flutter/material.dart';

import 'package:amazing_flutter/page/layout/layout.dart';

class RouteConfig {
  static const WELCOME_PAGE = '/';
  static const HOME_PAGE = '/home';

  static Map<String, WidgetBuilder> getRoutes() {
    var route = {
      HOME_PAGE: (BuildContext context) {
        return MyHomePage(title: 'aMazing Flutter');
      },
      '/ImageIconDemo': (BuildContext context) => ImageIconDemo(),
      '/TextFieldDemo': (BuildContext context) => TextFieldDemo(),
      '/SwitchCheckboxDemo': (BuildContext context) => SwitchCheckboxDemo(),
      '/ButtonDemo': (BuildContext context) => ButtonDemo(),
      '/RowLayout': (BuildContext context) => RowLayout(),
      '/ColumnLayout': (BuildContext context) => ColumnLayout(),
      '/StackLayout': (BuildContext context) => StackLayout(),
      '/IndexedStackLayout': (BuildContext context) => IndexedStackLayout(),
      '/FlowLayout': (BuildContext context) => FlowLayout(),
      '/TableLayout': (BuildContext context) => TableLayout(),
      '/WarpLayout': (BuildContext context) => WarpLayout(),
      '/ListBodyLayout': (BuildContext context) => ListBodyLayout(),
      '/ListViewLayout': (BuildContext context) => ListViewLayout(),
      '/MyCustomMultiChildLayout': (BuildContext context) =>
          MyCustomMultiChildLayout(),
    };
    return route;
  }
}
