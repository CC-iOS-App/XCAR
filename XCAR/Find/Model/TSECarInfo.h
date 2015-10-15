//
//  TSECarInfo.h
//  XCAR
//
//  Created by Morris on 10/13/15.
//  Copyright © 2015 Samtse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSECarInfo : NSObject

/** 汽车名称 */
@property (nonatomic, copy) NSString *subSeriesName;

/** 汽车型号 */
@property (nonatomic, copy) NSString *carName;

/** 汽车驱动 */
@property (nonatomic, copy) NSString *driver;

/** 汽车引擎 */
@property (nonatomic, copy) NSString *engine;

/** 手/自动档 */
@property (nonatomic, copy) NSString *transmission;

/** 汽车指导价 */
@property (nonatomic, copy) NSString *guidePrice;

/** 汽车最低价 */
@property (nonatomic, copy) NSString *lowestPrice;

@end
