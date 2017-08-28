//
//  NSMutableDictionary+NCSign.m
//  NatureCard
//
//  Created by zhongzhi on 2017/8/10.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "NSMutableDictionary+NCSign.h"
#import <CommonCrypto/CommonCrypto.h>
@implementation NSMutableDictionary (NCSign)
-(NSString *)signWithDic:(NSMutableDictionary *)dic{
    
    
    NSString *outPutStr =[self getNeedSignStrFrom:dic];
    
    return [self MD5ForUpper32Bate:outPutStr];
    
}

- (NSString *)getNeedSignStrFrom:(id)obj{
    NSDictionary *dict = obj;
    NSArray *arrPrimary = dict.allKeys;
    
    NSArray *arrKey = [arrPrimary sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        NSComparisonResult result = [obj1 compare:obj2 options:NSCaseInsensitiveSearch];
        return result==NSOrderedDescending;//NSOrderedAscending 倒序
    }];
    
    NSString*str =@"";
    
    for (NSString *s in arrKey) {
        id value = dict[s];
        if([value isKindOfClass:[NSDictionary class]]) {
            value = [self getNeedSignStrFrom:value];
        }
        if([str length] !=0) {
            
            str = [str stringByAppendingString:@"&"];
            
        }
        
        str = [str stringByAppendingFormat:@"%@=%@",s,value];
        
    }
    
    return [str stringByAppendingString:[NSString stringWithFormat:@"&key=%@", REquestKey]];
}
#pragma mark - MD5加密
-(NSString *)MD5ForUpper32Bate:(NSString *)str{
    
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    
    return digest;
}

@end
