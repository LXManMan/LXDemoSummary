//
//  LXAlertView.h
//  LXAlertview
//
//  Created by zhongzhi on 2017/6/22.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXAlertView : UIView
-(instancetype)initWithTitle:(NSString *)title
                leftBtnTitle:(NSString *)leftBtnTitle
                 rightBtnTitle:(NSString *)rightBtnTitle
                 alertResult:(void (^)(NSInteger index)) alertResult;


-(void)showLXAlertView;
@end
