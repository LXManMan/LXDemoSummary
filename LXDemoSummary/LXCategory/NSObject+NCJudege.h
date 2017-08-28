//
//  NSObject+NCJudege.h
//  NatureCard
//
//  Created by zhongzhi on 2017/8/9.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NCJudege)
#pragma mark 判断手机号是否有效
- (BOOL)judgeValidMobile:(NSString *)mobile;

#pragma mark 判断密码是否有效
- (BOOL)judgeValidPass:(NSString *)passStr;

#pragma mark 判断邮箱是否有效

-(BOOL)judegeValidEmail:(NSString *)emailStr;


#pragma mark 判断是否是昵称
-(BOOL)judgeValidUserName:(NSString *)name;

#pragma mark 判断身份证是否有效
+ (BOOL) judgeValidIDCard: (NSString *)identityCard;


#pragma mark 判断字符串是否为空处理
-(NSString *)judgeNUll:(NSString *)string;

-(BOOL )checkforNULL:(NSString *)string;
@end
