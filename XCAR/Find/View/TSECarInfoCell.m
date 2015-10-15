//
//  TSECarInfoCell.m
//  XCAR
//
//  Created by Morris on 10/13/15.
//  Copyright © 2015 Samtse. All rights reserved.
//

#import "TSECarInfoCell.h"
#import "TSECarInfoView.h"
#import "TSECarInfoCellFrame.h"
#import "Public.h"

@interface TSECarInfoCell ()

@property (nonatomic, weak) TSECarInfoView *carInfoView;

@end

@implementation TSECarInfoCell

static NSString * const kCellIdentifier = @"SERIESINFO";

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    // 1.从重用对象池中找不用的cell对象
    TSECarInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    // 2.如果没有找到就自己创建对象
    if (cell == nil) {
        cell = [[TSECarInfoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentifier];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 设置cell的背景色
        [self setBackgroundColor:TSEColor(235, 235, 235)];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        [self setupCarInfoView];
    }
    return self;
}

/**
 *  设置汽车信息界面的frame
 */
- (void)setupCarInfoView {
    /** 父视图 */
    TSECarInfoView *carInfoView = [[TSECarInfoView alloc] init];
    [self.contentView addSubview:carInfoView];
    self.carInfoView = carInfoView;
}

/**
 *  override setter
 */
- (void)setCarInfoCellFrame:(TSECarInfoCellFrame *)carInfoCellFrame {
    _carInfoCellFrame = carInfoCellFrame;
    [self setupCarInfoData];
}

/**
 *  设置汽车信息界面
 */
- (void)setupCarInfoData {
    self.carInfoView.carInfoCellFrame = self.carInfoCellFrame;
    self.carInfoView.frame = self.carInfoCellFrame.carInfoViewFrame;
}

@end
