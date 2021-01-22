import 'package:flutter/material.dart';
import 'package:flutter_baidu/flutter_baidu.dart';
import 'package:flutter_baidu_example/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      navigatorObservers: [
        /// 设置自动抓去路由页面，也可以通过
        /// FlutterBaidu.onPageStart('two_page');
        /// FlutterBaidu.onPageEnd('two_page');
        /// 手动自己设置
        BaiduObserver(),
      ],
    );
  }
}
