//
//  XZNetworkManager.h
//  XZTemplateForObjectiveC
//
//  Created by Nathan on 2018/8/9.
//  Copyright © 2018年 XiongZi. All rights reserved.
//

#import "XZBaseNetworkManager.h"
#import "XZHttpDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface XZNetworkManager : XZBaseNetworkManager

+ (void)postRequestWithRequestType:(XZRequestType)requestType
                        parameters:(nullable NSDictionary *)parameters
                        additional:(nullable NSDictionary *)additional
                           success:(nullable XZSuccessBlock)success
                           failure:(nullable XZFailureBlock)failure;

+ (void)uploadDataWithRequestType:(XZRequestType)requestType
                       parameters:(nullable NSDictionary *)parameters
                       additional:(NSDictionary *)additional
                          success:(nullable XZSuccessBlock)success
                          failure:(nullable XZFailureBlock)failure
                         progress:(nullable XZProgressBlock)progress;

@end

NS_ASSUME_NONNULL_END
