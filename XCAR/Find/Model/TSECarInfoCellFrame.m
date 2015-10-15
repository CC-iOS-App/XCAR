//
//  TSECarInfoCellFrame.m
//  XCAR
//
//  Created by Morris on 10/13/15.
//  Copyright © 2015 Samtse. All rights reserved.
//

#import "TSECarInfoCellFrame.h"
#import "TSECarInfo.h"
#import "Public.h"

#define kLabelHeight 16

@implementation TSECarInfoCellFrame

- (void)setCarInfo:(TSECarInfo *)carInfo {
    _carInfo = carInfo;
    
    /** 父视图 */
    CGFloat carInfoViewX = 0.0;
    CGFloat carInfoViewY = 0.0;
    CGFloat carInfoViewW = ScreenWidth;
    CGFloat carInfoViewH = 0.0;
    
    /** 汽车名称 */
    CGFloat subSeriesNameX = 2 * kCarInfoCellMargin;
    CGFloat subSeriesNameY = kCarInfoCellMargin;
    CGFloat subSeriesNameW = carInfoViewW - 2 * kCarInfoCellMargin;
    NSString *subSeriesName = [NSString stringWithFormat:@"%@ %@",carInfo.subSeriesName, carInfo.carName];
    NSDictionary *subSeriesNameAttrs = @{NSFontAttributeName : kMainTitleFont};
    CGSize subSeriesNameSize = [subSeriesName sizeWithAttributes:subSeriesNameAttrs];
    NSInteger row = ceil(subSeriesNameSize.width / subSeriesNameW + 0.5);
    CGFloat subSeriesNameH = subSeriesNameSize.height * row;
    if (subSeriesNameSize.width > 289.0) {
        _subSeriesNameLabelFrame = CGRectMake(subSeriesNameX, subSeriesNameY, subSeriesNameW, subSeriesNameH);
    } else {
        _subSeriesNameLabelFrame = CGRectMake(subSeriesNameX, subSeriesNameY, subSeriesNameW, subSeriesNameSize.height);
    }
    
    /** 汽车驱动 */
    CGFloat driverX = subSeriesNameX;
    CGFloat driverY = CGRectGetMaxY(_subSeriesNameLabelFrame) + 2 * kCarInfoCellMargin;
    NSString *subTitle = [NSString stringWithFormat:@"%@ %@ %@", carInfo.driver, carInfo.engine, carInfo.transmission];
    NSDictionary *subTitleAttrs = @{NSFontAttributeName : kSubTitleFont};
    CGSize subTitleSize = [subTitle sizeWithAttributes:subTitleAttrs];
    _driverLabelFrame = CGRectMake(driverX, driverY, subTitleSize.width, subTitleSize.height);
    
    /** 汽车最低价 */
    CGFloat lowestPriceX = subSeriesNameX;
    CGFloat lowestPriceY = CGRectGetMaxY(_driverLabelFrame) + 2 * kCarInfoCellMargin;
    NSString *lowestPrice = [NSString stringWithFormat:@"全国最低价：%@", carInfo.lowestPrice];
    NSDictionary *lowestPriceAttrs = @{NSFontAttributeName : kPriceTitleFont};
    CGSize lowestPriceSize = [lowestPrice sizeWithAttributes:lowestPriceAttrs];
    _lowestPriceLabelFrame = CGRectMake(lowestPriceX, lowestPriceY, lowestPriceSize.width, lowestPriceSize.height);
    
    /** 汽车指导价 */
    CGFloat guidePriceX = CGRectGetMaxX(_lowestPriceLabelFrame) + kCarInfoCellMargin;
    CGFloat guidePriceY = lowestPriceY;
    NSString *guidePrice = [NSString stringWithFormat:@"(指导价：%@)", carInfo.guidePrice];
    NSDictionary *guidePriceAttrs = @{NSFontAttributeName : kPriceTitleFont};
    CGSize guidePriceSize = [guidePrice sizeWithAttributes:guidePriceAttrs];
    _guidePriceLabelFrame = CGRectMake(guidePriceX, guidePriceY, guidePriceSize.width, guidePriceSize.height);
    
    /** 汽车对比 */
    CGFloat compareX = subSeriesNameX;
    CGFloat compareY = CGRectGetMaxY(_guidePriceLabelFrame) + 2 * kCarInfoCellMargin;
    CGFloat compareW = (carInfoViewW - 4 * kCarInfoCellMargin) / 6;
    CGFloat compareH = 44.0;
    _compareBtnFrame = CGRectMake(compareX, compareY, compareW, compareH);
    
    /** 汽车购车计算 */
    CGFloat planX = CGRectGetMaxX(_compareBtnFrame) + kCarInfoCellMargin;
    CGFloat planY = compareY;
    CGFloat planW = compareW * 2;
    CGFloat planH = compareH;
    _planBtnFrame = CGRectMake(planX, planY, planW, planH);
    
    /** 汽车问最低价 */
    CGFloat askLowestPriceX = CGRectGetMaxX(_planBtnFrame) + kCarInfoCellMargin;
    CGFloat askLowestPriceY = planY;
    CGFloat askLowestPriceW = compareW * 3 - 2 * kCarInfoCellMargin;
    CGFloat askLowestPriceH = compareH;
    _askLowestPriceBtnFrame = CGRectMake(askLowestPriceX, askLowestPriceY, askLowestPriceW, askLowestPriceH);
    
    /** 父视图 */
    carInfoViewH = CGRectGetMaxY(_askLowestPriceBtnFrame) + 2 * kCarInfoCellMargin;
    _carInfoViewFrame = CGRectMake(carInfoViewX, carInfoViewY, carInfoViewW, carInfoViewH);
    
    /** cell的高度 */
    _cellHeight = CGRectGetMaxY(_carInfoViewFrame) + 2 * kCarInfoCellMargin;
}

@end
