import 'package:flutter/material.dart';
import 'package:flutter_baidu/flutter_baidu.dart';

/// 页面2
class TwoPage extends StatefulWidget {
  TwoPage({Key key}) : super(key: key);

  @override
  _TwoPageState createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {
  @override
  void initState() {
    /// 设置自定义页面事件
    FlutterBaidu.onPageStart('two_page');
    super.initState();
  }

  @override
  void dispose() {
    /// 设置自定义页面事件
    FlutterBaidu.onPageEnd('two_page');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('页面2'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('点击返回'),
        ),
      ),
    );
  }
}
