//
//  ImageScanController.m
//  HZ_Movie
//
//  Created by king_linfu on 15-2-2.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "ImageScanController.h"
#import "ImageScanCell.h"

@interface ImageScanController ()
{
    BOOL _isHiddent;
    UIImage *_image;
}

@end

@implementation ImageScanController

static NSString * const reuseIdentifier = @"Cell";

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (id)init
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight - 64);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    
    self = [super initWithCollectionViewLayout:flowLayout];
    if (self) {
       
        self.collectionView.pagingEnabled = YES;
        
        //监听导航栏隐藏的通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hiddenNavBar) name:@"hiddenNavBar" object:nil];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图片浏览";
    // Register cell classes
    [self.collectionView registerClass:[ImageScanCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // 保存图片按钮
    UIButton *downLoadButton = [UIButton buttonWithType:UIButtonTypeCustom];
    downLoadButton.frame = CGRectMake(kScreenWidth -100, self.view.bottom - 100, 80, 50);
    [downLoadButton setImage:[UIImage imageNamed:@"img_download_p"] forState:UIControlStateNormal];
    [downLoadButton addTarget:self action:@selector(downloadImageAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:downLoadButton];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%@",self.collectionView);

    [self.collectionView scrollToItemAtIndexPath:_s_IndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}

#pragma mark - 隐藏导航栏、保存图片
// 隐藏导航栏
- (void)hiddenNavBar
{
    _isHiddent = !_isHiddent;
    [self.navigationController setNavigationBarHidden:_isHiddent animated:YES];
}


/**
 *  保存图片到相册 UIImageWriteToSavedPhotosAlbum
 
 UIImage *image : 要保存的图片
 id completionTarget :调用的是谁，一般为self
 SEL completionSelector : 回调的方法格式有规定
 void *contextInfo : 要传递的数据，一般不用写
 */
- (void)downloadImageAction
{
    UIImageWriteToSavedPhotosAlbum(_image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}

/**
 *  保存图片后回调的方法格式固定
 *
 *  @param image       保存的图片
 *  @param error       保存错误提示，如果为nil表示没有出错，也就是保存成功，反之则失败
 *  @param contextInfo 要传递的数据，一般不用写
 */
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSString *message = nil;
    if (error == nil) {
        
        message = @"图片保存成功";
        
    } else{
        message = @"图片保存出错";
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil,nil];
    
    [alertView show];
}


#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _imageURLArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageScanCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.imageURL = _imageURLArray[indexPath.item];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
// cell将要在屏幕上显示的时候调用
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageScanCell *imageCell = (ImageScanCell *)cell;

    _image = imageCell.scrollView.imageView.image;
}

// cell结束在屏幕上显示的时候调用
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageScanCell *imageCell = (ImageScanCell *)cell;
    [imageCell.scrollView setZoomScale:1.0 animated:NO];
}

@end
