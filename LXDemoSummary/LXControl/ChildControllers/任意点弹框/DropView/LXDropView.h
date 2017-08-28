//
//  LXDropView.h
//  NCDropView
//
//  Created by zhongzhi on 2017/7/14.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXDropView : UIView


-(instancetype)initWithTitleArray:(NSArray *)titleA orignPoint:(CGPoint)orginPoint listWidth:(CGFloat)listWidth selectResult:(void (^)(NSInteger index))selectResult;
-(void)show;
@end
