//
//  Constant.m
//  XCAR
//
//  Created by Samtse on 4/10/16.
//  Copyright © 2016 Samtse. All rights reserved.
//

#import "Constant.h"

@implementation Constant

/** HomeViewNewsCell */
CGFloat const kHomeViewNewsCellMargin = 6.0f;
CGFloat const kHomeViewNewsTableViewMargin = 1.0f;

CGFloat const kTableViewContentInset = 100.0f;

/** 爱卡汽车 api */
/** 0. 获取新闻列表 */
NSString * const kGetCarNewsURL = @"http://a.xcar.com.cn/interface/6.0/getNewsList.php";
/** 0.1 刷新的新闻数量 （必须是整10的数，比如10，20，30等等，不然不会返回数据）*/
NSString * const kLimit = @"limit";
/** 0.2 刷新状态 0 为刷新最新的新闻 10 为刷新之前的新闻 每加10则加载更久之前的新闻 */
NSString * const kOffset = @"offset";
/** 0.3 新闻的类型 1为最新新闻（大杂烩） 2（国内外新车） 3（评测） 4（导购） 5（行情）*/
NSString * const kType = @"type";
/** 0.4 version? 传不传没影响 */
NSString * const kVer = @"ver";

/** 1.获取视频新闻 */
/** type = 144998 (视频) */
NSString * const kGetVideoCarNewsURL = @"http://mi.xcar.com.cn/interface/xcarapp/getdingyue.php";

/** 2.获取新闻信息链接 */
NSString * const kGetNewsInfoURL = @"http://a.xcar.com.cn/interface/6.0/getNewsInfo.php";

/** 3.获取论坛信息  limit=20&offset=0&ver=6.2 */
NSString * const kGetForumInfoURL = @"http://mi.xcar.com.cn/interface/xcarapp/getSelectedPostList.php";
// 热帖 limit=20&offset=0&ver=6.2
NSString * const kGetHotPostURL = @"http://my.xcar.com.cn/app/6/getHotPostList.php";

/** 4.获取所有车品牌 */
NSString * const kGetAllXCarBrandsURL = @"http://mi.xcar.com.cn/interface/xcarapp/getBrands.php";

/** 4.1 各车品牌的车型 */
// 参数：brandId 1 = Audi 56 = Aston Martin （id号不是按字母来的）
NSString * const kGetCarSubBrandsURL = @"http://mi.xcar.com.cn/interface/xcarapp/getSeriesByBrandId.php";

/** 4.2 车型新闻 */
// 参数：seriesId (2365) / uid
NSString * const kSeriesID = @"seriesId";
NSString * const kGetSeriesInfoNewsURL = @"http://mi.xcar.com.cn/interface/xcarapp/getSeriesInfoNew.php";

// 参数：action=1， cityId=475， dataType=4，deviceId=668B4D65-724E-461E-A389-905F158A0871
// seriesId=2365， uid
NSString * const kGetSpecialSaleURL = @"http://mi.xcar.com.cn/interface/xcarapp/getSpecialSale.php";
NSString * const kParam = @"param";

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
NSString * const kBrandID = @"brandId";
NSString * const kCityID = @"cityId";
NSString * const kProvinceID = @"provincedId";
NSString * const kSortType = @"sortType";
NSString * const kGetDiscountInfoURL = @"http://mi.xcar.com.cn/interface/xcarapp/getDiscountList.php";
// 活动
NSString * const kGetSalesInfoURL = @"http://a.xcar.com.cn/interface/6.0/getEventList.php";
// CityId
// 348 = Shenzhen
// 475 = Beijing
// getRakingList
// 车有惠
NSString * const kGetSalesByCityId = @"http://mi.xcar.com.cn/interface/xcarapp/getSaleListByCityId.php";


@end
