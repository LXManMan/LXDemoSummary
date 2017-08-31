//
//  PullDownZoom.h
//  PullDownZoomDemo
//
//  Created by 漫漫 on 2017/7/17.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PullDownZoom : NSObject
-(instancetype)initWithTableview:(UIScrollView *)tableview headerH:(CGFloat)headerH header:(UIView *)header;

-(void)scrollZoom;
@end
