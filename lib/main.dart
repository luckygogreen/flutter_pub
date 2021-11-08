import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter字典'),
      ),
      body: Container(
        color: Colors.blue.shade100,
        width: double.infinity,
        alignment: Alignment.centerRight,
        child: ListView(
          children: [
            CustomerTextButton(text: '1.右滑显示删除图标', type: 1),
            const Divider(height: 20, color: Colors.black),
            CustomerTextButton(text: '2.删除列表中的数据', type: 2),
          ],
        ),
      ),
    );
  }
}

class CustomerTextButton extends StatefulWidget {
  CustomerTextButton({Key? key, required this.text, required this.type})
      : super(key: key);
  final String text;
  final int type;

  @override
  _CustomerTextButtonState createState() => _CustomerTextButtonState();
}

class _CustomerTextButtonState extends State<CustomerTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      onPressed: () {
        if (widget.type == 1) {
          Navigator.pushNamed(context, '/slidercontrol');
        }
        if (widget.type == 2) {
          Navigator.pushNamed(context, '/delete/map/in/list');
        }
      },
    );
  }
}
