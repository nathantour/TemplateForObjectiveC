//
//  XZCommonDefine.h
//  XZTemplateForObjectiveC
//
//  Created by Nathan on 2018/8/9.
//  Copyright © 2018年 XiongZi. All rights reserved.
//

#ifndef XZCommonDefine_h
#define XZCommonDefine_h

/*******      全局定义         ********/

// 颜色
#define XZ_COLOR_FROM_RGB(r, g, b)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.f]

// 主题色
#define XZ_MAIN_THEME_COLOR        ML_COLOR_FROM_RGB(17.0f, 142.0f, 234.0f)

// 主文本字体颜色
#define XZ_MAIN_TEXT_FONT_COLOR    ML_COLOR_FROM_RGB(17.0f, 142.0f, 234.0f)
// 副文本字体颜色
#define XZ_PARATEXT_FONT_COLOR     ML_COLOR_FROM_RGB(86.0f, 86.0f, 86.0f)
// 占位符字体颜色
#define XZ_PLACEHOLDER_FONT_COLOR  ML_COLOR_FROM_RGB(202.0f, 202.0f, 202.0f)

// 分割线颜色
#define XZ_DIVIDING_LINE_COLOR     ML_COLOR_FROM_RGB(208.0f, 208.0f, 208.0f)

// 控制器视图背景颜色
#define XZ_CONTROLLER_VIEW_BACKGROUND_COLOR  ML_COLOR_FROM_RGB(241.0f, 241.0f, 241.0f)

// 按钮不可用状态下的颜色
#define XZ_BUTTON_DISABLE_STATUS_COLOR       ML_COLOR_FROM_RGB(221.0f, 221.0f, 221.0f)


/*******      UI布局         ********/

// 适配相关
#define XZ_IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)                         // 判断是否为iPhone X
#define XZ_STATUS_BAR_AND_NAVIGATION_BAR_HEIGHT (ML_IS_IPHONE_X ? 88.f : 64.f)     // 导航栏 高
#define XZ_STATUS_BAR_HEIGHT  (ML_IS_IPHONE_X ? 44.f : 20.f)                       // 电量条 高
#define XZ_TOP_MARGIN    (ML_IS_IPHONE_X ? (24.f) : 0.f)                           // 顶部多余高度
#define XZ_BOTTOM_MARGIN (ML_IS_IPHONE_X ? (34.f) : 0.f)                           // 减去底部的虚拟home位置
#define XZ_TABBAR_HEIGHT (ML_IS_IPHONE_X ? (49.f+34.f) : 49.f)                     // tabbar高度

/*******      简写         ********/
#define XZ_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)          // 屏幕宽度
#define XZ_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)        // 屏幕高度
#define XZ_FRAME_FROM_CGRECT(x, y, w, h)   CGRectMake(x, y, w, h)             // 设置 frame

#define XZ_APPLICATION_DELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])  // AppDelegate
#define XZ_WEAK_SELF typeof(self)  __weak weakSelf = self;                                     // WEAKSELf
#define XZ_DEPRECATED_MESSAGE($message) __attribute__((deprecated($message)))                  // 废弃方法声明
#define XZ_DEPRECATED_ATTRIBUTE    DEPRECATED_ATTRIBUTE                                        // 废弃属性声明



// 数据类型转换
#define XZ_NSNUMBER_INTEGER(value)   [NSNumber numberWithInteger:value]       // 整型转成  NSNumber
#define XZ_NSNUMBER_FLOAT(value)     [NSNumber numberWithFloat:value]         // 浮点型转成 NSNumber

// 国际化
//#define XZ_LOCALIZED_STRING(key) NSLocalizedString(key,nil)



#endif /* XZCommonDefine_h */
