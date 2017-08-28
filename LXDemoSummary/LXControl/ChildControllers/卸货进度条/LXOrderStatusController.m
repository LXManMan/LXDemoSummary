//
//  LXOrderStatusController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/8/25.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXOrderStatusController.h"
#import "FTProgressView.h"
@interface LXOrderStatusController ()
@property(nonatomic,strong)FTProgressView *progressView;

@end

@implementation LXOrderStatusController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"卸货进度条";

    
    self.progressView =[[FTProgressView alloc]initWithFrame:CGRectMake(0, 100, Device_Width, 62) titleArray:@[@"已接单",@"已装货",@"运输中",@"已卸货",@"已完成"]];
    self.progressView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.progressView];
    
    self.progressView.index = 2;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.progressView.index = arc4random()%5;
    NSLog(@"%ld",self.progressView.index);
}

@end
