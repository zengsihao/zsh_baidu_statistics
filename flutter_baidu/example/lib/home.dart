import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_baidu/flutter_baidu.dart';
import 'package:flutter_baidu_example/home_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String startStr = '未设置';
  String authorizedStateStr = '未设置';
  String keyStr = '未设置';
  String onPageStartStr = '未设置';
  String onPageEndStr = '未设置';
  String onEventStartStr = '未设置';
  String onEventEndStr = '未设置';

  /// 启动埋点
  Future<void> start() async {
    try {
      bool result = await FlutterBaidu.start;
      if (result) {
        startStr = 'ok';
      } else {
        startStr = 'error';
      }
    } on PlatformException {
      startStr = 'start error';
    }
    setState(() {});
  }

  // 设置授权
  Future<void> setAuthorizedState() async {
    try {
      bool result = await FlutterBaidu.setAuthorizedState(true);
      if (result) {
        authorizedStateStr = 'ok';
      } else {
        authorizedStateStr = 'error';
      }
    } on PlatformException {
      authorizedStateStr = 'setAuthorizedState false';
    }
    setState(() {});
  }

  // 设置key
  Future<void> setAppKey() async {
    try {
      bool result = await FlutterBaidu.setAppKey('c376684902');
      if (result) {
        keyStr = 'ok';
      } else {
        keyStr = 'error';
      }
    } on PlatformException {
      keyStr = 'setAppKey false';
    }
    setState(() {});
  }

  // 登录事件开始
  Future<void> onEventStart() async {
    try {
      bool result = await FlutterBaidu.onEventStart('登录', '登录');
      if (result) {
        onEventStartStr = 'ok';
      } else {
        onEventStartStr = 'error';
      }
    } on PlatformException {
      onEventStartStr = 'onEventStart false';
    }
    setState(() {});
  }

  // 登录事件结束
  Future<void> onEventEnd() async {
    try {
      bool result = await FlutterBaidu.onEventEnd('注册', '注册', {
        'han': '北京',
        'orderid': '890',
        'hao': '豪'
      });
//      bool result = await FlutterBaidu.onEventEnd('登录', '登录', {
//        'openid': '899',
//        'city': '北京',
//        'name': '豪'
//      });
//      bool result = await FlutterBaidu.onEventEnd('登录', '登录', {
//        'openid': '123456',
//        'city': '北京',
//      });
      if (result) {
        onEventEndStr = 'ok';
      } else {
        onEventEndStr = 'error';
      }
    } on PlatformException {
      onEventEndStr = 'onEventEnd false';
    }
    setState(() {});
  }

  // 设置key
  Future<void> onPageStart() async {
    try {
      bool result = await FlutterBaidu.onPageStart('mian');
      if (result) {
        onPageStartStr = 'ok';
      } else {
        onPageStartStr = 'error';
      }
    } on PlatformException {
      onPageStartStr = 'setAppKey false';
    }
    setState(() {});
  }

  // 设置key
  Future<void> onPageEnd() async {
    try {
      bool result = await FlutterBaidu.onPageEnd('main');
      if (result) {
        onPageEndStr = 'ok';
      } else {
        onPageEndStr = 'error';
      }
    } on PlatformException {
      onPageEndStr = 'setAppKey false';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                start();
              },
              child: ListTile(
                title: Text('start'),
                subtitle: Text('$startStr'),
                dense: true,
              ),
            ),
            Divider(),
            RaisedButton(
              onPressed: () {
                setAuthorizedState();
              },
              child: ListTile(
                title: Text('setAuthorizedState'),
                subtitle: Text('$authorizedStateStr'),
                dense: true,
              ),
            ),
            Divider(),
            RaisedButton(
              onPressed: () {
                setAppKey();
              },
              child: ListTile(
                title: Text('setAppKey'),
                subtitle: Text('$keyStr'),
                dense: true,
              ),
            ),
            Divider(),
            RaisedButton(
              onPressed: () {
                onEventStart();
              },
              child: ListTile(
                title: Text('onEventStart'),
                subtitle: Text('$onEventStartStr'),
                dense: true,
              ),
            ),
            Divider(),
            RaisedButton(
              onPressed: () {
                onEventEnd();
              },
              child: ListTile(
                title: Text('onEventEnd'),
                subtitle: Text('$onEventEndStr'),
                dense: true,
              ),
            ),
            Divider(),
            RaisedButton(
              onPressed: () {
                onPageStart();
              },
              child: ListTile(
                title: Text('onPageStart'),
                subtitle: Text('$onPageStartStr'),
                dense: true,
              ),
            ),
            Divider(),
            RaisedButton(
              onPressed: () {
                onPageEnd();
              },
              child: ListTile(
                title: Text('onPageEnd'),
                subtitle: Text('$onPageEndStr'),
                dense: true,
              ),
            ),
            Divider(),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        settings: RouteSettings(name: 'two_page'),
                        builder: (BuildContext context) {
                          return TwoPage();
                        }));
              },
              child: ListTile(
                title: Text('去页面2'),
                dense: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
