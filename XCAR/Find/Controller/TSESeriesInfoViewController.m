//
//  TSESeriesInfoViewController.m
//  XCAR
//
//  Created by Morris on 10/12/15.
//  Copyright © 2015 Samtse. All rights reserved.
//

#import "TSESeriesInfoViewController.h"

#import <MJExtension.h>
#import <UIImageView+WebCache.h>

#import "TSESubBrand.h"
#import "TSESeries.h"
#import "TSESeriesInfo.h"
#import "TSESaleSubSeries.h"
#import "TSECarInfo.h"

#import "TSECarInfoCell.h"
#import "TSECarInfoCellFrame.h"
#import "TSESeriesInfoHeaderView.h"

#import "TSEHttpTool.h"
#import "Public.h"

@interface TSESeriesInfoViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) TSESeriesInfoHeaderView *seriesInfoHeaderView;

@property (nonatomic, strong) NSMutableArray *carInfoFrame;
@property (nonatomic, strong) NSMutableArray *seriesInfo;
@property (nonatomic, strong) NSArray *saleSubSeries;

@property (nonatomic, strong) NSArray *series;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end

@implementation TSESeriesInfoViewController

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath series:(NSArray *)series {
    self = [super init];
    if (self) {
        _series = series;
        _indexPath = indexPath;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    [self requestSeriesInfoNews];
}

- (void)requestSeriesInfoNews {
    
    // 取出当前点选的车系的id
    TSESubBrand *subBrand = self.series[self.indexPath.section];
    TSESeries *serie = subBrand.series[self.indexPath.row];
    
    NSMutableDictionary *paras = [NSMutableDictionary dictionary];
    paras[kSeriesID] = serie.seriesId;
    
    [TSEHttpTool get:kGetSeriesInfoNewsURL params:paras success:^(id json) {
//        TSELog(@"%@", json);
        
        TSESeriesInfo *seriesInfo = [TSESeriesInfo objectWithKeyValues:json];
        [self setupHeaderViewWithSeriesInfo:seriesInfo];
        [self.seriesInfo addObject:seriesInfo];
        
        self.saleSubSeries = seriesInfo.saleSubSeries;
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        TSELog(@"error-----%@", error);
    }];
}

#pragma mark - Table view datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.saleSubSeries count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TSESaleSubSeries *saleSubSeries = self.saleSubSeries[section];
    return [saleSubSeries.cars count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TSECarInfoCell *cell = [TSECarInfoCell cellWithTableView:tableView];
    
    TSESaleSubSeries *saleSubSeries = self.saleSubSeries[indexPath.section];
    
    NSMutableArray *carInfoFrameArr = [NSMutableArray array];
    for (TSECarInfo *carInfo in saleSubSeries.cars) {
        TSECarInfoCellFrame *f = [[TSECarInfoCellFrame alloc] init];
        f.carInfo = carInfo;
        [carInfoFrameArr addObject:f];
    }
    
    self.carInfoFrame = carInfoFrameArr;
    cell.carInfoCellFrame = self.carInfoFrame[indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TSESaleSubSeries *saleSubSeries = self.saleSubSeries[indexPath.section];
    NSMutableArray *carInfoFrameArr = [NSMutableArray array];
    for (TSECarInfo *carInfo in saleSubSeries.cars) {
        TSECarInfoCellFrame *f = [[TSECarInfoCellFrame alloc] init];
        f.carInfo = carInfo;
        [carInfoFrameArr addObject:f];
    }
    self.carInfoFrame = carInfoFrameArr;
    TSECarInfoCellFrame *f = self.carInfoFrame[indexPath.row];
    return f.cellHeight;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    // 取出当前section的saleSubSeries
    TSESaleSubSeries *saleSubSeries = self.saleSubSeries[section];
    // 遍历数组saleSubSeries.cars，并利用字典section做键，carInfo.engine作值
    NSMutableDictionary *sectionTitle = [NSMutableDictionary dictionary];
    NSNumber *key = [NSNumber numberWithInteger:section];
    for (TSECarInfo *carInfo in saleSubSeries.cars) {
        [sectionTitle setObject:carInfo.engine forKey:key];
    }
    
    return sectionTitle[key];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TSELog(@"haha");
}

#pragma mark - private method
- (void)setupTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    tableView.delegate = self;
    tableView.dataSource = self;
    TSESeriesInfoHeaderView *seriesInfoHeaderView = [[TSESeriesInfoHeaderView alloc] init];
    [seriesInfoHeaderView setFrame:CGRectMake(0.0, 0.0, ScreenWidth, seriesInfoHeaderView.viewHeight)];
    tableView.tableHeaderView = seriesInfoHeaderView;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    self.seriesInfoHeaderView = seriesInfoHeaderView;
}

- (void)setupHeaderViewWithSeriesInfo:(TSESeriesInfo *)seriesInfo {
    [self.seriesInfoHeaderView.carImageView sd_setImageWithURL:[NSURL URLWithString:seriesInfo.image] placeholderImage:[UIImage imageNamed:@"zhanwei2_1"]];
    [self.seriesInfoHeaderView.imageCountLabel setText:[NSString stringWithFormat:@"共%@张图", seriesInfo.imageCount]];
    [self.seriesInfoHeaderView.carNameLabel setText:[NSString stringWithFormat:@"   %@", seriesInfo.seriesName]];
    [self.seriesInfoHeaderView.guidePriceLabel setText:[NSString stringWithFormat:@"   厂商指导价：%@", seriesInfo.price]];
}

- (NSMutableArray *)carInfoFrame {
    if (!_carInfoFrame) {
        _carInfoFrame = [NSMutableArray array];
    }
    return _carInfoFrame;
}

- (NSMutableArray *)seriesInfo {
    if (!_seriesInfo) {
        _seriesInfo = [NSMutableArray array];
    }
    return _seriesInfo;
}

@end
