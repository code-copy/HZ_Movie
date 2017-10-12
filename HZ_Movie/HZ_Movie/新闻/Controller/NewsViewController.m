//
//  NewsViewController.m
//  HZ_Movie
//
//  Created by king_linfu on 15-1-29.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsModel.h"
#import "NewsListCell.h"
#import "ImageListViewController.h"
#import "TestViewController.h"

@interface NewsViewController ()
{
    NSMutableArray *_newsModelArray; // 新闻model数据
    UIImageView *_imageView;
}

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNewsData];
    
    [self _initHeaderView];

}

#pragma mark - 加载新闻数据
- (void)loadNewsData
{
    NSArray *newsList = [RequestData loadMovieDataWithJSON:News_List];
    
    _newsModelArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in newsList) {
        
        NewsModel *model = [[NewsModel alloc] init];
        model.type = [dic objectForKey:@"type"];
        model.title = [dic objectForKey:@"title"];
        model.image = [dic objectForKey:@"image"];
        model.summary = [dic objectForKey:@"summary"];
        
        [_newsModelArray addObject:model];
    }
}

#pragma mark - 设置头视图
- (void)_initHeaderView
{
    NewsModel *model = _newsModelArray[0];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    _newsTableView.tableHeaderView = headerView;
    
    _imageView = [[UIImageView alloc] initWithFrame:headerView.bounds];
    _imageView.backgroundColor = [UIColor orangeColor];
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    
    [headerView addSubview:_imageView];
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _imageView.bottom - 30, kScreenWidth, 30)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    titleLabel.text = model.title;
    [headerView addSubview:titleLabel];
    
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _newsModelArray.count - 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell" forIndexPath:indexPath];
    
    cell.model = _newsModelArray[indexPath.row + 1];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NewsModel *model = _newsModelArray[indexPath.row + 1];
    
    if ([model.type intValue] == 0) {
        
        
//        TestViewController *imageListCol  = [[TestViewController alloc] init];
        
    TestViewController *testCol = [self.storyboard instantiateViewControllerWithIdentifier:@"TestViewController"];
        
        [self.navigationController pushViewController:testCol animated:YES];
        
    } else if ([model.type intValue] ==1) {
       
        // 加载storyboary上得控制器需要使用这种方法，不能直接alloc 加载
        ImageListViewController *imageListCol = [self.storyboard instantiateViewControllerWithIdentifier:@"ImageListViewController"];
        
        [self.navigationController pushViewController:imageListCol animated:YES];
    }
}


// 下拉放大图片
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 获取y坐标的偏移量,根据偏移量的改变大小去放大图片
    CGFloat yOffSet = scrollView.contentOffset.y;
    
    // 下拉的时候才放大
    if (yOffSet < 0) {
        
        _imageView.height = 150 -yOffSet;
        _imageView.top = yOffSet;
        _imageView.width = _imageView.height / 150 * kScreenWidth;
        _imageView.left = -(_imageView.width - kScreenWidth) / 2;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
