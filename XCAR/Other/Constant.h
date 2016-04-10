//
//  Constant.h
//  XCAR
//
//  Created by Samtse on 4/10/16.
//  Copyright © 2016 Samtse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Constant : NSObject

/** HomeViewNewsCell */
extern CGFloat const kHomeViewNewsCellMargin;
extern CGFloat const kHomeViewNewsTableViewMargin;

extern CGFloat const kTableViewContentInset;

/** 爱卡汽车 api */
/** 0. 获取新闻列表 */
extern NSString * const kGetCarNewsURL;
/** 0.1 刷新的新闻数量 （必须是整10的数，比如10，20，30等等，不然不会返回数据）*/
extern NSString * const kLimit;
/** 0.2 刷新状态 0 为刷新最新的新闻 10 为刷新之前的新闻 每加10则加载更久之前的新闻 */
extern NSString * const kOffset;
/** 0.3 新闻的类型 1为最新新闻（大杂烩） 2（国内外新车） 3（评测） 4（导购） 5（行情）*/
extern NSString * const kType;
/** 0.4 version? 传不传没影响 */
extern NSString * const kVer;

/** 1.获取视频新闻 */
/** type = 144998 (视频) */
extern NSString * const kGetVideoCarNewsURL;

/** 2.获取新闻信息链接 */
extern NSString * const kGetNewsInfoURL;

/** 3.获取论坛信息  limit=20&offset=0&ver=6.2 */
extern NSString * const kGetForumInfoURL;
// 热帖 limit=20&offset=0&ver=6.2
extern NSString * const kGetHotPostURL;

/** 4.获取所有车品牌 */
extern NSString * const kGetAllXCarBrandsURL;

/** 4.1 各车品牌的车型 */
// 参数：brandId 1 = Audi 56 = Aston Martin （id号不是按字母来的）
extern NSString * const kGetCarSubBrandsURL;

/** 4.2 车型新闻 */
// 参数：seriesId (2365) / uid
extern NSString * const kSeriesID;
extern NSString * const kGetSeriesInfoNewsURL;

// 参数：action=1， cityId=475， dataType=4，deviceId=668B4D65-724E-461E-A389-905F158A0871
// seriesId=2365， uid
extern NSString * const kGetSpecialSaleURL;
extern NSString * const kParam;

/**
 参数
 param = param
 
 数据分析
 brands 数组 品牌
 icon 车标图片
 keyword 品牌名 （宝马）
 subBrandNum 分类数量 3
 
 subBrands 数组 该品牌的所有分类
 series 数组 该分类的车型
 icon 车型图片
 name 车型名字
 price 价格范围
 subBrandName 分类名字（华晨宝马、宝马(进口)、宝马M）
 */

/** 5.获取降价信息 */
// 降价
// brandId = 0; cityId = 475; provincedId = 1; seriesId = 0; sortType = 1;
// sortType 1 降幅最大 2 价格最低 3 价格最高
extern NSString * const kBrandID;
extern NSString * const kCityID;
extern NSString * const kProvinceID;
extern NSString * const kSortType;
extern NSString * const kGetDiscountInfoURL;
// 活动
extern NSString * const kGetSalesInfoURL;
// CityId
// 348 = Shenzhen
// 475 = Beijing
// getRakingList
// 车有惠
extern NSString * const kGetSalesByCityId;


@end
