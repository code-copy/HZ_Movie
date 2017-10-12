//
//  WXTabBarController.m
//  HZ_Movie
//
//  Created by king_linfu on 15-1-29.
//  Copyright (c) 2015年 无线互联3G学院. All rights reserved.
//

#import "WXTabBarController.h"
#import "MovieItem.h"

@interface WXTabBarController ()
{
    UIImageView *_selectView;
}

@end

@implementation WXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _initTabBarItems];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self _removeTabBarItems];
}

// 移除系统的tabBarItem
- (void)_removeTabBarItems
{
    NSArray *items = self.tabBar.subviews;
    Class itemsClass = NSClassFromString(@"UITabBarButton");
    
    for (UIView *view in items) {
        
        if ([view isKindOfClass:[itemsClass class]]) {
            
            [view removeFromSuperview];
        }
    }
}

// 自定义items
- (void)_initTabBarItems
{
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all"]];
    
    CGFloat itemWidth = kScreenWidth / 5;
    CGFloat itemHeight = CGRectGetHeight(self.tabBar.frame);
    
    // 添加选中滑块
    _selectView = [[UIImageView alloc] initWithFrame:CGRectMake((itemWidth - 45) / 2, 3, 45, 45)];
    _selectView.image = [UIImage imageNamed:@"selectTabbar_bg_all1"];
    [self.tabBar addSubview:_selectView];
    

    NSArray *images = @[@"movie_cinema.png",
                      @"msg_new.png",
                      @"start_top250.png",
                      @"icon_cinema.png",
                      @"more_setting.png"];
    
    NSArray *titles = @[@"首页",@"新闻",@"TOP",@"影院",@"更多"];
    
    
    for (int i = 0; i < 5; i++) {
        
        NSString *imageName = images[i];
        NSString *title = titles[i];
        
        // 子类化创建tabBarItem
        MovieItem *item = [[MovieItem alloc] initWithFrame:CGRectMake(itemWidth * i, 0, itemWidth,itemHeight ) withImageName:imageName withTitle:title];
        item.tag = i +10;
        
        [item addTarget:self action:@selector(itemsAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tabBar addSubview:item];
    }
    
}


- (void)itemsAction:(UIControl *)control
{
    self.selectedIndex = control.tag - 10;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        _selectView.center = control.center;
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
