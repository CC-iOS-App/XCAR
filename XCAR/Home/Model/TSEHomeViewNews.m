//
//  TSEHomeViewNews.m
//  XCAR
//
//  Created by Morris on 9/24/15.
//  Copyright (c) 2015 Samtse. All rights reserved.
//

#import "TSEHomeViewNews.h"

@implementation TSEHomeViewNews

/**
 *  新闻的发布时间不会变，override setter方法即可
 */
- (void)setNewsCreateTime:(NSString *)newsCreateTime {
    // 服务器返回的时间数据
    // 144 302,4000
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)[newsCreateTime intValue]];
    _newsCreateTime = [formatter stringFromDate:confromTimesp];
}

- (void)setPubTime:(NSInteger)pubTime {
    // 服务器返回的时间数据
    // 201509
    NSString *pubTimeStr = [NSString stringWithFormat:@"%ld%@", pubTime, _newsCreateTime];
    _pubTime = [pubTimeStr integerValue];
}

@end
