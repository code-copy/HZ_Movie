//
//  CinemaViewController.m
//  MyMovie_Demo
//
//  Created by king_linfu on 14-12-16.
//  Copyright (c) 2014年 无线互联3G学院. All rights reserved.
//

#import "CinemaViewController.h"
#import "RequestData.h"
#import "DistrictModel.h"
#import "CinemaModel.h"
#import "CinemaCell.h"

@interface CinemaViewController ()
{
    NSMutableDictionary *_cinemaModelDic; // 影院model数据
    NSMutableArray *_disModelList; // 区域model数据
}

@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"影院";
    [self loadCinemaData];
}

#pragma mark - 数据请求
- (void)loadCinemaData
{
    // 地区数据
    NSDictionary *districtDic = [RequestData loadMovieDataWithJSON:District_List];
    NSArray *districtArray = [districtDic objectForKey:@"districtList"];
    _disModelList = [[NSMutableArray alloc] init];
    
    for (NSDictionary *disDic in districtArray) {
        
        DistrictModel *disModel = [[DistrictModel alloc]  initJsonModelWithDictionary:disDic];
        [_disModelList addObject:disModel];
    }
    
    /*   {"districtId":[同一个地区的电影院]，
     
            "districtId":[同一个地区的电影院]，
            .....
        }
    */
    
    // 电影院数据(思路详细讲解)
    NSDictionary *cinemaDic = [RequestData loadMovieDataWithJSON:Cinema_List];
    NSArray *cinemaArray = [cinemaDic objectForKey:@"cinemaList"];
    
    _cinemaModelDic = [[NSMutableDictionary alloc] init];
    for (NSDictionary *cinDic in cinemaArray) {
        
        CinemaModel *cinModel = [[CinemaModel alloc] initJsonModelWithDictionary:cinDic];
        NSString *districtID = cinModel.districtId;
        
        NSMutableArray *array = [_cinemaModelDic objectForKey:districtID];
        
        if (array == nil) {
            NSMutableArray *cinModelList = [[NSMutableArray alloc] init];
            
            [_cinemaModelDic setObject:cinModelList forKey:districtID];
        }
        
        [array addObject:cinModel];
    }
    
    [_cinemaTableView reloadData];
}


#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return _disModelList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!sections[section]) {
        
        return 0;
    }
    
    DistrictModel *disModel = _disModelList[section];
    NSString *districtID = disModel.districtID;
    NSArray *cinArray = [_cinemaModelDic objectForKey:districtID];
    return cinArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cinemaCell" forIndexPath:indexPath];
    DistrictModel *disModel = _disModelList[indexPath.section];
    NSString *districtID = disModel.districtID;
    NSArray *cinArray = [_cinemaModelDic objectForKey:districtID];
    
    CinemaModel *cinModel = cinArray[indexPath.row];
    cell.model = cinModel;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *sectionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sectionButton.tag = section + 10;
    sectionButton.frame = CGRectMake(0, 0, kScreenWidth, 35);
    [sectionButton setBackgroundImage:[UIImage imageNamed:@"hotMovieBottomImage"] forState:UIControlStateNormal];
    [sectionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sectionButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [sectionButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    sectionButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [sectionButton addTarget:self action:@selector(refreshSection:) forControlEvents:UIControlEventTouchUpInside];
    
    DistrictModel *disModel = _disModelList[section];
    [sectionButton setTitle:disModel.name forState:UIControlStateNormal];
    
    return sectionButton;
}

// 刷新组
- (void)refreshSection:(UIButton *)button
{
    NSInteger index = button.tag - 10;
    sections[index] = !sections[index];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:index];
    [_cinemaTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
