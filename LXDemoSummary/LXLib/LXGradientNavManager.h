//
//  LXGradientNavManager.h
//  LXGradientNavView
//
//  Created by zhongzhi on 2017/7/6.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LXGradientNavManager : NSObject
@property(nonatomic,strong)UIColor *defaultColor; //默认的Nav的颜色
@property(nonatomic,strong)UIImage *orignImage; //开始的的Nav的背景图

@property(nonatomic,strong)UIColor *orignColor; //最开始的颜色
@property(nonatomic,strong)UIColor *titleColor; //最开始的颜色
@property(nonatomic,assign)float zeroAlphaOffset;

@property (nonatomic, assign) float fullAlphaOffset;

+(void)setOrignColor:(UIColor *)color; //开始的颜色

+ (void)setDefaultColor:(UIColor *)color; //默认的颜色

+ (void)setOrignImage:(UIImage *)orignImage; //开始的图片


+ (void)setZeroAlphaOffset:(float)offset;

+ (void)setFullAlphaOffset:(float)offset;

+(void)setNavTitleColor:(UIColor *)color; //navbar 文字的颜色


+(void)managerWithController:(UIViewController *)viewController;

+(void)dealGradientWithScrollView:(UIScrollView *)scrollView;

+(void)reStoreToSystemNavigationBar; //change the navigationBar to system style

+(void)resStoreToDefaultNavigationBar; //恢复到默认的navbar

+(void)resStoreToTransluent; //恢复到默认的透明
+(void)resStoreToNoTransluent; //恢复到bu透明
@end
