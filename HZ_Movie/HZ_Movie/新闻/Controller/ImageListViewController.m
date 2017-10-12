//
//  ImageListViewController.m
//  HZ_Movie
//
//  Created by king_linfu on 15-2-2.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "ImageListViewController.h"
#import "ImageListCell.h"
#import "ImageModel.h"
#import "ImageScanController.h"

@interface ImageListViewController ()
{
    NSMutableArray *_imageModelArray;
    NSMutableArray *_imageURLArray;
}

@end

@implementation ImageListViewController

//static NSString * const reuseIdentifier = @"imageListCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadImagesData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadImagesData
{
    NSArray *imageList = [RequestData loadMovieDataWithJSON:Image_List];
    
    _imageModelArray = [[NSMutableArray alloc] init];
    // 图片URL地址数组
    _imageURLArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in imageList) {
        
        ImageModel *model = [[ImageModel alloc] init];
        model.image = [dic objectForKey:@"image"];
        
        [_imageModelArray addObject:model];
        
        [_imageURLArray addObject:model.image];
    }
    
}


#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _imageModelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageListCell" forIndexPath:indexPath];
    
    cell.model = _imageModelArray[indexPath.item];
    
    return cell;
}


#pragma mark <UICollectionViewDelegate>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat itemWidth = (kScreenWidth - 50) / 4;
    
    return CGSizeMake(itemWidth, itemWidth);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageScanController *imageCol = [[ImageScanController alloc] init];
    imageCol.imageURLArray = _imageURLArray;
    imageCol.s_IndexPath = indexPath;
    [self.navigationController pushViewController:imageCol animated:YES];
}


@end
