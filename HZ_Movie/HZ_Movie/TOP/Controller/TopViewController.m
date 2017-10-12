//
//  TopViewController.m
//  MyMovie_Demo
//
//  Created by king_linfu on 14-12-16.
//  Copyright (c) 2014年 无线互联3G学院. All rights reserved.
//

#import "TopViewController.h"
#import "TopCell.h"
#import "TopModel.h"
#import "MovieDetailViewController.h"

@interface TopViewController ()
{
    NSMutableArray *_topModelArray; // topModel 数据
}

@end

static NSString *indentify = @"TopCell_new";

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadTop250Data];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    
    UICollectionView *topCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49) collectionViewLayout:flowLayout];
    
    
    topCollectionView.delegate = self;
    topCollectionView.dataSource = self;
    [self.view addSubview:topCollectionView];
    
    // 注册加载nib文件的cell
    UINib *nib = [UINib nibWithNibName:@"TopCell" bundle:nil];
    [topCollectionView registerNib:nib forCellWithReuseIdentifier:indentify];
}

#pragma mark - 加载top数据
- (void)loadTop250Data
{
    NSDictionary *topDic = [RequestData loadMovieDataWithJSON:TOP_250];
    
    _topModelArray = [[NSMutableArray alloc] init];
    
    NSArray *topList = [topDic objectForKey:@"subjects"];
    for (NSDictionary *dic in topList) {
        
        TopModel *model = [[TopModel alloc] initJsonModelWithDictionary:dic];
        
        [_topModelArray addObject:model];
    }
    
}

#pragma mark - UICollectionViewDalegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _topModelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentify forIndexPath:indexPath];
    
    cell.model = _topModelArray[indexPath.item];
    
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat itemWidth = (kScreenWidth - 40) / 3;
    CGFloat itemHeight = itemWidth * 5 / 3;
    return CGSizeMake(itemWidth, itemHeight);
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    MovieDetailViewController *movieDetailCol = [self.storyboard instantiateViewControllerWithIdentifier:@"MovieDetailViewController"];
    [self.navigationController pushViewController:movieDetailCol animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
