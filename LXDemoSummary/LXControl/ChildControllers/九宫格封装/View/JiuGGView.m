
//
//  JiuGGView.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/9/4.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "JiuGGView.h"

@implementation JiuGGView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setup];
    }
    return self;
}
-(void)setup{
    
    CGFloat W = 80;
    CGFloat H = 100;
    //每行列数
    NSInteger rank = 4;
    //每列间距
    CGFloat rankMargin = (self.width - rank * W) / (rank - 1);
    //每行间距
    CGFloat rowMargin = 20;
    //Item索引 ->根据需求改变索引
    NSUInteger index = 9;
    
    for (int i = 0 ; i< index; i++) {
        //Item X轴
        CGFloat X = (i % rank) * (W + rankMargin);
        //Item Y轴
        NSUInteger Y = (i / rank) * (H +rowMargin);
        //Item top
        CGFloat top = 0;
        UIView *speedView = [[UIView alloc] init];
        speedView.backgroundColor = LXRandomColor;
        speedView.frame = CGRectMake(X, Y+top, W, H);
        [self addSubview:speedView];
    }
}

@end
