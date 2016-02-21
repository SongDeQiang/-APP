//
//  LinshengViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LinshengViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface LinshengViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *arr;
@property(nonatomic,strong)AVPlayer *player;
@end

@implementation LinshengViewController
- (NSArray *)arr
{
    if (!_arr) {
        _arr = [NSArray new];
        _arr = @[@"一血",@"双杀",@"三杀",@"四杀",@"五杀",@"敌军还有30秒到达战场",@"欢迎来到英雄联盟",@"全军出击",@"大杀特杀",@"暴走",@"无人能挡",@"主宰比赛",@"接近神",@"超神",@"团灭",@"终结",@"多杀合音",@"选择英雄音乐",@"排位赛背景音乐",@"失败",@"胜利",@"啦啦啦啦德玛西亚1",@"啦啦啦啦德玛西亚2",@"啦啦啦啦德玛西亚3"];
    }return _arr;
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];

        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"铃声";
    [Factory addBackItemToVC:self];
   self.tableView.delegate = self;
   self.tableView.dataSource = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma  mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.arr[indexPath.row];

    FUIButton *btn = [FUIButton buttonWithType:0];
                btn.buttonColor = [UIColor lightGrayColor];
                btn.shadowColor = [UIColor greenSeaColor];
                btn.shadowHeight = 3.0;
                btn.cornerRadius = 6.0;
                btn.titleLabel.font = [UIFont boldFlatFontOfSize:16];
                [btn setTitleColor:[UIColor cloudsColor] forState:0];
                [btn setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
                [cell.contentView addSubview:btn];
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.mas_equalTo(-20);
                    make.bottom.mas_equalTo(-10);
                    make.size.mas_equalTo(CGSizeMake(45, 20));
                }];
                [btn bk_addEventHandler:^(id sender) {
                    NSString *playPath = [NSString stringWithFormat:@"http://file.zhangyoubao.com/lol/ring/0/%ld.mp3",indexPath.row+1];
                    NSURL *url = [NSURL URLWithString:playPath];
                    self.player =[AVPlayer playerWithURL:url];
                    
                    [self.player play];
                } forControlEvents:UIControlEventTouchUpInside];
    
                [btn setTitle:@"播  放" forState:0 ];
    
    
    return cell;
}
-  (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *playPath = [NSString stringWithFormat:@"http://file.zhangyoubao.com/lol/ring/0/%ld.mp3",indexPath.row+1];
    NSURL *url = [NSURL URLWithString:playPath];
    self.player =[AVPlayer playerWithURL:url];
    
    [self.player play];
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
