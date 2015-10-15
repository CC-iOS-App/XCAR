//
//  TSECarInfoView.m
//  XCAR
//
//  Created by Morris on 10/13/15.
//  Copyright © 2015 Samtse. All rights reserved.
//

#import "TSECarInfoView.h"
#import "TSECarInfoCellFrame.h"
#import "TSECarInfo.h"
#import "Public.h"
#import <UIImageView+WebCache.h>

@interface TSECarInfoView ()

/** 汽车名称 */
@property (nonatomic, weak) UILabel *subSeriesNameLabel;

/** 汽车驱动 */
@property (nonatomic, weak) UILabel *driverLabel;

/** 汽车指导价 */
@property (nonatomic, weak) UILabel *guidePriceLabel;

/** 汽车最低价 */
@property (nonatomic, weak) UILabel *lowestPriceLabel;

/** 汽车对比 */
@property (nonatomic, weak) UIButton *compareBtn;

/** 汽车购车计算 */
@property (nonatomic, weak) UIButton *planBtn;

/** 汽车问最低价 */
@property (nonatomic, weak) UIButton *askLowestPriceBtn;

@end

@implementation TSECarInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupCarInfoView];
        [self setUserInteractionEnabled:YES];
        // 设置背景颜色
        [self setBackgroundColor:TSEColor(255, 255, 255)];
    }
    return self;
}

- (void)setupCarInfoView {
    /** 汽车名称 */
    UILabel *subSeriesNameLabel = [[UILabel alloc] init];
    [subSeriesNameLabel setFont:kMainTitleFont];
    [subSeriesNameLabel setTextColor:kMainTitleColor];
    [subSeriesNameLabel setNumberOfLines:0];
    [self addSubview:subSeriesNameLabel];
    self.subSeriesNameLabel = subSeriesNameLabel;
    
    /** 汽车驱动 */
    UILabel *driverLabel = [[UILabel alloc] init];
    [driverLabel setFont:kSubTitleFont];
    [driverLabel setTextColor:kSubTitleColor];
    [self addSubview:driverLabel];
    self.driverLabel = driverLabel;
    
    /** 汽车指导价 */
    UILabel *guidePriceLabel = [[UILabel alloc] init];
    [guidePriceLabel setFont:kPriceTitleFont];
    [guidePriceLabel setTextColor:kSubTitleColor];
    [self addSubview:guidePriceLabel];
    self.guidePriceLabel = guidePriceLabel;
    
    /** 汽车最低价 */
    UILabel *lowestPriceLabel = [[UILabel alloc] init];
    [lowestPriceLabel setFont:kPriceTitleFont];
    [lowestPriceLabel setTextColor:kPriceTitleColor];
    [self addSubview:lowestPriceLabel];
    self.lowestPriceLabel = lowestPriceLabel;
    
    /** 汽车对比 */
    UIButton *compareBtn = [[UIButton alloc] init];
    [compareBtn.layer setBorderColor:kCarInfoButtonColor.CGColor];
    [compareBtn.layer setBorderWidth:0.4];
    [compareBtn.layer setCornerRadius:5.0];
    [compareBtn setTitle:@"+对比" forState:UIControlStateNormal];
    [compareBtn setTitleColor:kCarInfoButtonColor forState:UIControlStateNormal];
    [self addSubview:compareBtn];
    self.compareBtn = compareBtn;
    
    
    /** 汽车购车计算 */
    UIButton *planBtn = [[UIButton alloc] init];
    [planBtn.layer setBorderColor:kCarInfoButtonColor.CGColor];
    [planBtn.layer setBorderWidth:0.4];
    [planBtn.layer setCornerRadius:5.0];
    [planBtn setTitle:@"购车计算" forState:UIControlStateNormal];
    [planBtn setTitleColor:kCarInfoButtonColor forState:UIControlStateNormal];
    [self addSubview:planBtn];
    self.planBtn = planBtn;
    
    /** 汽车问最低价 */
    UIButton *askLowestPriceBtn = [[UIButton alloc] init];
    [askLowestPriceBtn.layer setCornerRadius:5.0];
    [askLowestPriceBtn setTitle:@"问最低价" forState:UIControlStateNormal];
    [askLowestPriceBtn setBackgroundColor:kCarInfoButtonColor];
    [self addSubview:askLowestPriceBtn];
    self.askLowestPriceBtn = askLowestPriceBtn;
}

- (void)setCarInfoCellFrame:(TSECarInfoCellFrame *)carInfoCellFrame {
    _carInfoCellFrame = carInfoCellFrame;
    TSECarInfo *carInfo = carInfoCellFrame.carInfo;
    
    /** 汽车名称 */
    self.subSeriesNameLabel.frame = carInfoCellFrame.subSeriesNameLabelFrame;
    NSString *subSeriesName = [NSString stringWithFormat:@"%@ %@",carInfo.subSeriesName, carInfo.carName];
    [self.subSeriesNameLabel setText:subSeriesName];
    
    /** 汽车驱动 */
    self.driverLabel.frame = carInfoCellFrame.driverLabelFrame;
    NSString *subTitle = [NSString stringWithFormat:@"%@ %@ %@", carInfo.driver, carInfo.engine, carInfo.transmission];
    [self.driverLabel setText:subTitle];
    
    /** 汽车指导价 */
    self.guidePriceLabel.frame = carInfoCellFrame.guidePriceLabelFrame;
    NSString *guidePrice = [NSString stringWithFormat:@"(指导价：%@)", carInfo.guidePrice];
    [self.guidePriceLabel setText:guidePrice];
    
    /** 汽车最低价 */
    self.lowestPriceLabel.frame = carInfoCellFrame.lowestPriceLabelFrame;
    NSString *lowestPrice = [NSString stringWithFormat:@"全国最低价：%@", carInfo.lowestPrice];
    [self.lowestPriceLabel setText:lowestPrice];
    
    /** 汽车对比 */
    self.compareBtn.frame = carInfoCellFrame.compareBtnFrame;
    [self.compareBtn addTarget:self action:@selector(compareBtnClicked) forControlEvents:UIControlEventTouchDown];
    
    
    /** 汽车购车计算 */
    self.planBtn.frame = carInfoCellFrame.planBtnFrame;
    [self.planBtn addTarget:self action:@selector(planBtnClicked) forControlEvents:UIControlEventTouchDown];
    
    /** 汽车问最低价 */
    self.askLowestPriceBtn.frame = carInfoCellFrame.askLowestPriceBtnFrame;
    [self.askLowestPriceBtn addTarget:self action:@selector(askLowestPriceBtnClicked) forControlEvents:UIControlEventTouchDown];
}

#pragma mark - Button Click method
- (void)compareBtnClicked {
    TSELog(@"compareBtnClicked");
}

- (void)planBtnClicked {
    TSELog(@"planBtnClicked");
}

- (void)askLowestPriceBtnClicked {
    TSELog(@"askLowestPriceBtnClicked");
}

@end
