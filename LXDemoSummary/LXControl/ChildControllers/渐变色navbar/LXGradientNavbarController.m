//
//  LXGradientNavbarController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/8/28.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXGradientNavbarController.h"

@interface LXGradientNavbarController ()

@end

@implementation LXGradientNavbarController

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [LXGradientNavManager resStoreToDefaultNavigationBar];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"渐变色的导航栏";
    
    UIImage *image =[UIImage createGradientImageWithRect:CGRectMake(0, 0, Device_Width, 64) startColor:[UIColor hexStringToColor:@"#5F98FC"] endColor:[UIColor hexStringToColor:@"#f0f5f5"]];

    
    [LXGradientNavManager managerWithController:self];
    [LXGradientNavManager setOrignImage:image];
    
    [LXGradientNavManager setDefaultColor:LXMainColor];
    
    


}


@end
