//
//  LXBasicController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/8/24.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXBasicController.h"

@interface LXBasicController ()

@end

@implementation LXBasicController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
    self.slider =[[UISlider alloc]initWithFrame:CGRectMake(50, self.view.frame.size.height - 100, self.view.frame.size.width -100, 30)];
    [self.slider setMaximumValue:1.0];
    [self.slider setMinimumValue:0.0];
    //    self.slider.value = 0.5;
    self.slider.hidden = YES;
    [self.view addSubview:self.slider];
    self.view.backgroundColor =[UIColor whiteColor];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
