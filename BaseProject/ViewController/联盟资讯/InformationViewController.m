//
//  InformationViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "InformationViewController.h"
#import "InfoListTableViewController.h"
@interface InformationViewController ()

@end

@implementation InformationViewController
//单例模式 懒汉模式 饿汉模式
+(UINavigationController *)standardTuWanNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        InformationViewController *vc = [[InformationViewController alloc]initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}

/** 提供每个vc对应的values值数组*/
+(NSArray *)vcValues{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i <[self itemNames].count; i++) {
        [arr addObject:@(i)];
    }return arr;
}

/** 提供每个vc对应的key值数组*/
+ (NSArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"infoType"];
    }
    return [arr copy];
}


/** 提供数组题目*/
+ (NSArray *)itemNames{
    return @[@"最新",@"赛事",@"官方",@"攻略",@"活动"];
}
/** 提供每个题目对应的控制器的类型，题目和类型必须一致*/
+ (NSArray *)viewControllerClasses{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[InfoListTableViewController class]];
    }
    return [arr copy];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenSeaColor];
    self.title = @"联盟资讯";
//[NSThread sleepForTimeInterval:2.0];
    [Factory addMenuItemToVC:self];
}


@end
