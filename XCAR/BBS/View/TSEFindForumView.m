//
//  TSEFindForumView.m
//  XCAR
//
//  Created by Morris on 10/4/15.
//  Copyright © 2015 Samtse. All rights reserved.
//

#import "TSEFindForumView.h"
#import "TSEFindFourmViewCell.h"
#import "TSENavigationController.h"
#import "TSESubTableViewController.h"
#import "TSEBarButtonItem.h"
#import "Public.h"

@interface TSEFindForumView () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, weak) UIView *bgView;

@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSArray *titles;

@end

@implementation TSEFindForumView

static NSString * const kCollectionCellIdentifier = @"COLLECTIONVIEWCELL";

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setBackgroundColor:TSEColor(248, 248, 248)];
        [self setupFindForumView];
        [self.collectionView registerClass:[TSEFindFourmViewCell class] forCellWithReuseIdentifier:kCollectionCellIdentifier];
    }
    return self;
}

- (void)setupFindForumView {
    CGFloat btnWidth = ScreenWidth / 3;
    CGFloat btnHeight = btnWidth + 10;
    CGFloat widgetGap = 15.0;
    CGFloat imageGap = 15.0;
    
    for (NSInteger i = 0; i < [self.images count]; i++) {
        UIView *btnView = [[UIView alloc] init];
        [btnView.layer setBorderColor:TSEColor(224, 224, 224).CGColor];
        [btnView.layer setBorderWidth:0.4];
        [btnView setFrame:CGRectMake(btnWidth * i, 2 * widgetGap, btnWidth, btnHeight)];
        [btnView setBackgroundColor:[UIColor whiteColor]];
        
        UIImage *image = self.images[i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [imageView setFrame:CGRectMake(btnWidth / 2 - image.size.width / 1.6, 8.0, btnWidth - 2 * imageGap, btnWidth - 2 * imageGap)];
        [btnView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] init];
        [label setText:self.titles[i]];
        [label setFont:[UIFont systemFontOfSize:16.0]];
        NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:16.0]};
        CGSize size = [label.text sizeWithAttributes:attrs];
        [label setFrame:CGRectMake(btnWidth / 2 - size.width / 2, CGRectGetMaxY(imageView.frame) + 5.0, size.width, size.height)];
        [label setTextColor:TSEColor(137, 137, 146)];
        [btnView addSubview:label];
        
        btnView.tag = i;
        if (btnView.tag == 0) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clubIconClicked:)];
            [btnView addGestureRecognizer:tap];
        } else if (btnView.tag == 1) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(diFangIconClicked:)];
            [btnView addGestureRecognizer:tap];
        } else if (btnView.tag == 2) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lifeIconClicked:)];
            [btnView addGestureRecognizer:tap];
        }
        [self addSubview:btnView];
    }
    
    // 推荐论坛
    UIImageView *commendImageView = [[UIImageView alloc] init];
    [commendImageView setFrame:CGRectMake(0.0, btnHeight + 3 * widgetGap, ScreenWidth, 40.0)];
    UIImage *image = [UIImage imageNamed:@"zhaoluntan_beijing"];
    [commendImageView setImage:image];
    [commendImageView setContentMode:UIViewContentModeScaleToFill];
    
    UIImageView *starImageView = [[UIImageView alloc] init];
    [starImageView setFrame:CGRectMake(10.0, 10.0, 20.0, 20.0)];
    [starImageView setImage:[UIImage imageNamed:@"bbs_baitian_shoucang"]];
    [commendImageView addSubview:starImageView];
    
    UILabel *commendLabel = [[UILabel alloc] init];
    [commendLabel setFont:[UIFont systemFontOfSize:18.0]];
    [commendLabel setTextColor:[UIColor whiteColor]];
    [commendLabel setText:@"推荐论坛"];
    [commendLabel setFrame:CGRectMake(CGRectGetMaxX(starImageView.frame) + 5.0, 0.0, 90.0, 40.0)];
    [commendImageView addSubview:commendLabel];
    [self addSubview:commendImageView];
    
    // 论坛
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat itemHeight = 0.0;
    if (ScreenWidth == ScreenWidth5S) {
        itemHeight = 40.0;
    } else {
        itemHeight = 55.0;
    }
    [layout setItemSize:CGSizeMake((ScreenWidth - 4 * widgetGap) / 2, itemHeight)];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(widgetGap,
                                                                                          CGRectGetMaxY(commendImageView.frame) + widgetGap,
                                                                                          ScreenWidth - 2 * widgetGap,
                                                                                          ScreenHeight - (CGRectGetMaxY(commendImageView.frame) + widgetGap))
                                                          collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView setBackgroundColor:TSEColor(248, 248, 248)];
    [self addSubview:collectionView];
    self.collectionView = collectionView;
}

