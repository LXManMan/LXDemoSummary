//
//  FTProgressView.h
//  ThatDemo
//
//  Created by zhongzhi on 2017/6/30.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTProgressView : UIView
@property(nonatomic,assign)NSInteger index; //确定哪个状态
-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray;

@end
