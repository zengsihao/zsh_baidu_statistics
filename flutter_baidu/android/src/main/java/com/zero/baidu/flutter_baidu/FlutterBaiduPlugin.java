package com.zero.baidu.flutter_baidu;

import androidx.annotation.NonNull;

import com.baidu.mobstat.StatService;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterBaiduPlugin */
public class FlutterBaiduPlugin implements FlutterPlugin, ActivityAware,MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private BaiduDelegate delegate;


  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    setupEngine(flutterPluginBinding);
  }


  private void setupEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_baidu");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("start")) {
      this.delegate.start(call, result);
    } else if (call.method.equals("setAuthorizedState")) {
      this.delegate.setAuthorizedState(call, result);
    } else if (call.method.equals("setAppKey")) {
      this.delegate.setAppKey(call, result);
    } else if (call.method.equals("onPageStart")) {
      this.delegate.onPageStart(call, result);
    } else if (call.method.equals("onPageEnd")) {
      this.delegate.onPageEnd(call, result);
    }else if (call.method.equals("onEventStart")) {
      this.delegate.onEventStart(call, result);
    }else if (call.method.equals("onEventEnd")) {
      this.delegate.onEventEnd(call, result);
    }  else {
      result.notImplemented();
    }
  }


  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    this.delegate = new BaiduDelegate(binding.getActivity());
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    onAttachedToActivity(binding);
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    onDetachedFromActivity();
  }

  @Override
  public void onDetachedFromActivity() {
    delegate = null;
  }
}
