//
//  TSESeriesInfoHeaderView.m
//  XCAR
//
//  Created by Morris on 10/12/15.
//  Copyright © 2015 Samtse. All rights reserved.
//

#import "TSESeriesInfoHeaderView.h"
#import "Public.h"

@interface TSESeriesInfoHeaderView ()

@property (nonatomic, weak) UIView *topView;
@property (nonatomic, strong) UIButton *collectionBtn;
@property (nonatomic, strong) UIButton *askLowestPriceBtn;

@end

@implementation TSESeriesInfoHeaderView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupHeaderView];
    }
    return self;
}

- (void)setupHeaderView {
    
    // 顶部切换视图view
    UIView *topView = [[UIView alloc] init];
    CGFloat topViewX = 0.0;
    CGFloat topViewY = 0.0;
    CGFloat topViewW = ScreenWidth;
    CGFloat topViewH = 40.0;
    [topView setFrame:CGRectMake(topViewX, topViewY, topViewW, topViewH)];
    [topView setBackgroundColor:TSEColor(248, 248, 248)];
//    [self addSubview:topView];
    self.topView = topView;
    
    // 汽车预览图
    self.carImageView = [[UIImageView alloc] init];
    [self.carImageView.layer setBorderColor:TSEColor(221, 221, 221).CGColor];
    [self.carImageView.layer setBorderWidth:0.3];
    CGFloat carImageViewX = topViewX;
    CGFloat carImageViewY = 0.0;
    CGFloat carImageViewW = topViewW;
    CGFloat carImageViewH = 280.0;
    [self.carImageView setFrame:CGRectMake(carImageViewX, carImageViewY, carImageViewW, carImageViewH)];
    [self.carImageView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showMoreCarImage:)];
    [self.carImageView addGestureRecognizer:tap];
    [self addSubview:self.carImageView];
    
    //
    self.imageCountLabel = [[UILabel alloc] init];
    [self.imageCountLabel setTextColor:[UIColor whiteColor]];
    [self.imageCountLabel setFont:[UIFont systemFontOfSize:11.0]];
    CGFloat imageCountW = 80.0;
    CGFloat imageCountH = 30.0;
    CGFloat imageCountX = carImageViewW - imageCountW;
    CGFloat imageCountY = carImageViewH - imageCountH;
    [self.imageCountLabel setFrame:CGRectMake(imageCountX , imageCountY, imageCountW, imageCountH)];
    [self.carImageView addSubview:self.imageCountLabel];
    
    // 汽车名字
    self.carNameLabel = [[UILabel alloc] init];
    [self.carNameLabel setTextColor:TSEColor(51, 55, 58)];
    [self.carNameLabel setFont:[UIFont systemFontOfSize:18.0]];
    [self.carNameLabel.layer setBorderColor:TSEColor(221, 221, 221).CGColor];
    [self.carNameLabel.layer setBorderWidth:0.4];
    CGFloat carNameX = carImageViewX;
    CGFloat carNameY = CGRectGetMaxY(self.carImageView.frame);
    CGFloat carNameW = ScreenWidth - ScreenWidth / 8;
    CGFloat carNameH = 44.0;
    [self.carNameLabel setFrame:CGRectMake(carNameX, carNameY, carNameW, carNameH)];
    [self addSubview:self.carNameLabel];
    
    // 收藏按钮
    UIButton *collectionBtn = [[UIButton alloc] init];
    [collectionBtn setImage:[UIImage imageNamed:@"shoucang"] forState:UIControlStateNormal];
    [collectionBtn setImage:[UIImage imageNamed:@"shoucang_h"] forState:UIControlStateSelected];
    CGFloat collectionBtnX = CGRectGetMaxX(self.carNameLabel.frame);
    CGFloat collectionBtnY = carNameY;
    CGFloat collectionBtnW = ScreenWidth / 8;
    CGFloat collectionBtnH = carNameH;
    [collectionBtn setFrame:CGRectMake(collectionBtnX, collectionBtnY, collectionBtnW, collectionBtnH)];
    [self addSubview:collectionBtn];
    self.collectionBtn = collectionBtn;
    
    // 厂商指导价
    self.guidePriceLabel = [[UILabel alloc] init];
    [self.guidePriceLabel setTextColor:TSEColor(44, 49, 52)];
    [self.guidePriceLabel setFont:[UIFont systemFontOfSize:18.0]];
    [self.guidePriceLabel.layer setBorderColor:TSEColor(221, 221, 221).CGColor];
    [self.guidePriceLabel.layer setBorderWidth:0.4];
    CGFloat guidePriceX = carImageViewX;
    CGFloat guidePriceY = CGRectGetMaxY(self.carNameLabel.frame);
    CGFloat guidePriceW = ScreenWidth - ScreenWidth / 4;
    CGFloat guidePriceH = carNameH;
    [self.guidePriceLabel setFrame:CGRectMake(guidePriceX, guidePriceY, guidePriceW, guidePriceH)];
    [self addSubview:self.guidePriceLabel];
    
    // 问最低价
    UIButton *askLowestPriceBtn = [[UIButton alloc] init];
    [askLowestPriceBtn setBackgroundColor:TSEColor(40, 177, 227)];
    [askLowestPriceBtn.titleLabel setFont:[UIFont systemFontOfSize:18.0]];
    [askLowestPriceBtn setTitle:@"问最低价" forState:UIControlStateNormal];
    [askLowestPriceBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    CGFloat askLowestPriceBtnX = CGRectGetMaxX(self.guidePriceLabel.frame);
    CGFloat askLowestPriceBtnY = guidePriceY;
    CGFloat askLowestPriceBtnW = ScreenWidth / 4;
    CGFloat askLowestPriceBtnH = carNameH;
    [askLowestPriceBtn setFrame:CGRectMake(askLowestPriceBtnX, askLowestPriceBtnY, askLowestPriceBtnW, askLowestPriceBtnH)];
    [self addSubview:askLowestPriceBtn];
    self.askLowestPriceBtn = askLowestPriceBtn;
    
    // view height
    _viewHeight = CGRectGetMaxY(self.askLowestPriceBtn.frame);
}

#pragma mark - 
- (void)showMoreCarImage:(UITapGestureRecognizer *)gr {
    TSELog(@"showMoreCarImage");
}

@end
