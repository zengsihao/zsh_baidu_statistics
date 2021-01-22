import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// 百度统计插件
class FlutterBaidu {
  static const MethodChannel _channel = const MethodChannel('flutter_baidu');

  /// 建议此代码埋点在统计路径触发的第一个页面中，若可能存在多个则建议都埋点
  /// 启动埋点
  static Future<bool> get start async {
    final bool startOk = await _channel.invokeMethod('start');
    return startOk;
  }

  /// 通过该接口可以控制敏感数据采集，true表示可以采集，false表示不可以采集，
  /// 该方法一定要最优先调用，请在StatService.start(this)之前调用，采集这些数据可以帮助App运营人员更好的监控App的使用情况，
  /// 建议有用户隐私策略弹窗的App，用户未同意前设置false,同意之后设置true
  static Future<bool> setAuthorizedState(bool state) async {
    final bool stateOk =
        await _channel.invokeMethod('setAuthorizedState', {'state': state});
    return stateOk;
  }

  /// 设置 app key
  static Future<bool> setAppKey(String key) async {
    final bool stateOk = await _channel.invokeMethod('setAppKey', {'key': key});
    return stateOk;
  }

  /// 设置事件开始
  /// [eventId] 事件Id，提前在网站端创建
  /// [label] 事件标签，附加参数，不能为空字符串
  static Future<bool> onEventStart(
    String eventId,
    label,
  ) async {
    final bool stateOk = await _channel.invokeMethod('onEventStart', {
      'eventId': eventId,
      'label': label,
    });
    return stateOk;
  }

  /// 设置事件结束
  /// [eventId] 事件Id，提前在网站端创建
  /// [label] 事件标签，附加参数，不能为空字符串
  /// [attributes] 事件属性，对应的key需要在网站上创建，注意：key，value只接受String
  static Future<bool> onEventEnd(
      String eventId, label, Map<String, String> attributes) async {
    final bool stateOk = await _channel.invokeMethod('onEventEnd', {
      'eventId': eventId,
      'label': label,
      'attributes': attributes,
    });
    return stateOk;
  }

  /// 设置页面启动
  /// [pageName] 页面名称
  static Future<bool> onPageStart(String pageName) async {
    final bool stateOk =
        await _channel.invokeMethod('onPageStart', {'pageName': pageName});
    return stateOk;
  }

  /// 设置页面结束
  /// [pageName] 页面名称
  static Future<bool> onPageEnd(String pageName) async {
    final bool stateOk =
        await _channel.invokeMethod('onPageEnd', {'pageName': pageName});
    return stateOk;
  }
}

/// 百度上报路由监听
class BaiduObserver extends RouteObserver<PageRoute<dynamic>> {
  /// 设置进入页面
  void _sendPushPage(PageRoute<dynamic> route) {
    final String screenName = route?.settings?.name ?? '/';
    if (screenName != null) {
      FlutterBaidu.onPageStart(screenName);
    }
  }

  /// 设置退出页面
  void _sendDidPage(PageRoute<dynamic> route) {
    final String screenName = route?.settings?.name ?? '/';
    if (screenName != null) {
      FlutterBaidu.onPageEnd(screenName);
    }
  }

  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _sendPushPage(route);
    }
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _sendPushPage(newRoute);
      _sendDidPage(oldRoute);
    }
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      _sendDidPage(previousRoute);
    }
  }
}
