#import "FlutterBaiduPlugin.h"
#if __has_include(<flutter_baidu/flutter_baidu-Swift.h>)
#import <flutter_baidu/flutter_baidu-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_baidu-Swift.h"
#endif

@implementation FlutterBaiduPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterBaiduPlugin registerWithRegistrar:registrar];
}
@end
