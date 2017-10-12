//
//  HomeViewController.m
//  HZ_Movie
//
//  Created by king_linfu on 15-1-29.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "HomeViewController.h"
#import "MovieModel.h"
#import "MovieListCell.h"
#import "PosterView.h"

@interface HomeViewController ()
{
    UITableView *_movieTableView;
    PosterView *_postView;
    BOOL _isLeft;
    NSMutableArray *_movieModelArray; // 电影model数据
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadMovieData];
    
    [self createRightItem];
    [self _initViews];
    
}

- (void)createRightItem
{
    UIButton *r_Button = [UIButton buttonWithType:UIButtonTypeCustom];
    r_Button.frame = CGRectMake(0, 0, 45, 30);
    
    [r_Button setImage:[UIImage imageNamed:@"list_home.png"] forState:UIControlStateNormal];
    [r_Button setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x.png"] forState:UIControlStateNormal];
    [r_Button addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:r_Button];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}


- (void)_initViews
{
    _movieTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49)];
    _movieTableView.backgroundColor = [UIColor clearColor];
    _movieTableView.rowHeight = 120;
    _movieTableView.delegate = self;
    _movieTableView.dataSource = self;
    
    // 注册单元格
    UINib *nib = [UINib nibWithNibName:@"MovieListCell" bundle:nil];
    [_movieTableView registerNib:nib forCellReuseIdentifier:@"movieCell"];
    [self.view addSubview:_movieTableView];
    
    
    _postView = [[PosterView alloc] initWithFrame:_movieTableView.bounds];
    _postView.hidden = YES;
    _postView.movieModelArray = _movieModelArray;
    [self.view addSubview:_postView];
    
}

#pragma mark - 加载电影数据
- (void)loadMovieData
{
    // 1、找到文件存放路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"us_box" ofType:@"json"];
    
    // 2、获取文件的内容
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    
    // 3、JSON数据解析:NSJSONSerialization 官方提供的JSON解析方法
    id jsonDic =  [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    NSArray *movieList = [jsonDic objectForKey:@"subjects"];
    
    // 用于保存model数据
    _movieModelArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dic in movieList) {
        
        NSDictionary *movieDic = [dic objectForKey:@"subject"];
        
        MovieModel *model = [[MovieModel alloc] init];
        //将数据保存到model
        model.rating = [movieDic objectForKey:@"rating"];
        model.title = [movieDic objectForKey:@"title"];
        model.original_title = [movieDic objectForKey:@"original_title"];
        model.year = [movieDic objectForKey:@"year"];
        model.images = [movieDic objectForKey:@"images"];

        [_movieModelArray addObject:model];
    }
}

#pragma mark - UItableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _movieModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"movieCell" forIndexPath:indexPath];
    
    cell.model = _movieModelArray[indexPath.row];
    
    return cell;
}

#pragma mark - buttonActions
- (void)rightButtonAction:(UIButton *)button
{
    [self filpViews:self.view withIsLeft:_movieTableView.hidden];
    [self filpViews:button withIsLeft:button.selected];
    
    button.selected = !button.selected;
    _movieTableView.hidden = !_movieTableView.hidden;
    _postView.hidden = !_postView.hidden;
    
    if (button.selected) {
        [button setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    }else {
        
        [button setImage:[UIImage imageNamed:@"list_home.png"] forState:UIControlStateNormal];
    }
}

// 翻转视图
- (void)filpViews:(UIView *)view withIsLeft:(BOOL)isLeft
{
    // 判断旋转的方向
    UIViewAnimationOptions option = isLeft ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight;
    
    // 视图翻转动画
    [UIView transitionWithView:view duration:0.5 options:option animations:^{
        // 动画时干的事
        
    } completion:^(BOOL finished) {
        
        // 动画完成后干的事
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
