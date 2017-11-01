//
//  AppDelegate.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/8/24.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "AppDelegate.h"
#import "LXTabbarController.h"
#import "CitiesDataTool.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor =[UIColor whiteColor];
    [IQKeyboardManager sharedManager].enable = YES; //开启
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO; //辅助键盘关闭
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    

      //[NSThread sleepForTimeInterval:3.0];//设置启动页面时间
    LXTabbarController *tabbarVc =[[LXTabbarController alloc]init];
    self.window.rootViewController = tabbarVc;
    
    self.window.backgroundColor =[UIColor whiteColor];
    
    
//    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil] instantiateViewControllerWithIdentifier:@"LaunchScreen"];
//    
//    UIView *launchView = viewController.view;
//    launchView.frame = self.window.frame;
//    
//    YYAnimatedImageView *imageView =[[YYAnimatedImageView alloc]initWithFrame:self.window.frame];
//    
//    
//    YYImage *image = [YYImage imageNamed:@"niconiconi"];
//    imageView.image = image;
//    [launchView addSubview:imageView];
//
//    //修改为加载到rootVC上
//    [self.window.rootViewController.view addSubview:launchView];
//    
//    [UIView animateWithDuration:1.0f delay:0.5f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
//        launchView.alpha = 0.0f;
//        launchView.layer.transform = CATransform3DScale(CATransform3DIdentity, 2.0f, 2.0f, 1.0f);
//    } completion:^(BOOL finished) {
//        
//        [launchView removeFromSuperview];
//        
//    }];
//       //初始化城市选择器数据
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        
//        [[CitiesDataTool sharedManager] requestGetData];
//    });
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
