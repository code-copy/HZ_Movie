//
//  MovieDetailViewController.h
//  WX_Movie
//
//  Created by king_linfu on 15-1-13.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "BaseViewController.h"

@interface MovieDetailViewController : BaseViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *contentTableView;

@end
