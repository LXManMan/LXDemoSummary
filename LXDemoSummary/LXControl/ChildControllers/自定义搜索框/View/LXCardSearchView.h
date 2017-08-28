//
//  LXCardSearchView.h
//  LXCardSearch
//
//  Created by zhongzhi on 2017/8/16.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXCardSearchView : UIView
-(void)resetStatus;
@property(nonatomic,copy)void (^searchCompleteBlock)(NSString *text);//搜索完成的回调
@property(nonatomic,copy)void (^returnBlock)(); //左侧返回键
@property(nonatomic,copy)void (^selectBlock)(LxButton *button);//右侧文字为筛选的点击回调
@end
