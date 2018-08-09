//
//  XZUserManager.m
//  XZTemplateForObjectiveC
//
//  Created by Nathan on 2018/8/9.
//  Copyright © 2018年 XiongZi. All rights reserved.
//

#import "XZUserManager.h"

@implementation XZUser

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_userId forKey:@"userId"];
    [aCoder encodeObject:_sessionId forKey:@"sessionId"];
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_mobile forKey:@"mobile"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _userId = [aDecoder decodeObjectForKey:@"userId"];
        _sessionId = [aDecoder decodeObjectForKey:@"sessionId"];
        _name = [aDecoder decodeObjectForKey:@"name"];
        _mobile = [aDecoder decodeObjectForKey:@"mobile"];
    }
    return self;
}

#pragma mark - NSCoping
- (id)copyWithZone:(NSZone *)zone {
    XZUser *copy = [[[self class] allocWithZone:zone] init];
    copy.userId = [self.userId copyWithZone:zone];
    copy.sessionId = [self.sessionId copyWithZone:zone];
    copy.name = [self.name copyWithZone:zone];
    copy.mobile = [self.mobile copyWithZone:zone];
    return copy;
}

@end

@interface XZUserManager ()

@property (readwrite, nonatomic, strong) XZUser *user;

@end

@implementation XZUserManager

NSString * const XZUserManagerAccessXZUserObjectFromUserDefaultKey = @"XZUserManagerAccessXZUserObjectFromUserDefaultKey";

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (instancetype)sharedManager {
    static XZUserManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [self manager];
    });
    
    return _sharedManager;
}

+ (instancetype)manager {
    return [[[self class] alloc] init];
}

- (instancetype)init NS_UNAVAILABLE
{
    return [self initWithUser:nil];
}

- (instancetype)initWithUser:(nullable XZUser *)user
{
    self = [super init];
    if (self) {
        if (user) {
            self.user = user;
        }
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goToReLogin) name:XZRequestDataManagerGoToReLoginNotification object:nil];
    }
    return self;
}

- (XZUser *)user {
    if (!_user) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSData *data = [userDefaults objectForKey:XZUserManagerAccessXZUserObjectFromUserDefaultKey];
        
        id userObject = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        if ([userObject isKindOfClass:[XZUser class]]) {
            _user = userObject;
        }
        else {
            _user = [[XZUser alloc] init];
        }
    }
    return _user;
}

- (void)loginSuccessWithUser:(XZUser *)user {
    self.user = user;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:user];
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setObject:data forKey:XZUserManagerAccessXZUserObjectFromUserDefaultKey];
    [userDef synchronize];
}

- (void)goToLogin {

}

- (void)goToReLogin {

}

- (void)goToMainPage {

}

- (void)goToRegister {

}


@end
