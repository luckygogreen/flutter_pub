import 'package:flutter/material.dart';
import './page/delete_map_in_list.dart';
import './page/slider_controller.dart';
import './page/icon_restore_save.dart';
import './page/slidable.dart';

//配置路由
final Map<String, Function> routes = {
  // '/': (context) => StartPage(),
  // '/slidercontrol': (context) => SliderController(),
  '/delete/map/in/list': (context) => DeleteMapInList(),
  '/icon/save/restore': (context) => IconSaveDatabaseOrRestore(),
  '/slidable': (context) => SlidableDemo(),
  // '/home': (context) => HomePage(),
  // '/business/update': (context, {arguments}) =>
  //     UpdateBusinessInfo(arguments: arguments),
  // '/store': (context) => StoresPage(),
  // '/store/single': (context, {arguments}) => StoreSingle(arguments: arguments),
  // '/order': (context) => OrderPage(),
  // '/profile': (context) => ProfilePage(),
};

//固定写法
// ignore: prefer_function_declarations_over_variables
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
