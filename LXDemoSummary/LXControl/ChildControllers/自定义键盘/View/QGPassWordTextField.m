//
//  PassWord.m
//  PayPassWord
//
//  Created by mac on 16/1/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QGPassWordTextField.h"

@implementation QGPassWordTextField

static NSString * tempStr;

-(void)setNil{
    self.text = @"";
    [self passWordDidChange:self];
}
- (void)drawRect:(CGRect)rect {

    /** 计算坐标 */
    CGFloat y = 0;
    CGFloat width = rect.size.width / self.passWordCount;
    CGFloat height = width;
    CGFloat margin = 22;
    
    /** 创建存储坐标的数组 */
    NSMutableArray <NSValue *>*frameArr = [NSMutableArray array];
    
    /** 开启位图上下文 循环并绘制竖线*/
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (int i = 0; i < self.passWordCount; i++) {
        [LXMainColor set];
        CGContextAddRect(context, CGRectMake(i * (width), y, width, height));
        [frameArr addObject:[NSValue valueWithCGRect:CGRectMake(i * (width) + margin, y + margin, width - 2 * margin, height - 2 * margin)]];
        }
        CGContextStrokePath(context);
    
     /** 监听文字变化 */
    [self addTarget:self action:@selector(passWordDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    /** 监听文字个数变化,并且循环并绘制实心圆 */
    if (self.text.length) {
        for (int i = 0; i < self.text.length; i++) {
            [LXMainColor set];
            CGContextFillEllipseInRect(context, [frameArr[i] CGRectValue]);

        }
    }else{
        return;
    }
    
}
/** 监听文字的变化 */
- (void)passWordDidChange:(UITextField *)sender{
    if (sender.text.length > self.passWordCount) {
        NSRange range = NSMakeRange(0, self.passWordCount);
        sender.text = [sender.text substringWithRange:range];
    }
    [self setNeedsDisplay];
}
#pragma mark - 重写的方法
 /** 重写 setPlaceholder 方法 防止出现 placeHolder*/
-(void)setPlaceholder:(NSString *)placeholder{
}

 /** 重写 initWithFrame 方法 防止出现光标*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tintColor = [UIColor clearColor];
        self.textColor = [UIColor clearColor];
        self.keyboardType = UIKeyboardTypeNumberPad;
        self.passWordCount = 6;

    }
    return self;
}
/** 重写文字颜色方法 让文字永远是透明色 */
-(void)setTextColor:(UIColor *)textColor{
    textColor = [UIColor clearColor];
    [super setTextColor:textColor];
}

/** 重写光标的颜色方法  让光标永远是透明色 */
-(void)setTintColor:(UIColor *)tintColor{
    tintColor = [UIColor clearColor];
    [super setTintColor:tintColor];
}
/** 禁用复制粘贴的功能 */
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    return NO;
}

/** 重写键盘类型 */
-(void)setKeyboardType:(UIKeyboardType)keyboardType{
    keyboardType = UIKeyboardTypeNumberPad;
    [super setKeyboardType:keyboardType];
}

@end
