
//
//  FTProgressView.m
//  ThatDemo
//
//  Created by zhongzhi on 2017/6/30.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "FTProgressView.h"
#import "UIColor+Expanded.h"
#define leftSpace 25
#define lineH 4
#define smallH 15
#define smallneiH 13
#define bigH 20
#define CGRect(f)  CGRectMake(leftSpace- f/2 + i * avaWidth, (height -f)/2, f, f)

@interface FTProgressView()
@property(nonatomic,assign)NSInteger statusNum;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)UIColor *color1;
@property(nonatomic,strong)UIColor *color2;

@end
@implementation FTProgressView

-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleArray = titleArray;
    }
    return self;
}
-(void)setIndex:(NSInteger)index{
    _index = index;
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect {
    CGFloat height = rect.size.height;
    CGFloat width = rect.size.width;

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, self.color1.CGColor);
    
    
    CGContextFillRect(context, CGRectMake(leftSpace, (height - lineH)/2, width-2 *leftSpace , lineH));
    [self drawCircle];
    
    [self drawLabel];
}
-(void)drawCircle
{
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
 
    CGFloat circleWidth = width - 2* leftSpace;
    CGFloat avaWidth = circleWidth /(self.titleArray.count -1);

    for (int i =0; i< self.titleArray.count; i++) {
        
        if (i == self.index) {

            [self FillPathWithRect:CGRect(bigH) fillColor:self.color1]; //绘制大圆
        }else{

            [self FillPathWithRect:CGRect(smallH) fillColor:self.color1];
            [self FillPathWithRect:CGRect(smallneiH) fillColor:self.color2];
        }
        
    }
    
}
-(void)FillPathWithRect:(CGRect) rect fillColor:(UIColor *)fillColor{
    
    CGContextRef context = UIGraphicsGetCurrentContext();

    
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    
    
    CGContextAddEllipseInRect(context, rect);
    
    CGContextFillPath(context);
    
    
}
-(void)drawLabel
{
    
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    
     CGFloat circleWidth = width - 2* leftSpace;
    
    CGFloat avaWidth = circleWidth /(self.titleArray.count -1);
    
    for (int i = 0; i<self.titleArray.count; i++) {
        
        NSAttributedString *attStr =[[NSAttributedString alloc]initWithString:self.titleArray[i] attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor hexStringToColor:@"3c3c3c"]}];
        
        if (i < self.index) {
            CGPoint point = CGPointMake(leftSpace +avaWidth *i-attStr.size.width/2, height/2 -bigH/2-1 -attStr.size.height);
            [attStr drawAtPoint:point];
        }else{
            CGPoint point = CGPointMake(leftSpace +avaWidth *i-attStr.size.width/2, height/2 +bigH/2+1);
            [attStr drawAtPoint:point];

        }
        
    }
}

-(UIColor *)color1{
    if (!_color1) {
        _color1 =[UIColor hexStringToColor:@"393d63"];
    }
    return _color1;
}
-(UIColor *)color2{
    if (!_color2) {
        _color2 =[UIColor hexStringToColor:@"ffffff"];
    }
    return _color2;
}
@end
