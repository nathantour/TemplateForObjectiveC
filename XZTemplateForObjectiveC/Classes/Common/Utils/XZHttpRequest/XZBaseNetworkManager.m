//
//  XZBaseNetworkManager.m
//  XZTemplateForObjectiveC
//
//  Created by Nathan on 2018/8/9.
//  Copyright © 2018年 XiongZi. All rights reserved.
//

#import "XZBaseNetworkManager.h"

@implementation XZBaseNetworkManager

+ (AFHTTPSessionManager *)sessionManager
{
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    sessionManager.requestSerializer.timeoutInterval = 20.0f;
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",@"text/html",@"text/json",@"text/plain",@"text/javascript",@"text/xml",@"image/*"]];
    ((AFJSONResponseSerializer*)sessionManager.responseSerializer).removesKeysWithNullValues = YES;
    return sessionManager;
}

+ (void)getRequestWithURL:(NSString *)url
               parameters:(nullable NSDictionary *)parameters
               additional:(nullable NSDictionary *)additional
                  success:(nullable XZSuccessBlock)success
                  failure:(nullable XZFailureBlock)failure
{
    AFHTTPSessionManager *manager = [XZBaseNetworkManager sessionManager];
    
    [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        ;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            if (failure) {
                failure(error);
            }
        }
    }];
}

+ (void)postRequestWithURL:(NSString *)url
                parameters:(nullable NSDictionary *)parameters
                additional:(nullable NSDictionary *)additional
                   success:(nullable XZSuccessBlock)success
                   failure:(nullable XZFailureBlock)failure
{
    AFHTTPSessionManager *manager = [XZBaseNetworkManager sessionManager];
    
    if ([additional isKindOfClass:[NSDictionary class]]) {
        NSNumber *timeout = additional[@"timeout"];
        if ([timeout isKindOfClass:[NSNumber class]]) {
            manager.requestSerializer.timeoutInterval = timeout.floatValue;
        }
    }
    
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        ;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            if (failure) {
                failure(error);
            }
        }
    }];
}

+ (void)uploadDataWithURL:(NSString*)url
               parameters:(nullable NSDictionary *)parameters
               additional:(NSDictionary *)additional
                  success:(nullable XZSuccessBlock)success
                  failure:(nullable XZFailureBlock)failure
                 progress:(nullable XZProgressBlock)progress
{
    AFHTTPSessionManager *manager = [XZBaseNetworkManager sessionManager];
    
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if ([additional isKindOfClass:[NSDictionary class]]) {
            [formData appendPartWithFileData:additional[@"fileData"]
                                        name:additional[@"name"]
                                    fileName:additional[@"fileName"]
                                    mimeType:additional[@"mimeType"]];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            if (failure) {
                failure(error);
            }
        }
    }];
}


@end
