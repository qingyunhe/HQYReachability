# HQYReachability
监测网络状态,并跳转到系统设置页面设置网络.

GitHub：[何青云](https://github.com/qingyunhe) ｜ Blog：[江城程序猿](http://www.heqingyun.com) ｜ Contact me：<developerqingyun@gmail.com>

---
##实现过程:
### 1 导入SystemConfiguration.framework
Target -> Bulid Phases

[截图见博客](http://www.heqingyun.com/2016/07/10/一行代码搞定网络状态监测并跳转到网络设置页面/)
### 2 配置项目info的URL Types
Target -> Info

[截图见博客](http://www.heqingyun.com/2016/07/10/一行代码搞定网络状态监测并跳转到网络设置页面/)
### 3 导入Reachability.h和Reachability.m
[Reachability.h和Reachability.m下载地址](https://developer.apple.com/library/ios/samplecode/Reachability/Reachability.zip) 
### 4 设置窗口的根控制器

在窗口启动完成的方法中执行下述代码(HQYViewController为主控制器)  
```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[HQYViewController alloc] init];
    [self.window makeKeyAndVisible];
    // 判断网络状态
    [self judgeNetworkStatus];

    return YES;
}

```

### 5 判断网络状态


```objc
- (void)judgeNetworkStatus{
    
    // 1.创建Reachability对象
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    // 2.判断网络状态
    if ([reachability currentReachabilityStatus] == ReachableViaWiFi) {
        // 当前已连接wifi
        [self checkNetworkStatus:@"当前已连接wifi"];
    } else if ([reachability currentReachabilityStatus] == ReachableViaWWAN) {
        // 没有使用wifi, 正使用蜂窝数据访问网络
        [self checkNetworkStatus:@"正使用蜂窝网络"];
    } else {
        // 请打开设置,连接网络
        [self connectNetwork:@"打开设置界面"];
    }
}
```
### 6 弹出联网状态弹窗

```objc
- (void)checkNetworkStatus:(NSString *) string{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"联网状态提醒" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *tipButton = [UIAlertAction actionWithTitle:string style:(UIAlertActionStyleCancel) handler:nil];
    
    [alertController addAction:tipButton];
    
    [self.window.rootViewController presentViewController:alertController animated:YES completion: nil];
}
```
### 7 弹出联网状态弹窗







---
对应博客地址:
<http://www.heqingyun.com/2016/07/10/一行代码搞定网络状态监测并跳转到网络设置页面/>
