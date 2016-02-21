//
//  LeftViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
#import "VideoViewController.h"
#import "InformationViewController.h"
#import "BaiKeViewController.h"

@interface LeftViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray *itemNames;
@property(nonatomic,strong) UIView *bigView;
@property(nonatomic,strong) UIView *smallView;
@property(nonatomic,strong) UILabel *lb;
@property(nonatomic,strong) UIImageView *diIV;
@property(nonatomic,strong) UIImageView *aIV;
@property (nonatomic,strong)UIImageView *bIV;
@property(nonatomic,strong)UIImageView *cIV;
@end
@implementation LeftViewController
- (NSArray *)itemNames{
    return @[@"小刚资讯", @"小刚视频",@"小刚百科"];
}
/**文字边视图*/
- (UIImageView *)cIV
{
    if (!_cIV) {
        _cIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"stage_4"]];
    }return _cIV;
}
-(UIImageView *)bIV
{
    if (!_bIV) {
        _bIV =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"stage_5"]];
    }return _bIV;
}
- (UIImageView *)aIV
{
    if (!_aIV) {
        _aIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"stage_7"]];
        
    }return _aIV;
}
/** 底部视图*/
- (UIImageView *)diIV
{
    if (!_diIV) {
        _diIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"more_logo"]];
       
    }return _diIV;
}
/** 背景*/
- (UIView *)bigView
{
    if (!_bigView) {
        _bigView = [[UIView alloc]init];
        [self.view addSubview:_bigView];
        [_bigView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _bigView.backgroundColor = [UIColor clearColor] ;
    }return _bigView;
}
/** 欢迎*/
- (UILabel *)lb
{
    if (!_lb) {
        _lb = [[UILabel alloc]init];
        //    建立闪光区域，所有在闪光区域内的控件都会闪
                _lb.text = @"欢迎来到英雄联盟";
        _lb.font = [UIFont systemFontOfSize:25];
        _lb.textAlignment = NSTextAlignmentCenter;
        _lb.textColor = kNaviTitleColor;
    }return _lb;
}
- (UIView *)smallView
{
    if (!_smallView) {
        _smallView = [[UIView alloc]init];
        [self.bigView addSubview:_smallView];
        [_smallView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.mas_equalTo(self.tableView.mas_top).mas_equalTo(-5);
            make.size.mas_equalTo(CGSizeMake(kWindowW, 40));
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(30);
        }];
   

        
        
    }return _smallView;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView=[UIView new];
        [self.bigView addSubview:_tableView];
        _tableView.backgroundColor=[UIColor clearColor];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWindowW*3/4-80, kWindowH/2));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(60);
        }];
        //去掉分割线
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemNames.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    cell.accessoryType = 1;
    cell.textLabel.text = self.itemNames[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.5];
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}
kRemoveCellSeparator
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.sideMenuViewController setContentViewController:[InformationViewController standardTuWanNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 1:
            [self.sideMenuViewController setContentViewController:[VideoViewController standardinstance] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
            case 2:
            [self.sideMenuViewController setContentViewController:[BaiKeViewController defaultNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        default:
            break;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //    必须触发一下tableView的懒加载才可以
    [self.tableView reloadData];
    self.smallView.backgroundColor = [UIColor clearColor];
    self.lb.backgroundColor = [UIColor clearColor];
    FBShimmeringView *su = [FBShimmeringView new];
    [self.smallView addSubview:su];
    [su mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    su.contentView= _lb;
    [_lb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    su.shimmering = YES;
    [self.bigView addSubview:self.diIV];
    [_diIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-10);
        
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kWindowW/2, 80));
    }];
    [self.bigView addSubview:self.aIV];
    [self.aIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.tableView.mas_left);
        make.top.mas_equalTo(self.tableView.mas_top).mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [self.bigView addSubview:self.bIV];
    [self.bIV mas_makeConstraints:^(MASConstraintMaker *make) {
       make.right.mas_equalTo(self.tableView.mas_left);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.top.mas_equalTo(self.aIV.mas_bottom).mas_equalTo(30);
    
    }];
    [self.bigView addSubview:self.cIV];
    [self.cIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.tableView.mas_left);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.top.mas_equalTo(self.bIV.mas_bottom).mas_equalTo(25);
        
    }];
    
   
}


@end
