//
//  LXGradientNavManager.m
//  LXGradientNavView
//
//  Created by zhongzhi on 2017/7/6.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "LXGradientNavManager.h"

@interface LXGradientNavManager()
@property (nonatomic, strong) UINavigationBar *selfNavigationBar;
@property (nonatomic, strong) UINavigationController *selfNavigationController;
@end
@implementation LXGradientNavManager
+(LXGradientNavManager *)sharedManager{
    
    static LXGradientNavManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LXGradientNavManager alloc]init];
    });
    return manager;
}

+(void)managerWithController:(UIViewController *)viewController{
    
    if (viewController.navigationController) {
        UINavigationBar *navigationBar = viewController.navigationController.navigationBar;
        [self sharedManager].selfNavigationBar = navigationBar;
        [self sharedManager].selfNavigationController = viewController.navigationController;
        [navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [navigationBar setShadowImage:[UIImage new]];
    }
}

+(void)dealGradientWithScrollView:(UIScrollView *)scrollView{
    CGFloat y = scrollView.contentOffset.y;
    
    UIColor *defaultColor = [self sharedManager].defaultColor;

    if (y > [self sharedManager].fullAlphaOffset) {
        UIImage *image =[self imageWithColor:defaultColor];

        [[self sharedManager].selfNavigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }else{
        CGFloat alpha = y /[self sharedManager].fullAlphaOffset;
        
        UIImage *image =[self imageWithColor: [defaultColor colorWithAlphaComponent:alpha]];
        [[self sharedManager].selfNavigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        [[self sharedManager].selfNavigationBar setShadowImage:image];
    }

}

+ (void)reStoreToSystemNavigationBar {
    [[self sharedManager].selfNavigationController setValue:[UINavigationBar new] forKey:@"navigationBar"];
}
+ (void)resStoreToDefaultNavigationBar{
    UIImage *image =[self imageWithColor:[self sharedManager].defaultColor];

    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName] = [UIColor hexStringToColor:@"3c3c3c"];
    
    [[self sharedManager].selfNavigationBar setTitleTextAttributes:attributes];
    [[self sharedManager].selfNavigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}
+(void)resStoreToTransluent{
    [[self sharedManager].selfNavigationBar setTranslucent:YES];
}
+(void)resStoreToNoTransluent{
    [[self sharedManager].selfNavigationBar setTranslucent:NO];

}
+(void)setZeroAlphaOffset:(float)offset{
    [self sharedManager].zeroAlphaOffset = offset;
    
}
+(void)setFullAlphaOffset:(float)offset{
    [self sharedManager].fullAlphaOffset = offset;
}
+(void)setDefaultColor:(UIColor *)color{
    [self sharedManager].defaultColor = color;
    
   
    
}
+(void)setOrignColor:(UIColor *)color{
    [self sharedManager].orignColor = color;
    
    [[self sharedManager].selfNavigationBar setBackgroundImage:[self imageWithColor:color] forBarMetrics:UIBarMetricsDefault];
    

    
}

+(void)setNavTitleColor:(UIColor *)color{
    [self sharedManager].titleColor = color;
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName] = color;

    [[self sharedManager].selfNavigationBar setTitleTextAttributes:attributes];

    

}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage *imgae = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imgae;
}

@end
