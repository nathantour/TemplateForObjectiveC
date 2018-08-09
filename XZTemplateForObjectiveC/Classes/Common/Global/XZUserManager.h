//
//  XZUserManager.h
//  XZTemplateForObjectiveC
//
//  Created by Nathan on 2018/8/9.
//  Copyright © 2018年 XiongZi. All rights reserved.
//

#import "XZBaseObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface XZUser : NSObject <NSCoding, NSCopying>

@property (readwrite, nonatomic, copy) NSString *userId;

@property (readwrite, nonatomic, copy) NSString *sessionId;

@property (readwrite, nonatomic, copy) NSString *name;

@property (readwrite, nonatomic, copy) NSString *mobile;

@end

FOUNDATION_EXPORT NSString * const XZUserManagerAccessXZUserObjectFromUserDefaultKey;

@interface XZUserManager : XZBaseObject

@property (readonly, nonatomic, strong) XZUser *user;

/**
 单例 创建和返回一个默认的 `XZUserManager` 对象.
 */
+ (instancetype)sharedManager;

/**
 创建一个 `XZUser` 对象
 
 指定初始化方法.
 
 @param user   默认登录的 XZUser 对象
 
 @return 新创建一个 XZUser
 */
- (instancetype)initWithUser:(nullable XZUser *)user NS_DESIGNATED_INITIALIZER;

/**
 当前登录的 `XZUser` 对象
 
 当前登录成功的 XZUser 对象
 
 @param user   更换的 user 对象
 
 */
- (void)loginSuccessWithUser:(XZUser *)user;

/**
  进入登录页面
  */
- (void)goToLogin;

/**
 重新进入登录页面
 */
- (void)goToReLogin;

/**
 进入主页面
 */
- (void)goToMainPage;

/**
 进入注册页面
 */
- (void)goToRegister;

@end

NS_ASSUME_NONNULL_END
