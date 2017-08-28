//
//  LXCustomPSController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/8/24.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXCustomPSController.h"
#import "QGPassWordTextField.h"

@interface LXCustomPSController ()
@property (nonatomic, strong)QGPassWordTextField * passText;

@end

@implementation LXCustomPSController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"自定义键盘";
    [self.view addSubview:self.passText];

}

-(QGPassWordTextField *)passText{
    if (!_passText) {
        _passText =[[QGPassWordTextField alloc]initWithFrame:CGRectMake(40, 300 +20, Device_Width - 80, 56)];
        _passText.passWordCount = 6;
    }
    return _passText;
}

@end
