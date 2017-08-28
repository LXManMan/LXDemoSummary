//
//  LXDropViewController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/8/24.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXDropViewController.h"
#import "LXDropView.h"

@interface LXDropViewController ()
@property(nonatomic,strong)LXDropView *dropView;
@property(nonatomic,strong)UIView *tempView;
@end

@implementation LXDropViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.navigationItem.title = @"任意点下拉弹框";
    
    self.tempView =[[UIView alloc]initWithFrame:CGRectMake(50, 100, Device_Width -100, 400)];
    self.tempView.backgroundColor =[UIColor cyanColor];
    [self.view addSubview:self.tempView];

    LxButton *button = [LxButton LXButtonWithTitle:@"请选择车牌号" titleFont:LXFont(14) Image:nil backgroundImage:nil backgroundColor:[UIColor lightGrayColor] titleColor:[UIColor blackColor] frame:CGRectMake(20, self.tempView.height/2 - 20, 100, 40)];
   
    [self.tempView addSubview:button];
    
    
    UIWindow *window =[UIApplication sharedApplication].delegate.window;
    
    CGPoint  point = [window convertPoint:CGPointMake(button.frame.origin.x, button.frame.origin.y+ button.frame.size.height) fromView:self.tempView];
    
    self.dropView =[[LXDropView alloc]initWithTitleArray:@[@"陕A 00805003",@"陕B 00805003",@"陕C 00805003"] orignPoint:point listWidth:Device_Width/2 selectResult:^(NSInteger index) {
        
    }];
    
    LXWS(weakSelf);
    [button addClickBlock:^(UIButton *button) {
        [weakSelf.dropView show];
    }];
    
}



@end
