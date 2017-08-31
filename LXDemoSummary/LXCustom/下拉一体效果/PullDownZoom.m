//
//  PullDownZoom.m
//  PullDownZoomDemo
//
//  Created by 漫漫 on 2017/7/17.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "PullDownZoom.h"
#import "UIView+Frame.h"
@interface PullDownZoom()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *tableview;
@property(nonatomic,assign)CGFloat headerH;
@property(nonatomic,strong)UIView *header;
@end
@implementation PullDownZoom
-(instancetype)initWithTableview:(UIScrollView *)tableview headerH:(CGFloat)headerH header:(UIView *)header
{
    
    self = [super init];
    if (self) {
        self.tableview = tableview;
        
      
        self.tableview.delegate = self;
        self.headerH = headerH;
        self.header = header;
        
        self.tableview.contentInset = UIEdgeInsetsMake(self.headerH, 0, 0, 0);
    }
    return self;
}
-(void)scrollZoom{
    [self scrollViewDidScroll:self.tableview];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat y = scrollView.contentOffset.y;
    
    if ( y  < - self.headerH) {
        self.header.y  = y;
        self.header.height = -y;
        
    }
    
}
@end
