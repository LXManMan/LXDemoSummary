
//
//  LXTabBar.m
//  LXDemoSummary
//
//  Created by chenergou on 2017/11/1.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXTabBar.h"
@interface LXTabBar()
@property(nonatomic,strong)LxButton *publishBtn;
@end
@implementation LXTabBar

-(void)layoutSubviews{

    [super layoutSubviews];
    
    CGFloat w = self.width/5.0;
    
    self.publishBtn.size = CGSizeMake(w, 70);
    
    self.publishBtn.centerX = self.width / 2;
    
    self.publishBtn.centerY = 12;
    
    [self addSubview:self.publishBtn];
    
    [self.publishBtn layoutButtonWithEdgeInsetsStyle:LXButtonEdgeInsetsStyleTop imageTitleSpace:5];
    //其他位置的按钮
    NSUInteger count =  self.subviews.count;
    
    for (NSUInteger i = 0,j  =0; i< count; i++) {
        UIView *view = self.subviews[i];
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {
            view.width = self.width/5.0;
            view.x = self.width *j /5.0;
            
            j ++;
            if (j == 2) {
                j ++;
            }
        }
        
    }
}

//重写hitTest方法，去监听发布按钮的点击，目的是为了让凸出的部分点击也有反应
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    //这一个判断是关键，不判断的话push到其他页面，点击发布按钮的位置也是会有反应的，这样就不好了
    //self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
    //在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在发布按钮身上
    //是的话让发布按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
    if (self.isHidden == NO) {
        //将当前tabbar的触摸点转换坐标系，转换到发布按钮的身上，生成一个新的点
        CGPoint newP = [self convertPoint:point toView:self.publishBtn];
         //判断如果这个新的点是在发布按钮身上，那么处理点击事件最合适的view就是发布按钮
        if ([self.publishBtn pointInside:newP withEvent:event]) {
            return self.publishBtn;
        }else{
            //如果点不在发布按钮身上，直接让系统处理就可以了
            
            return [super hitTest:point withEvent:event];
        }
    }else{
        //tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
        return [super hitTest:point withEvent:event];
    }
    
}
-(LxButton *)publishBtn{
    if (!_publishBtn) {
        _publishBtn =[LxButton LXButtonWithTitle:@"发布" titleFont:LXFont(13) Image:[UIImage imageNamed:@"tabar_plus_normal"] backgroundImage:nil backgroundColor:nil titleColor:[UIColor hexStringToColor:@"000000"] frame:CGRectZero];
        
        LXWS(weakSelf);
        [_publishBtn addClickBlock:^(UIButton *button) {
            
            if (weakSelf.didClickPublishBtn) {
                weakSelf.didClickPublishBtn();
            }
        }];
    }
    return _publishBtn;
}
@end
