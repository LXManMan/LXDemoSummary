//
//  NextController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/9/2.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "NextController.h"

@interface NextController ()

@end

@implementation NextController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    YYAnimatedImageView *imageView =[[YYAnimatedImageView alloc]initWithFrame:CGRectMake(50, 100, 240, 135)];
    
    
    YYImage *image = [YYImage imageNamed:@"niconiconi"];
    imageView.image = image;
    [self.view addSubview:imageView];
}




@end
