package com.zero.baidu.flutter_baidu;

import android.app.Activity;
import android.content.Intent;
import android.util.Log;

import com.baidu.mobstat.StatService;

import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * 工具类代理
 */
public class BaiduDelegate {
    private Activity activity;
    private MethodChannel.Result pendingResult;

    public BaiduDelegate(Activity activity) {
        this.activity = activity;
    }

    /**
     * start
     *
     * @param call   MethodCall
     * @param result Result
     */
    public void start(MethodCall call, MethodChannel.Result result) {
        this.pendingResult = result;
        StatService.start(activity);
        pendingResult.success(true);
    }


    /**
     * setAuthorizedState
     *
     * @param call   MethodCall
     * @param result Result
     */
    public void setAuthorizedState(MethodCall call, MethodChannel.Result result) {
        this.pendingResult = result;
        boolean state=call.argument("state");
        StatService.setAuthorizedState(activity,state);
        pendingResult.success(true);
    }

    /**
     * setAppKey
     *
     * @param call   MethodCall
     * @param result Result
     */
    public void setAppKey(MethodCall call, MethodChannel.Result result) {
        this.pendingResult = result;
        String key=call.argument("key");
        StatService.setAppKey(key);
        pendingResult.success(true);
    }

    /**
     * onPageStart
     *
     * @param call   MethodCall
     * @param result Result
     */
    public void onPageStart(MethodCall call, MethodChannel.Result result) {
        this.pendingResult = result;
        String pageName=call.argument("pageName");
        StatService.onPageStart(activity, pageName);
        pendingResult.success(true);
    }

    /**
     * onPageEnd
     *
     * @param call   MethodCall
     * @param result Result
     */
    public void onPageEnd(MethodCall call, MethodChannel.Result result) {
        this.pendingResult = result;
        String pageName=call.argument("pageName");
        StatService.onPageEnd(activity, pageName);
        pendingResult.success(true);
    }

    /**
     * onEventStart
     *
     * @param call   MethodCall
     * @param result Result
     */
    public void onEventStart(MethodCall call, MethodChannel.Result result) {
        this.pendingResult = result;
        String eventId=call.argument("eventId");
        String label=call.argument("label");

        StatService.onEventStart(activity, eventId,label);
        pendingResult.success(true);
    }

    /**
     * onEventEnd
     *
     * @param call   MethodCall
     * @param result Result
     */
    public void onEventEnd(MethodCall call, MethodChannel.Result result) {
        this.pendingResult = result;
        String eventId=call.argument("eventId");
        String label=call.argument("label");
        Map<String, String> attributes=call.argument("attributes");
        StatService.onEventEnd(activity, eventId,label,attributes);
        pendingResult.success(true);
    }

}
