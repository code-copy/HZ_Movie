//
//  MovieDetailViewController.m
//  WX_Movie
//
//  Created by king_linfu on 15-1-13.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "CommentCell.h"
#import "MovieDetailHeaderView.h"
#import "MovieDetailModel.h"
#import "MovieCommentModel.h"

@interface MovieDetailViewController ()
{
    NSMutableArray *_commentModelArray; // 电影评论数据
    MovieDetailModel *_detaiModel; // 电影详情model
    NSIndexPath *_selectIndexPath; // 当前选中的cell
}

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadMovieDetailData];
    [self _initHeaderView];
    
}

- (void)loadMovieDetailData
{
    // 加载详情数据
    NSDictionary *movieDetailDic = [RequestData loadMovieDataWithJSON:Movie_Detail];
    _detaiModel = [[MovieDetailModel alloc] initJsonModelWithDictionary:movieDetailDic];
    
    // 加载评论数据
    _commentModelArray = [[NSMutableArray alloc] init];
    NSDictionary *commentDic = [RequestData loadMovieDataWithJSON:Movie_Comment];
    NSArray *commentList = [commentDic objectForKey:@"list"];
    
    for (NSDictionary *dic in commentList) {
        
        MovieCommentModel *commentModel = [[MovieCommentModel alloc] initJsonModelWithDictionary:dic];
        [_commentModelArray addObject:commentModel];
    }

}

- (void)_initHeaderView
{
    MovieDetailHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"MovieDetailHeaderView" owner:self options:nil] lastObject];
    
    _contentTableView.tableHeaderView = headerView;
    headerView.model = _detaiModel;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _commentModelArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Comment_Cell" forIndexPath:indexPath];
    
    cell.model = _commentModelArray[indexPath.row];
        
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath == _selectIndexPath) {
        
        MovieCommentModel *model = _commentModelArray[indexPath.row];
        NSString *content = model.content;
        
        // 计算文本在label上显示的高度
        UIFont *font = [UIFont systemFontOfSize:15.0];
        CGRect contentRect = [content boundingRectWithSize:CGSizeMake(220, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:NULL];
        
        CGFloat cellHeight = contentRect.size.height + 40;
        
        if (cellHeight > 70) {
            
            return cellHeight;
        }
    }
    
    return 70;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectIndexPath = indexPath;
    // 刷新指定的cell
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
