//
//  CinemaViewController.h
//  MyMovie_Demo
//
//  Created by king_linfu on 14-12-16.
//  Copyright (c) 2014年 无线互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface CinemaViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *_cinemaTableView;
    
    BOOL sections[50]; // 记录每组的收起和展开的状态
}


@end
