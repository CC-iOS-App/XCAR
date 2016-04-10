//
//  Public.h
//  XCAR
//
//  Created by Morris on 9/21/15.
//  Copyright (c) 2015 Samtse. All rights reserved.
//

#ifndef XCAR_Public_h
#define XCAR_Public_h

#import "Constant.h"

// 设置颜色
#define TSEColor(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]
#define TSEAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#define ScreenWidth5S 320
#define ScreenWidth6 375
#define ScreenWidth6plus 414

// 自定义Log
#ifdef DEBUG
#define TSELog(...) NSLog(__VA_ARGS__)
#else
#define TSELog(...)
#endif


#endif
