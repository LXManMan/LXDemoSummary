//
//  LXCustomAlert.h
//  LXAlertview
//
//  Created by zhongzhi on 2017/6/22.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LXCustomAlert : UIView


@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;


@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *leftBtnTitle;
@property(nonatomic,copy)NSString *rightBtnTitle;

@end
