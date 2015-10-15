//
//  TSESeriesInfo.h
//  XCAR
//
//  Created by Morris on 10/12/15.
//  Copyright © 2015 Samtse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSESeriesInfo : NSObject

/** 汽车名称 */
@property (nonatomic, copy) NSString *seriesName;

/** 汽车图片 */
@property (nonatomic, copy) NSString *image;

/** 汽车图片数量 */
@property (nonatomic, copy) NSString *imageCount;

/** 汽车价格 */
@property (nonatomic, copy) NSString *price;

/** 汽车销售信息 */
@property (nonatomic, strong) NSMutableArray *saleStopSubSeries;

/** 汽车销售信息 */
@property (nonatomic, strong) NSMutableArray *saleSubSeries;

@end
