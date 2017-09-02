//
//  LabelTapController.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/8/31.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LabelTapController.h"
#import "NextController.h"
@interface LabelTapController ()

@end

@implementation LabelTapController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"文字部分点击";
    UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(20, 100, 150, 100)];
    NSString *string = @"需要可阅读简介详情";
    NSMutableAttributedString *attribute =[[NSMutableAttributedString alloc]initWithString:string attributes:@{NSFontAttributeName:LXFont(15),NSForegroundColorAttributeName:[UIColor blackColor
                                                                                                                                                                        ]}];
    NSRange range = [string rangeOfString:@"简介详情"];
    if (range.location != NSNotFound ) {
        
        [attribute setAttributes:@{NSFontAttributeName:LXFont(15),NSForegroundColorAttributeName:[UIColor greenColor]} range:range];
    }
    
    label.attributedText = attribute;
    [self.view addSubview:label];
    
    
    [label yb_addAttributeTapActionWithStrings:@[@"简介详情"] tapClicked:^(NSString *string, NSRange range, NSInteger index) {
        NSLog(@"点击了%@",string);
        NextController *nextVc =[[NextController alloc]init];
        [self.navigationController pushViewController:nextVc animated:YES];
    }];
    
}



@end
