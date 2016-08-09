# HQYReachability
监测网络状态,并跳转到系统设置页面设置网络.

GitHub：[何青云](https://github.com/qingyunhe) ｜ Blog：[江城程序猿](http://www.heqingyun.com) ｜ [feedback]：<developerqingyun@gmail.com>

---
##实现过程:
### 1 导入SystemConfiguration.framework
![Mou icon](/Users/jiangchengchengxuyuan/Desktop/GitHub/HQYReachability/Snip20160809_6.png)
### 2 配置项目info的URL Types
![Mou icon](/Users/jiangchengchengxuyuan/Desktop/GitHub/HQYReachability/Snip20160809_7.png)
### 3 导入Reachability.h和Reachability.m
[Reachability.h和Reachability.m下载地址](https://developer.apple.com/library/ios/samplecode/Reachability/Reachability.zip) 
### 4 设置窗口的根控制器
```objc

在窗口启动完成的方法中执行下述代码(HQYViewController为主控制器)  
  
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[HQYViewController alloc] init];
    [self.window makeKeyAndVisible];
    // 判断网络状态
    [self judgeNetworkStatus];

    return YES;
}

```








---
对应博客地址:
<http://www.heqingyun.com/2016/07/10/一行代码搞定网络状态监测并跳转到网络设置页面/>
