//
//  LBHTTPTool.h
//  hah
//
//  Created by chuanglong02 on 16/5/11.
//  Copyright © 2016年 chuanglong02. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBHTTPTool : NSObject
/**
 *  发送一个普通GET请求
 *
 *  @param url     请求URL
 *  @param params  参数
 *  @param value   是否是Https接口
 *  @param success 成功后的回调
 *  @param failure 失败后的回调
 */
+ (void)get:( NSString *)url params:(NSDictionary *)params  success:(void (^)(id  responseObject))success failure:(void (^)(NSError *error))failure;


/**
 *  发送一个有进度条GET请求
 *
 *  @param url     请求URL
 *  @param params  参数
 *  @param value   是否是Https接口
 *  @param progress 请求进度的回调
 *  @param success 成功后的回调
 *  @param failure 失败后的回调
 */
+ (void)get:(NSString *)url params:(NSDictionary *)params  progress:(void (^)(NSProgress *downloadProgress))progress success:( void (^)(id  responseObject))success failure:(void (^)(NSError *error))failure;


/**
 *  发送一个普通POST请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param value   是否是Https接口
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)post:(NSString *)url params:(NSDictionary *)params  success:( void (^)(id  responseObject))success failure:(void (^)(NSError *error))failure;

/**
 *  发送一个有进度条POST请求
 *
 *  @param url     请求URL
 *  @param params  参数
 *  @param value   是否是Https接口
 *  @param progress 请求进度的回调
 *  @param success 成功后的回调
 *  @param failure 失败后的回调
 */
+ (void)post:(NSString *)url params:(NSDictionary *)params  progress:(void (^)(NSProgress *downloadProgress))progress success:( void (^)(id  responseObject))success failure:(void (^)(NSError *error))failure;


/**
 *  上传文件图片
 *
 *  @param url
 *  @param params 参数
 *  @param formData 图片已NSData形式上传
 *  @param value    value description
 *  @param progress progress description
 *  @param success  success description
 *  @param failure
 */
+ (void)post:(NSString *)url params:(NSDictionary *)params formData:(NSArray<NSData *> *)dataArray  progress:(void (^)(NSProgress *downloadProgress))progress success:( void (^)(id  responseObject))success failure:(void (^)(NSError *error))failure;

/**
 *  数据请求 get 方式
 */
+ (void)getDataSourceWithUrl:(NSString *)url params:(NSDictionary *)params contentType:(NSString *)info cookie:(NSHTTPCookie *)cookie success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
/**
 *  数据请求 post 方式
 */
+ (void)postDataSourceWithUrl:(NSString *)url params:(NSDictionary *)params contentType:(NSString *)info success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
/**
 *  上传图片
 */
+ (void)postDataSourceWithUrl:(NSString *)url params:(NSDictionary *)params contentType:(NSString *)info formData:(NSData *)imageData progress:(void (^)(NSProgress *downloadProgress))progress success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end

