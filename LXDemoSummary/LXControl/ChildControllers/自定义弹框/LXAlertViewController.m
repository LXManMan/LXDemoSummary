//
//  LXAlertViewController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/8/24.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXAlertViewController.h"
@interface LXAlertViewController ()

@end

@implementation LXAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"自定义弹框";
    LXAlertView *alertView =[[LXAlertView alloc]initWithTitle:@"马上充值？" leftBtnTitle:@"先不充值" rightBtnTitle:@"充值" alertResult:^(NSInteger index) {
        
        LXWS(weakSelf);
        if (index ==2) {
            UIViewController *nextVc =[[UIViewController alloc]init];
            nextVc.view.backgroundColor =[UIColor cyanColor];
            [weakSelf.navigationController pushViewController:nextVc animated:YES];
        }
    }];
    [alertView showLXAlertView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
