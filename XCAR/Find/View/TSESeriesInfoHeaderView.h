//
//  TSESeriesInfoHeaderView.h
//  XCAR
//
//  Created by Morris on 10/12/15.
//  Copyright © 2015 Samtse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSESeriesInfoHeaderView : UIView

/** 汽车图片 */
@property (nonatomic, strong) UIImageView *carImageView;
/** 汽车图片数量 */
@property (nonatomic, strong) UILabel *imageCountLabel;
/** 汽车系列名字 */
@property (nonatomic, strong) UILabel *carNameLabel;
/** 厂商指导价 */
@property (nonatomic, strong) UILabel *guidePriceLabel;
/** view height */
@property (nonatomic, assign, readonly) CGFloat viewHeight;

@end
