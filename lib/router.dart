import 'package:flutter/material.dart';
import './page/slider_controller.dart';

//配置路由
final Map<String, Function> routes = {
  // '/': (context) => StartPage(),
  '/slidercontrol': (context) => SliderController(),
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
