//
//  LXCustomAlert.m
//  LXAlertview
//
//  Created by zhongzhi on 2017/6/22.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "LXCustomAlert.h"
@interface LXCustomAlert()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end
@implementation LXCustomAlert

-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    
    self.titleLabel.font =[UIFont boldSystemFontOfSize:17];
}
-(void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = title;
}
-(void)setLeftBtnTitle:(NSString *)leftBtnTitle{
    _leftBtnTitle = leftBtnTitle;
    [self.leftBtn setTitle:_leftBtnTitle forState:UIControlStateNormal];
}
-(void)setRightBtnTitle:(NSString *)rightBtnTitle{
    _rightBtnTitle = rightBtnTitle;
    [self.rightBtn setTitle:_rightBtnTitle forState:UIControlStateNormal];
}
@end
