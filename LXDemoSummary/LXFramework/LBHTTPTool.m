//
//  LBHTTPTool.m
//  hah
//
//  Created by chuanglong02 on 16/5/11.
//  Copyright © 2016年 chuanglong02. All rights reserved.
//

#import "LBHTTPTool.h"
#import <AFNetworking.h>
#define TIMEINTERVAL 30
@implementation LBHTTPTool
/**
 *  普通的GET
 *
 *  @param URLString  <#URLString description#>
 *  @param parameters <#parameters description#>
 *  @param sucess     <#sucess description#>
 *  @param failure    <#failure description#>
 */
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    manger.requestSerializer.timeoutInterval = TIMEINTERVAL;
//    manger.securityPolicy = [self getSecurityPolicy];
//    [manger.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
//    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"application/x-gzip", nil];
    [manger GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //如果请求成功的话将responseObject保存在sucess Block中
        id objc = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (success)
        {
            success(objc);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if(failure)
        {
            failure(error);
        }
        
    }];
    
}




/**
 *  带进度条的GET
 *
 *  @param url      <#url description#>
 *  @param params   <#params description#>
 *  @param progress <#progress description#>
 *  @param success  <#success description#>
 *  @param failure  <#failure description#>
 */
+(void)get:(NSString *)url params:(NSDictionary *)param progress:(void (^)(NSProgress *))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manger =[AFHTTPSessionManager manager];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    manger.requestSerializer.timeoutInterval = TIMEINTERVAL;
//    manger.securityPolicy = [self getSecurityPolicy];
    [manger GET:url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        id objc = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        if (responseObject) {
            if (success) {
                success(objc);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];

}
/**
 *  普通 POST
 *
 *  @param url     <#url description#>
 *  @param params  <#params description#>
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
+(void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manger =[AFHTTPSessionManager manager];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manger.requestSerializer = [AFJSONRequestSerializer serializer];
    manger.requestSerializer.timeoutInterval = TIMEINTERVAL;
//    manger.securityPolicy = [self getSecurityPolicy];
//       manger.requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithArray:@[@"POST", @"GET", @"HEAD"]];
    [manger POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id objc = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        if (responseObject) {
            if (success) {
                success(objc);
            }
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }

    }];
}
/**
 *  带 进度条 POST
 */
+(void)post:(NSString *)url params:(NSDictionary *)params progress:(void (^)(NSProgress *))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manger =[AFHTTPSessionManager manager];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    manger.requestSerializer.timeoutInterval = TIMEINTERVAL;
//    manger.securityPolicy = [self getSecurityPolicy];
    [manger POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        progress (uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id objc = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        if (responseObject) {
            if (success) {
                success(objc);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
/**
 *  上传文件
 */
+(void)post:(NSString *)url params:(NSDictionary *)params formData:(NSArray<NSData *> *)dataArray progress:(void (^)(NSProgress *))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manger =[AFHTTPSessionManager manager];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    manger.requestSerializer.timeoutInterval = TIMEINTERVAL;
//    manger.securityPolicy = [self getSecurityPolicy];
    [manger POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
       
       
       if (dataArray.count>0) {
           for (NSInteger i=0; i<dataArray.count; i++) {
               NSData *eachData = dataArray[i];
               [formData appendPartWithFileData:eachData name:@"file" fileName:[NSString stringWithFormat:@"img%ld.jpg", (long)(i+1)] mimeType:@"image/jpeg"];
           }
       }

   } progress:^(NSProgress * _Nonnull uploadProgress) {
       progress(uploadProgress);
   } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       id objc = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
       if (responseObject) {
           if (success) {
               success(objc);
           }
       }
   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       if (failure) {
           failure(error);
       }
   }];
}

#pragma mark - 数据请求 get 方式
+ (void)getDataSourceWithUrl:(NSString *)url params:(NSDictionary *)params contentType:(NSString *)info cookie:(NSHTTPCookie *)cookie success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:info, nil];
//        manager.securityPolicy = [self getSecurityPolicy];
        [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            // 进度
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    success(responseObject);
                });
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                failure(error);
            }
        }];
    });
}

#pragma mark - 数据请求 post 方式
+ (void)postDataSourceWithUrl:(NSString *)url params:(NSDictionary *)params contentType:(NSString *)info success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:info, nil];
//        manager.securityPolicy = [self getSecurityPolicy];
        [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            // 进度
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    success(responseObject);
                });
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                failure(error);
            }
        }];
    });
}

#pragma mark - 上传图片
+ (void)postDataSourceWithUrl:(NSString *)url params:(NSDictionary *)params contentType:(NSString *)info formData:(NSData *)imageData progress:(void (^)(NSProgress *))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:info, nil];
//        manager.securityPolicy = [self getSecurityPolicy];
        [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
            [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/png"];
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            // 进度
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    success(responseObject);
                });
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                failure(error);
            }
        }];
    });
}

#pragma mark - 证书
+ (AFSecurityPolicy *)getSecurityPolicy {
    NSString *certFilePath = [[NSBundle mainBundle] pathForResource:@"ca" ofType:@"cer"];
    NSData *certData = [NSData dataWithContentsOfFile:certFilePath];
    NSSet *certSet = [NSSet setWithObject:certData];
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:certSet];
    policy.allowInvalidCertificates = YES;
    policy.validatesDomainName = NO;
    return policy;
}

@end
