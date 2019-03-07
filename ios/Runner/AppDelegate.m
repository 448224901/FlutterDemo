#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate
//-对象方法(返回值类型)方法名WithXXX:(参数类型)参数名称 andXXX:(参数类型)参数名; 调用方法直接复制方法名加{}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];//调用方法
  // Override point for customization after application launch.

  //获取系统电量
  FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
   FlutterMethodChannel* batteryChannel = [FlutterMethodChannel
                                            methodChannelWithName:@"samples.flutter.io/battery"
                                            binaryMessenger:controller];

    [batteryChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
       //调用获取系统电池的方法
       if ([@"getBatteryLevel" isEqualToString:call.method]) {
           int batteryLevel = [self getBatteryLevel];

           if (batteryLevel == -1) {
             result([FlutterError errorWithCode:@"UNAVAILABLE"
                                        message:@"电池信息不可用"
                                        details:nil]);
           } else {
             result(@(batteryLevel));
           }
         } else {
           result(FlutterMethodNotImplemented);
         }
     }];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

    //获取系统电量方法
    - (int)getBatteryLevel {
      UIDevice* device = UIDevice.currentDevice;
      device.batteryMonitoringEnabled = YES;
      if (device.batteryState == UIDeviceBatteryStateUnknown) {
        return -1;
      } else {
        return (int)(device.batteryLevel * 100);
      }
    }
@end
