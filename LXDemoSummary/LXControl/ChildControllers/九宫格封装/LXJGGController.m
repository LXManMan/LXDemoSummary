
//
//  LXJGGController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/9/4.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXJGGController.h"
#import "JiuGGView.h"
@interface LXJGGController ()
@property(nonatomic,strong)JiuGGView *ggView;
@end

@implementation LXJGGController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.ggView =[[JiuGGView alloc]initWithFrame:CGRectMake(0, NAVH, Device_Width, Device_Height)];
    [self.view addSubview:self.ggView];
    
}



@end
