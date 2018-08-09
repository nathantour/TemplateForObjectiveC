//
//  XZHttpDefine.h
//  XZTemplateForObjectiveC
//
//  Created by Nathan on 2018/8/9.
//  Copyright © 2018年 XiongZi. All rights reserved.
//

#ifndef XZHttpDefine_h
#define XZHttpDefine_h

#define kBaseURL        @"https://xxxxx.xxxx.com/xxxx"           //生产环境
#define kBaseURLTest    @"http://xxx.xx.xx.xxx:8080/xxxx"        //测试环境
#define kBaseURLDev     @"http://xxx.xx.xx.xxx:8080/xxxx"        //开发环境
#define kBaseURLLoc     @"http://xxx.xx.xx.xxx:8080/xxxx"        //本地环境


typedef NS_ENUM(NSUInteger, XZRequestType) {
    XZRequestTypeUnknow,
    /******************** Common ********************/
    // 注册
    XZRequestTypeRegister,
    // 登录
    XZRequestTypeLogin,
    // 发送验证码
    XZRequestTypeSendMessage,
    // 重置密码 校验验证码
    XZRequestTypeLoginCaptcha,
    // 重置密码
    XZRequestTypeSetLoginPassword,
    // 退出登录
    XZRequestTypeLogout,
    // 修改登录密码
    XZRequestTypeChangeLoginPassword,
    // 更新版本
    XZRequestTypeCheckVersion,
    
    /******************* Home **********************/
    // 首页数据接口
    XZRequestTypeHome,
    
    
};

typedef NS_ENUM(NSInteger, MLNetworkErrorCode) {
    ML_NETWORK_CODE_SUCCESS = 0,  // 成功处理
    ML_NETWORK_CODE_400 = 400,    // 错误请求/处理失败
    ML_NETWORK_CODE_401 = 401,    //（未授权）请求要求身份验证，认证失败，需要登录
    ML_NETWORK_CODE_403 = 403,    // (禁止)服务器拒绝请求
    ML_NETWORK_CODE_404 = 404,    // 未找到页面
    ML_NETWORK_CODE_500 = 500,    // 系统异常
};


#endif /* XZHttpDefine_h */
