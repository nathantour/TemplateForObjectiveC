//
//  NSObject+XZJSON.h
//  XZTemplateForObjectiveC
//
//  Created by Nathan on 2018/8/9.
//  Copyright © 2018年 XiongZi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XZJSON)

//将NSArray或者NSDictionary转化为NSString
- (NSString *)toJSONString;

@end
