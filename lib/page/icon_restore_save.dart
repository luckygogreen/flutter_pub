import 'dart:convert';

import 'package:flutter/material.dart';

class IconSaveDatabaseOrRestore extends StatefulWidget {
  IconSaveDatabaseOrRestore({Key? key}) : super(key: key);

  @override
  _IconSaveDatabaseOrRestoreState createState() =>
      _IconSaveDatabaseOrRestoreState();
}

class _IconSaveDatabaseOrRestoreState extends State<IconSaveDatabaseOrRestore> {
  @override
  Widget build(BuildContext context) {
    //////////// 获取图标的INT数值 用于存数据库 ////////////
    int iconInt = Icons.access_alarm.codePoint.toInt(); // 获取Icon的数字 57400
    Map IconToDatabse = {'icon': iconInt, 'fontfamily': 'MaterialIcons'};
    String jsonIcon = jsonEncode(IconToDatabse); // 最终存入数据库的值 jsonIcon

    //////////// 从数据库获取ICON并打印出来 ////////////
    Map iconObj =
        jsonDecode(jsonIcon); // {icon: 57400, fontfamily: MaterialIcons}

    // 获取颜色的值 可以存入数据库
    int colorValue = Colors.indigo.value; // int  4282339765

    return Scaffold(
      appBar: AppBar(
        title: Text('保存或读取图标'),
      ),
      body: Container(
        child: Center(
          child: Icon(
            //////////// 显示从数据库获取的 ////////////
            IconData(iconObj['icon'], fontFamily: iconObj['fontfamily']),
            color: Color(colorValue),
          ),
        ),
      ),
    );
  }
}
