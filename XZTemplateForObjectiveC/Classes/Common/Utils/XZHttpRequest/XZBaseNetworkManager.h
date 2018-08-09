//
//  XZBaseNetworkManager.h
//  XZTemplateForObjectiveC
//
//  Created by Nathan on 2018/8/9.
//  Copyright © 2018年 XiongZi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^XZSuccessBlock)(id responseObject);

typedef void (^XZFailureBlock)(NSError *error);

typedef void (^XZProgressBlock)(NSProgress *uploadProgress);

@interface XZBaseNetworkManager : NSObject

+ (void)getRequestWithURL:(NSString *)url
               parameters:(nullable NSDictionary *)parameters
               additional:(nullable NSDictionary *)additional
                  success:(nullable XZSuccessBlock)success
                  failure:(nullable XZFailureBlock)failure
               ;

+ (void)postRequestWithURL:(NSString *)url
                parameters:(nullable NSDictionary *)parameters
                additional:(nullable NSDictionary *)additional
                   success:(nullable XZSuccessBlock)success
                   failure:(nullable XZFailureBlock)failure;

+ (void)uploadDataWithURL:(NSString*)url
               parameters:(nullable NSDictionary *)parameters
               additional:(NSDictionary *)additional
                  success:(nullable XZSuccessBlock)success
                  failure:(nullable XZFailureBlock)failure
                 progress:(nullable XZProgressBlock)progress;

@end

NS_ASSUME_NONNULL_END
