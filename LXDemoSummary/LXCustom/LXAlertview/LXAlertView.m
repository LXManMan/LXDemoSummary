//
//  LXAlertView.m
//  LXAlertview
//
//  Created by zhongzhi on 2017/6/22.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "LXAlertView.h"
#import "LXCustomAlert.h"
typedef void(^alertResult) (NSInteger index);
@interface LXAlertView ()
@property(nonatomic,strong)LXCustomAlert *customAlert;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *leftBtnTitle;
@property(nonatomic,copy)NSString *rightBtnTitle;
@property(nonatomic,copy)alertResult alertResult;

@end
@implementation LXAlertView

-(instancetype)initWithTitle:(NSString *)title leftBtnTitle:(NSString *)leftBtnTitle rightBtnTitle:(NSString *)rightBtnTitle alertResult:(void (^)(NSInteger index)) alertResult;{
    
    self = [super init];
    if (self) {
        
        self.frame = [UIScreen mainScreen].bounds;
    
        self.backgroundColor = [LXColor(98, 87, 56,1)colorWithAlphaComponent:0.9];
        
        
        self.title = title;
        
        self.leftBtnTitle = leftBtnTitle;
        
        self.rightBtnTitle = rightBtnTitle;
        
        self.alertResult = alertResult;
        
        [self setup];
    }
    return self;
    
}
-(void)showLXAlertView{
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    [keyWindow addSubview:self];
    
    [self creatShowAnimation];
}

-(void)setup{
    
    [self addSubview:self.customAlert];
    
    self.customAlert.title = self.title;
    
    self.customAlert.leftBtnTitle = self.leftBtnTitle;
    
    self.customAlert.rightBtnTitle = self.rightBtnTitle;
    
    self.customAlert.leftBtn.tag = 1;
    
    self.customAlert.rightBtn.tag = 2;
    
    [self.customAlert.leftBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.customAlert.rightBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
}


-(void)btnClick:(UIButton *)button
{
    
    
    if (self.alertResult) {
            
        
        [self dismiss];
                
        
        self.alertResult(button.tag);

 
    }
    [self removeFromSuperview];
}

- (void)creatShowAnimation
{
    
    self.customAlert.transform = CGAffineTransformMakeScale(0.90, 0.90);
    
    [UIView animateWithDuration:0.25 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
        
        self.customAlert.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
    } completion:^(BOOL finished) {
        
    }];
}
-(void)dismiss{
    self.customAlert.transform = CGAffineTransformMakeScale(1.0, 1.0);
    
    [UIView animateWithDuration:0.20 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
        
        self.customAlert.transform = CGAffineTransformMakeScale(0.0, 0.0);
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
    
}

-(LXCustomAlert *)customAlert{
    if (!_customAlert) {
        
        _customAlert =[[NSBundle mainBundle]loadNibNamed:@"LXCustomAlert" owner:self options:nil].firstObject;
        
        _customAlert.frame = CGRectMake(Device_Width/2 -140, (Device_Height -64 - 145)/2, 280, 145);
    }
    
    return _customAlert;
}
@end
