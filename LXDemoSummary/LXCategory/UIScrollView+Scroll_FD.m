//
//  UIScrollView+Scroll_FD.m
//  LXDemoSummary
//
//  Created by zhongzhi on 2017/9/1.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "UIScrollView+Scroll_FD.h"

@implementation UIScrollView (Scroll_FD)
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (self.contentOffset.x <= 0) {
        if ([otherGestureRecognizer.delegate isKindOfClass:NSClassFromString(@"_FDFullscreenPopGestureRecognizerDelegate")]) {
            return YES;
        }
    }
    return NO;
}
@end
