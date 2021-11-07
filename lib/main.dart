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
        toolbarHeight: 0.1,
      ),
      body: ListView(
        children: [
          CustomerTextButton(
            text: '1.右滑显示删除图标',
          ),
        ],
      ),
    );
  }
}

class CustomerTextButton extends StatefulWidget {
  CustomerTextButton({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  _CustomerTextButtonState createState() => _CustomerTextButtonState();
}

class _CustomerTextButtonState extends State<CustomerTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        widget.text,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      onPressed: () => Navigator.pushNamed(context, '/slidercontrol'),
    );
  }
}