#pragma mark - Collection view datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TSEFindFourmViewCell *cell = (TSEFindFourmViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kCollectionCellIdentifier forIndexPath:indexPath];
    [cell setInfoLabelTextWithTag:indexPath.item];
    
    return cell;
}

#pragma mark - Collection view delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    TSELog(@"selected index%ld", indexPath.item);
}

#pragma mark - Gesture method
- (void)clubIconClicked:(UITapGestureRecognizer *)gr {
    TSELog(@"clubIconClicked");
    // 创建一个新的窗口，以此窗口来容纳显示子品牌的控制器
    UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectMake(ScreenWidth, 0.0, ScreenWidth / 6 * 5, ScreenHeight)];
    window.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.7];
    window.windowLevel = UIWindowLevelNormal;
    window.hidden = NO;
    [window makeKeyAndVisible];
    TSESubTableViewController *subTableViewCtr = [[TSESubTableViewController alloc] init];
    TSENavigationController *nav = [[TSENavigationController alloc] initWithRootViewController:subTableViewCtr];
    subTableViewCtr.title = @"unknown";
    subTableViewCtr.navigationItem.rightBarButtonItem = [TSEBarButtonItem barButtonWithTitle:@"返回" target:self action:@selector(tapAction)];
    window.rootViewController = nav;
    self.window = window;
    
    // 设置背景阴影
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth, 0.0, ScreenWidth, ScreenHeight)];
    [UIView animateWithDuration:0.25 animations:^{
        [window setFrame:CGRectMake(ScreenWidth - ScreenWidth / 6 * 5, 0.0, ScreenWidth / 6 * 5, ScreenHeight)];
        [bgView setFrame:self.bounds];
    }];
    bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    // 点击手势 销毁当前显示子品牌的窗口和背景阴影
    UITapGestureRecognizer *tap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [bgView addGestureRecognizer:tap];
    [self addSubview:bgView];
    self.bgView = bgView;
}

- (void)diFangIconClicked:(UITapGestureRecognizer *)gr {
    TSELog(@"diFangBtnClicked");
}

- (void)lifeIconClicked:(UITapGestureRecognizer *)gr{
    TSELog(@"lifeIconClicked");
}

/**
 *  点击手势 销毁当前显示子品牌的窗口和背景阴影
 */
- (void)tapAction{
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.alpha = 0;
        [self.window setFrame:CGRectMake(ScreenWidth, 0.0, ScreenWidth / 6 * 5, ScreenHeight)];
        [self.bgView setFrame:CGRectMake(ScreenWidth, 0.0, ScreenWidth, ScreenHeight)];
    } completion:^(BOOL finished) {
        [self.bgView removeFromSuperview];
        [self.window resignKeyWindow];
        self.window  = nil;
        self.bgView = nil;
    }];
}

#pragma mark - lazy load
- (NSArray *)images {
    if (!_images) {
        UIImage *clubImage = [UIImage imageNamed:@"club"];
        UIImage *diFangImage = [UIImage imageNamed:@"difang"];
        UIImage *lifeImage = [UIImage imageNamed:@"life"];
        _images = @[clubImage, diFangImage, lifeImage];
    }
    return _images;
}

- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"爱车俱乐部", @"地方分会", @"人·车·生活"];
    }
    return _titles;
}

@end
