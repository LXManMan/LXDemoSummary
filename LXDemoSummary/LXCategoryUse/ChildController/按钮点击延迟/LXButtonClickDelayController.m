
//
//  LXButtonClickDelayController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/9/8.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXButtonClickDelayController.h"

@interface LXButtonClickDelayController ()

@end

@implementation LXButtonClickDelayController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"按钮点击延迟设置";
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点我" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    button.backgroundColor = [UIColor hexStringToColor:@"ff8833"];
    button.frame = CGRectMake(50, 80, 100, 40);
    [self.view addSubview:button];
    [button setDelayInterval:2];
    button.isNeedDelay =YES;
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)btnClick{
    NSLog(@"%@",[NSString getNowTime]);
}


@end
