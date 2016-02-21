//
//  VideoViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoViewController.h"
#import "MediaViewController.h"
#import "HeroTimeViewController.h"
#import "LiveViewController.h"
@interface VideoViewController ()

@end

@implementation VideoViewController
+ (VideoViewController *)standardinstance
{
    static VideoViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [VideoViewController new];
        
    });return vc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent = NO;
    HeroTimeViewController *vc2 = [HeroTimeViewController new];
    vc2.title =@"英雄时刻";
    LiveViewController *vc3 = [LiveViewController new];
    vc3.title = @"龙珠直播";
    MediaViewController *vc1= [MediaViewController new];
    vc1.title = @"游戏视频";
    UINavigationController *heroNavi = [[UINavigationController alloc]initWithRootViewController:vc1];
    heroNavi.title = @"游戏视频";
    heroNavi.tabBarItem.image = [UIImage imageNamed:@"tab_icon_news_normal"];
    heroNavi.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_icon_news_press"];
    

    UINavigationController *searchNavi = [[UINavigationController alloc]initWithRootViewController:vc2];
    searchNavi.title = @"英雄时刻";
    searchNavi.tabBarItem.image = [UIImage imageNamed:@"yx"];
    searchNavi.tabBarItem.selectedImage = [UIImage imageNamed:@"yxx"];
    UINavigationController *baikeNavi = [[UINavigationController alloc]initWithRootViewController:vc3];
    baikeNavi.title = @"龙珠直播";
    baikeNavi.tabBarItem.image = [UIImage imageNamed:@"tab_icon_more_normal"];
    baikeNavi.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_icon_more_press"];
    self.viewControllers = @[heroNavi,baikeNavi];
    self.tabBar.selectedImageTintColor = kNaviTitleColor;
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"nav_bar_bg_for_six"];
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
