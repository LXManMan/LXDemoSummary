//
//  NSObject+NCJudege.m
//  NatureCard
//
//  Created by zhongzhi on 2017/8/9.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "NSObject+NCJudege.h"

@implementation NSObject (NCJudege)
#pragma mark - 判断手机号是否有效
- (BOOL)judgeValidMobile:(NSString *)mobile {
    if ([self checkforNULL:mobile]) {
        return NO;
    }
    if (mobile.length != 11) {
        return NO;
    } else {
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        } else {
            return NO;
        }
    }
}

-(BOOL)judegeValidEmail:(NSString *)emailStr{
    
    if (emailStr.length <=0) {
        return NO;
    }
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}

-(BOOL)judgeValidUserName:(NSString *)name {
    if (name.length <=0) {
        return NO;
    }
    
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    
    return [passWordPredicate evaluateWithObject:name];
 
  
}

+ (BOOL) judgeValidIDCard: (NSString *)identityCard {
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    
    return [identityCardPredicate evaluateWithObject:identityCard];
}


-(BOOL )checkforNULL:(NSString *)string{
    if (!string.length || string == nil || string == NULL || (NSNull *)string == [NSNull null] || [string isKindOfClass:[NSNull class]] || [string isEqualToString:@"(null)"] || [string isEqualToString:@"<null>"] || [string isEqualToString:@"null"] || [string isEqualToString:@"NULL"] ) {
        
        return YES;
    }else {
        return NO;
    }
    
    
}
- (BOOL)judgeValidPass:(NSString *)passStr{
    
    if ([self checkforNULL:passStr]) {
        return NO;
    }
    if (passStr.length <6 || passStr.length >18) {
        return NO;
    }
    if ([self inputShouldLetterOrNum:passStr]) {
        return YES;
    }
    return NO;
}
-(NSString *)judgeNUll:(NSString *)string{
    
    if ([string isKindOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"%@",(NSNumber *)string];
    }
    
    if (!string.length || string == nil || string == NULL || (NSNull *)string == [NSNull null] || [string isKindOfClass:[NSNull class]] || [string isEqualToString:@"(null)"] || [string isEqualToString:@"<null>"] || [string isEqualToString:@"null"] || [string isEqualToString:@"NULL"]) {
        string = @"";
        return string;
    }
    return string;
    
}
//判断仅输入字母或数字
-(BOOL)inputShouldLetterOrNum:(NSString *)inputString {
    
    NSString *regex =@"[a-zA-Z0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:inputString];
}

@end
