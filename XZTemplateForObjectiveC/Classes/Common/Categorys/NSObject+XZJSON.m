//
//  NSObject+XZJSON.m
//  XZTemplateForObjectiveC
//
//  Created by Nathan on 2018/8/9.
//  Copyright © 2018年 XiongZi. All rights reserved.
//

#import "NSObject+XZJSON.h"

@implementation NSObject (XZJSON)

//将NSArray或者NSDictionary转化为NSString
-(NSString *)toJSONString{
    NSError* error = nil;
    NSData *result = [NSJSONSerialization dataWithJSONObject:self
                                                     options:kNilOptions error:&error];
    if (error != nil) return nil;
    
    return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
}

@end
