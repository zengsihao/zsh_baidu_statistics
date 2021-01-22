# flutter_baidu

Flutter 百度统计插件（Android 版本）

## Getting Started

### 配置 Android 项目

需要在主项目的 `AndroidManifest.xml` 文件中添加如下

[参考这里](example/android/app/src/main/AndroidManifest.xml)

``` XML
 <!-- 您从百度网站获取的APP KEY，根据实际您的APP申请的APP_KEY进行修改 -->
<meta-data
    android:name="BaiduMobAd_STAT_ID"
    android:value="修改为自己的key" />

<!-- 是否开启错误日志统计，默认为false -->
<meta-data
    android:name="BaiduMobAd_EXCEPTION_LOG"
    android:value="false" />

<!-- 日志仅在wifi网络下发送，默认为false -->
<meta-data
    android:name="BaiduMobAd_ONLY_WIFI"
    android:value="false" />

<!-- 是否获取基站位置信息 ,默认为true -->
<meta-data
    android:name="BaiduMobAd_CELL_LOCATION"
    android:value="true" />

<!-- 是否获取GPS位置信息，默认为true -->
<meta-data
    android:name="BaiduMobAd_GPS_LOCATION"
    android:value="true" />

<!-- 是否获取WIFI位置信息，默认为true -->
<meta-data
    android:name="BaiduMobAd_WIFI_LOCATION"
    android:value="true" />
```

### 添加配置插件

在主项目的 `pubspec.yaml` 文件中添加 
[参考这里](example/pubspec.yaml)

``` yaml
  flutter_baidu:
    path: 这里些插件相对于主项目的相对路径如 ../../test/flutter_baidu
```

### 埋点 API

- [参考官网](https://mtj.baidu.com/static/userguide/book/android.html)
- [参考示例项目](example/lib/home.dart)

``` Dart
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
```