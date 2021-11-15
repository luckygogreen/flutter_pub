import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

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
    int iconInt1 = Icons.access_alarm.codePoint.toInt(); // 获取Icon的数字 57400
    Map IconToDatabse1 = {'icon': iconInt1, 'fontfamily': 'MaterialIcons'};
    String jsonIcon1 = jsonEncode(IconToDatabse1); // 最终存入数据库的值 jsonIcon

    //////////// 从数据库获取ICON并打印出来 ////////////
    // 例如 {icon: 57400, fontfamily: MaterialIcons}
    Map iconObj1 = jsonDecode(jsonIcon1);

    // 获取颜色的值 可以存入数据库
    int colorValue = Colors.indigo.value; // int  4282339765

    return Scaffold(
      appBar: AppBar(
        title: Text('保存或读取图标'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Icon(
                //////////// 显示从数据库获取的 ////////////
                IconData(iconObj1['icon'], fontFamily: iconObj1['fontfamily']),
                color: Color(colorValue),
              ),
              //////////// 第三方图标库里的图标  ////////////
              Icon(LineIcons.smilingFace),
            ],
          ),
        ),
      ),
    );
  }
}
