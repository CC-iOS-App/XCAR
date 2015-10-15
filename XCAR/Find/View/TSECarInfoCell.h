//
//  TSECarInfoCell.h
//  XCAR
//
//  Created by Morris on 10/13/15.
//  Copyright © 2015 Samtse. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSECarInfoCellFrame;
@interface TSECarInfoCell : UITableViewCell

/** carInfoCellFrame的frame */
@property (nonatomic, strong) TSECarInfoCellFrame *carInfoCellFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
