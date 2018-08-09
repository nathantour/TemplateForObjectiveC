//
//  XZNetworkManager.m
//  XZTemplateForObjectiveC
//
//  Created by Nathan on 2018/8/9.
//  Copyright © 2018年 XiongZi. All rights reserved.
//

#import "XZNetworkManager.h"

@implementation XZNetworkManager

/**
 POST 请求
 */
+ (void)postRequestWithRequestType:(XZRequestType)requestType
                        parameters:(nullable NSDictionary *)parameters
                        additional:(nullable NSDictionary *)additional
                           success:(nullable XZSuccessBlock)success
                           failure:(nullable XZFailureBlock)failure
{
    parameters = [XZNetworkManager postDataWithRequestType:requestType parameters:parameters];
    
    
    [XZBaseNetworkManager postRequestWithURL:[XZNetworkManager serverURL:nil]
                                  parameters:parameters
                                  additional:additional
                                     success:^(id  _Nonnull responseObject) {
                                         if (success) {
                                             success(responseObject);
                                         }
                                     }
                                     failure:^(NSError * _Nonnull error) {
                                         if (failure) {
                                             failure(error);
                                         }
                                     }];
}

/**
 上传图片
 */
+ (void)uploadDataWithRequestType:(XZRequestType)requestType
                       parameters:(nullable NSDictionary *)parameters
                       additional:(NSDictionary *)additional
                          success:(nullable XZSuccessBlock)success
                          failure:(nullable XZFailureBlock)failure
                         progress:(nullable XZProgressBlock)progress
{
    parameters = [XZNetworkManager postDataWithRequestType:requestType parameters:parameters];
    
    [XZBaseNetworkManager uploadDataWithURL:[XZNetworkManager uploadImageServerURL:nil]
                                 parameters:parameters
                                 additional:additional
                                    success:^(id  _Nonnull responseObject) {
                                        if (success) {
                                            success(responseObject);
                                        }
                                    }
                                    failure:^(NSError * _Nonnull error) {
                                        if (failure) {
                                            failure(error);
                                        }
                                    }
                                   progress:^(NSProgress * _Nonnull uploadProgress) {
                                       if (progress) {
                                           progress(uploadProgress);
                                       }
                                   }];
}

/**
 传递的参数
 */
+ (NSDictionary *)postDataWithRequestType:(XZRequestType)requestType
                               parameters:(nullable NSDictionary *)parameters
{
    NSDictionary *fliterParameters = [XZNetworkManager removeEmptyStringFromDictionary:parameters];
    
    return fliterParameters;
}

/**
 过滤字典里面的空字符串
 */
+ (NSDictionary *)removeEmptyStringFromDictionary:(NSDictionary *)dictionary
{
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dictionary];
    NSArray *keys = [mutableDictionary allKeys];
    for (NSString *key in keys) {
        id obj = mutableDictionary[key];
        if ([obj isKindOfClass:[NSString class]]) {
            NSString *value = obj;
            if (value.length == 0) {
                [mutableDictionary removeObjectForKey:key];
            }
        }
    }
    return [NSDictionary dictionaryWithDictionary:mutableDictionary];
}

/**
 服务器URL
 */
+ (NSString *)serverURL:(NSString *)url
{
    if (url) {
        return url;
    }
    return [kBaseURL stringByAppendingString:@"/xxxx"];
}

/**
 上传图片的服务器URL
 */
+ (NSString *)uploadImageServerURL:(NSString *)url
{
    if (url) {
        return url;
    }
    return [kBaseURL stringByAppendingString:@"/uploadImage"];
}


@end
