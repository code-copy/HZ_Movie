//
//  PosterView.m
//  HZ_Movie
//
//  Created by king_linfu on 15-2-3.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "PosterView.h"
#import "PosterCollectionView.h"
#import "IndexCollectionView.h"
#import "MovieModel.h"

#define HeaderViewHeight 100

@implementation PosterView
{
    UIView *_headerView;
    UIView *_shadeView; // 遮罩视图
    UILabel *_titleLabel; // 电影标题
    PosterCollectionView *_posterColView;
    IndexCollectionView *_indexColview;
}

- (void)dealloc
{
    [_indexColview removeObserver:self forKeyPath:@"currentPage"];
    [_posterColView removeObserver:self forKeyPath:@"currentPage"];
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self _initPosterView];
        [self _initHeaderView];
        [self _initTitleView];
        
        // 添加KVO监听，实现索引视图和海报视图的联动
        [_posterColView addObserver:self forKeyPath:@"currentPage" options:NSKeyValueObservingOptionNew context:NULL];
        
        [_indexColview addObserver:self forKeyPath:@"currentPage" options:NSKeyValueObservingOptionNew context:NULL];
    }
    
    return self;
}

#pragma mark - 创建头部索引视图
- (void)_initHeaderView
{
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, -HeaderViewHeight, kScreenWidth, 130)];
    [self addSubview:_headerView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_headerView.bounds];
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    
    //对image 指定位置拉升
    UIImage *newImage = [image stretchableImageWithLeftCapWidth:0 topCapHeight:5];
    [imageView setImage:newImage];
    [_headerView addSubview:imageView];
    
    UIButton *hiddentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    hiddentButton.frame = CGRectMake((kScreenWidth - 50) / 2,imageView.bottom - 20,50,25);
    hiddentButton.tag = 1001;
    [hiddentButton setImage:[UIImage imageNamed:@"down_home.png"] forState:UIControlStateNormal];
    [hiddentButton setImage:[UIImage imageNamed:@"up_home.png"] forState:UIControlStateSelected];
    [hiddentButton addTarget:self action:@selector(hiddentIndexView:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:hiddentButton];
    
    _indexColview = [[IndexCollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, HeaderViewHeight)];
    _indexColview.itemWidth = 70;
    _indexColview.minLineSpace = 5;
    [_headerView addSubview:_indexColview];
    
}

#pragma mark - 创建海报视图
- (void)_initPosterView
{
    _posterColView = [[PosterCollectionView alloc] initWithFrame:CGRectMake(0, 30, kScreenWidth, self.height - 30 - 35)];
    _posterColView.itemWidth = kScreenWidth - 80;
    _posterColView.minLineSpace = 10;
    [self addSubview:_posterColView];
    
    // 添加遮罩视图
    _shadeView = [[UIView alloc] initWithFrame:self.bounds];
    _shadeView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    _shadeView.hidden = YES;
    [self addSubview:_shadeView];
    
    // 添加滑动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    
    [self addGestureRecognizer:pan];
}


#pragma mark - 创建电影标题视图
- (void)_initTitleView
{
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bottom - 35, kScreenWidth, 35)];
    _titleLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home"]];
    _titleLabel.font = [UIFont boldSystemFontOfSize:20];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
}

- (void)setMovieModelArray:(NSArray *)movieModelArray
{
    _movieModelArray = movieModelArray;
    _posterColView.movieModelArray = _movieModelArray;
    _indexColview.movieModelArray = _movieModelArray;
    
    // 获取第0个电影标题
    MovieModel *model = _movieModelArray[0];
    _titleLabel.text = model.title;
}

#pragma mark - buttonActions
- (void)panAction:(UIPanGestureRecognizer *)pan
{
    CGPoint point = [pan translationInView:self];
    // 用于标记不用实时调用显示和收起的方法
    static int mark = 1;
    if (point.y > 0) {
        if (mark == 1) {
            [self _showHeaderView];
            mark = 2;
        }
    } else {
        if (mark == 2) {
            [self _hiddentHeaderView];
            mark = 1;
        }
    }
}

- (void)hiddentIndexView:(UIButton *)button
{
    button.selected = !button.selected;
    if (button.selected) {
        
        [self _showHeaderView];
        
    } else {
        [self _hiddentHeaderView];
    }
}

// 显示索引视图
- (void)_showHeaderView
{
    UIButton *button = (UIButton *)[_headerView viewWithTag:1001];
    
    [UIView animateWithDuration:0.5 animations:^{
        
        _headerView.top = 0;
        button.selected = YES;
        _shadeView.hidden = NO;
        
    }];
}

// 收起索引视图
- (void)_hiddentHeaderView
{
    UIButton *button = (UIButton *)[_headerView viewWithTag:1001];
    [UIView animateWithDuration:0.5 animations:^{
        
        _headerView.top = -HeaderViewHeight;
        button.selected = NO;
        _shadeView.hidden = YES;

    }];
}


#pragma mark - KVO触发的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"currentPage"]) {
        // 获取监听到的最新的currentPage
        NSNumber *newIndex = [change objectForKey:@"new"];
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:[newIndex integerValue] inSection:0];
        
        // 根据object 判断滑动的时索引视图还是海报视图
        if ([object isKindOfClass:[PosterCollectionView class]] && _indexColview.currentPage != indexPath.item) {
            
            [_indexColview scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            _indexColview.currentPage = indexPath.item;
            
        } else if([object isKindOfClass:[IndexCollectionView class]]) {
            
            [_posterColView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            _posterColView.currentPage = indexPath.item;
        }
        
        MovieModel *model = _movieModelArray[indexPath.item];
        _titleLabel.text = model.title;
    }
    
}

@end
