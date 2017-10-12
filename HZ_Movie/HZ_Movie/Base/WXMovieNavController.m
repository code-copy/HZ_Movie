//
//  WXMovieNavController.m
//  HZ_Movie
//
//  Created by king_linfu on 15-1-29.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "WXMovieNavController.h"

@interface WXMovieNavController ()

@end

@implementation WXMovieNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏的背景图片
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
    
    // 设置标题的颜色和字体
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];
    
    // 设置导航栏按钮颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];

}

// 设置状态栏的样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
