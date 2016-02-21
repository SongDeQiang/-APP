//
//  HeroDetailViewController.m
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroDetailViewController.h"
#import "TRImageView.h"
#import "AllHeroDetailViewModel.h"
#import "LiveDetailViewController.h"

@interface HeroDetailCell : UITableViewCell
@property(nonatomic,strong)UILabel *descLb;
@end
@implementation HeroDetailCell
-(UILabel *)descLb{
    if (!_descLb) {
        _descLb = [UILabel new];
        _descLb.font=[UIFont systemFontOfSize:14];
        //黑线方框背景，正常由美工提供。 如果没有美工 可以考虑使用灰色视图套白色视图，两者边缘差距1像素来解决
        UIView *grayView = [UIView new];
        grayView.backgroundColor=[UIColor lightGrayColor];
        [self.contentView addSubview:grayView];
        grayView.layer.cornerRadius = 4;
        [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(3, 10, 3, 10));
        }];
        
        UIView *whiteView =[UIView new];
        whiteView.backgroundColor = [UIColor whiteColor];
        [grayView addSubview:whiteView];
        whiteView.layer.cornerRadius = 4;
        
        [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(1, 1, 1, 1));
            make.height.mas_greaterThanOrEqualTo(28);
        }];
        
        [whiteView addSubview:_descLb];
        _descLb.numberOfLines = 0;
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
        }];
        
    }
    return _descLb;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

@end


@interface HeroDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)AllHeroDetailViewModel *herodetailVM;
/** 包含英雄头像,名称,金币等视图 */
@property(nonatomic,strong)UIView *topView;

@end

@implementation HeroDetailViewController


-(id)initWithHeroModel:(AllHeroAllModel *)heroModel{
    if (self = [super init]) {
        self.heroModel = heroModel;
        self.title = heroModel.cnName;
        [Factory addBackItemToVC:self];
    }
    return self;
}

-(AllHeroDetailViewModel *)herodetailVM{
    if (!_herodetailVM) {
        _herodetailVM = [[AllHeroDetailViewModel alloc] initWithenName:self.heroModel.enName];
    }
    return _herodetailVM;
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.allowsSelection = NO;
        _tableView.separatorStyle = 0;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.top.mas_equalTo(self.topView.mas_bottom).mas_equalTo(0);
        }];
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.herodetailVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView.mj_header endRefreshing];
                }
                [_tableView reloadData];
            }];
        }];
        [_tableView registerClass:[HeroDetailCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @[@"使用技巧", @"应对技巧", @"英雄背景"][section];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HeroDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (indexPath.section == 0) {
        cell.descLb.text = [_herodetailVM tipsForRow];
    }
    if (indexPath.section == 1) {
        cell.descLb.text = [_herodetailVM opponentTipsForRow];
    }
    if (indexPath.section == 2) {
        cell.descLb.text = [_herodetailVM descForRow];
    }
    return cell;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kRGBColor(246, 247, 251);
    [self.tableView.mj_header beginRefreshing];
}

-(UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc] init];
        [self.view addSubview:_topView];
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(90);
        }];
        //英雄头像
        TRImageView *imageView = [TRImageView new];
        [_topView addSubview:imageView];
        NSURL *iconURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_heroModel.enName]];
        [imageView.imageView setImageWithURL:iconURL placeholderImage:[UIImage imageNamed:@"account_mars_default"]];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 60));
            make.left.top.mas_equalTo(8);
        }];
        //英雄名称
        UILabel *nameLb = [UILabel new];
        nameLb.text = _heroModel.cnName;
        [_topView addSubview:nameLb];
        [nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(imageView);
        }];
        //英雄标签
        UILabel *textLb = [UILabel new];
        textLb.text = [self.herodetailVM tagsForRow];
        [_topView addSubview:textLb];
        [textLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(nameLb.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(nameLb);
        }];
        //需要金币
        //需要得到英雄详情解析出得字符串
        UILabel *priceLb = [UILabel new];
        NSArray *arr = [self.heroModel.price componentsSeparatedByString:@","];
        NSString *m1 = arr.firstObject;
        NSString *m2 = arr.lastObject;
        priceLb.text = [NSString stringWithFormat:@"金%@,券%@",m1,m2];
        priceLb.textColor = [UIColor lightGrayColor];
        [_topView addSubview:priceLb];
        [priceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.rightMargin.mas_equalTo(nameLb);
            make.top.mas_equalTo(nameLb.mas_bottom).mas_equalTo(5);
        }];
        //英雄系数
        UILabel *coolLb = [UILabel new];
//        NSString *gong = [self.herodetailVM ratingAttackForRow];
//        NSString *fang = [self.herodetailVM ratingDefenseForRow];
//        NSString *fa = [self.herodetailVM ratingMagicForRow];
//        NSString *nandu = [self.herodetailVM ratingDifficultyForRow];
        NSArray *arr2 = [self.heroModel.rating componentsSeparatedByString:@","];
        coolLb.text = [NSString stringWithFormat:@"攻%@ 防%@ 法%@ 难度%@",arr2[0],arr2[1],arr2[2],arr2[3]];
        coolLb.font = [UIFont systemFontOfSize:12];
        coolLb.textColor = [UIColor lightGrayColor];
        [_topView addSubview:coolLb];
        [coolLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.rightMargin.mas_equalTo(nameLb);
            make.top.mas_equalTo(priceLb.mas_bottom).mas_equalTo(5);
        }];
        /** 玩家排行*/
        FUIButton *btn = [FUIButton buttonWithType:0];
        btn = [FUIButton buttonWithType:0];
        btn.buttonColor = [UIColor lightGrayColor];
        btn.shadowColor = [UIColor whiteColor];
        btn.shadowHeight = 3.0;
        btn.cornerRadius = 6.0;
       btn.titleLabel.font = [UIFont boldFlatFontOfSize:16];
       
        [btn setTitleColor:[UIColor blackColor] forState:0];
        [btn setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [_topView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(nameLb.mas_topMargin).mas_equalTo(0);
            make.right.mas_equalTo(-5);
            make.size.mas_equalTo(CGSizeMake(60, 30));
        }];
        
        [btn setTitle:@"排行榜" forState:0 ];
        [btn bk_addEventHandler:^(id sender) {
            NSString *path = [NSString stringWithFormat:@"http://lolbox.duowan.com/phone/heroTop10PlayersNew.php?hero=%@",_heroModel.enName];
            NSURL *url = [NSURL URLWithString:path];
            NSURLRequest *ques = [NSURLRequest requestWithURL:url];
            LiveDetailViewController *vc = [[LiveDetailViewController alloc]initWithRequest:ques Name:@"玩家使用排行榜"];
            [self.navigationController pushViewController:vc animated:YES];
        } forControlEvents:UIControlEventTouchUpInside];


        
    }
    return _topView;
}
@end
