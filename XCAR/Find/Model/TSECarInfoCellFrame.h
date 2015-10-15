//
//  TSECarInfoCellFrame.h
//  XCAR
//
//  Created by Morris on 10/13/15.
//  Copyright © 2015 Samtse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Public.h"

/** CarInfoCell的间距 */
#define kCarInfoCellMargin 6

/** 主标题字体颜色 */
#define kMainTitleColor TSEColor(44, 48, 56)

/** 副标题字体颜色 */
#define kSubTitleColor TSEColor(146, 145, 151)

/** 价格字体颜色 */
#define kPriceTitleColor TSEColor(245, 112, 43)

/** 按钮字体颜色 */
#define kCarInfoButtonColor TSEColor(40, 177, 229)

/** 主标题字体大小 */
#define kMainTitleFont [UIFont systemFontOfSize:18]

/** 副类型字体大小 */
#define kSubTitleFont [UIFont systemFontOfSize:14]

/** 价格字体大小 */
#define kPriceTitleFont [UIFont systemFontOfSize:16]

@class TSECarInfo;
@interface TSECarInfoCellFrame : NSObject

@property (nonatomic, strong) TSECarInfo *carInfo;

/** 父视图 */
@property (nonatomic, assign, readonly) CGRect carInfoViewFrame;

/** 汽车名称 */
@property (nonatomic, assign, readonly) CGRect subSeriesNameLabelFrame;

/** 汽车驱动 */
@property (nonatomic, assign, readonly) CGRect driverLabelFrame;

/** 汽车指导价 */
@property (nonatomic, assign, readonly) CGRect guidePriceLabelFrame;

/** 汽车最低价 */
@property (nonatomic, assign, readonly) CGRect lowestPriceLabelFrame;

/** 汽车对比 */
@property (nonatomic, assign, readonly) CGRect compareBtnFrame;

/** 汽车购车计算 */
@property (nonatomic, assign, readonly) CGRect planBtnFrame;

/** 汽车问最低价 */
@property (nonatomic, assign, readonly) CGRect askLowestPriceBtnFrame;

/** cell的高度 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

@end
