//
//  TSESubTableViewController.m
//  XCAR
//
//  Created by Morris on 10/15/15.
//  Copyright © 2015 Samtse. All rights reserved.
//

#import "TSESubTableViewController.h"

#import <MJExtension.h>
#import <UIImageView+WebCache.h>

#import "TSEHttpTool.h"
#import "Public.h"

@interface TSESubTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation TSESubTableViewController

static NSString * const kTableViewCellIdentifier = @"TABLEVIEWCELL";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
}

- (void)requestData {
    
}

#pragma mark - Table view source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1.从重用对象池中找不用的cell对象
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellIdentifier];
    
    // 2.如果没有找到就自己创建对象
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kTableViewCellIdentifier];
    }
    
    // 3.设置cell的属性
    [cell.textLabel setText:@"xixi"];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TSELog(@"xixi");
}

#pragma mark - private methods
- (void)setupTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, ScreenWidth / 6 * 5, ScreenHeight) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView setBackgroundColor:TSEColor(248, 248, 248)];
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

@end
