//
//  ZBXiangViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBXiangViewController.h"
#import "ZBXiangViewModel.h"
#import "TRImageView.h"
#define kDAXIAO (kWindowW-80)/6
@interface ZBXiangCell : UITableViewCell
@property(nonatomic,strong) UILabel *descLb;
@property(nonatomic,strong) UIView *bsView;
@end
@implementation ZBXiangCell
- (UILabel *)descLb{
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
- (UIView *)bsView
{
    if (!_bsView) {
        //黑线方框背景，正常由美工提供。 如果没有美工 可以考虑使用灰色视图套白色视图，两者边缘差距1像素来解决
        _bsView = [UIView new];
        _bsView.backgroundColor=[UIColor lightGrayColor];
        [self.contentView addSubview:_bsView];
        _bsView.layer.cornerRadius = 4;
        [_bsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(3, 10, 3, 10));
        }];
        
        UIView *whiteView =[UIView new];
        whiteView.backgroundColor = [UIColor whiteColor];
        [_bsView addSubview:whiteView];
        whiteView.layer.cornerRadius = 4;
        
        [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(1, 1, 1, 1));
            make.height.mas_greaterThanOrEqualTo(kDAXIAO*3 + 30);
        }];

    }return _bsView;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor=[UIColor clearColor];
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}

@end
@interface ZBXiangViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong)ZBXiangViewModel *xiVM;
@property (nonatomic,strong)UIView *topView;
@property (nonatomic,strong)TRImageView *touImg;
@property(nonatomic,strong)UILabel *nameLb;
@property (nonatomic,strong)UILabel *parceLb;
@property(nonatomic,strong)UILabel *sellLb;
@end

@implementation ZBXiangViewController
- (ZBXiangViewModel *)xiVM
{
    if (!_xiVM) {
        _xiVM = [[ZBXiangViewModel alloc]initWithId:_Id];
    }return _xiVM;
}
- (id)initWithURL:(NSURL *)url Id:(NSInteger)Id
{
    if (self = [super init]) {
        self.url = url;
        self.Id = Id;
        self.title = @"物品详情";
        [Factory addBackItemToVC:self];
    }return self;
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.allowsSelection = NO;
        _tableView.separatorStyle = 0;
        [self.view addSubview:_tableView];
        _tableView.sectionHeaderHeight = 23;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.top.mas_equalTo(self.topView.mas_bottom).mas_equalTo(0);
        }];
        [_tableView registerClass:[ZBXiangCell class] forCellReuseIdentifier:@"Cell"];
    }return _tableView;
}
#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.backgroundColor = self.view.backgroundColor;
    UILabel *lb = [UILabel new];
    [view addSubview:lb];
    lb.backgroundColor = [UIColor clearColor];
    lb.text = @[@"物品属性", @"合成需求", @"可合成"][section];
    lb.font = [UIFont systemFontOfSize:13];
    lb.textColor=[UIColor lightGrayColor];
    [lb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    ZBXiangCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (indexPath.section == 0) {
        cell.descLb.text = self.xiVM.detailModel.desc;
    }
    if (indexPath.section == 1) {
        
        NSInteger needNum = self.xiVM.needNum;
        for (int i = 0; i < needNum; i++) {
            if (i < 6) {
                UIImageView *sIV = [[UIImageView alloc]init];
                [cell.bsView addSubview:sIV];
                [sIV mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(kDAXIAO,kDAXIAO ));
                    make.left.mas_equalTo(10+((kWindowW-60)/6+10)*i);
                    make.top.mas_equalTo(10);
                    make.bottom.mas_equalTo(-10);
                }];
                id str= self.xiVM.needImgArr[i];
                NSString *str1 = [NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",str];
                NSURL *url = [NSURL URLWithString:str1];
                [sIV setImageWithURL:url];
            }
        }
    }
    if (indexPath.section == 2) {
        NSInteger needNum = self.xiVM.composeNum;
        for (int i = 0; i < needNum; i++) {
            if (i <6 ) {
                
                UIImageView *sIV = [[UIImageView alloc]init];
                [cell.bsView addSubview:sIV];
                [sIV mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(kDAXIAO, kDAXIAO));
                    make.left.mas_equalTo(5+(kDAXIAO+10)*i);
                    make.top.mas_equalTo(10);
                   
                }];
                id str= self.xiVM.composeImgArr[i];
                NSString *str1 = [NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",str];
                NSURL *url = [NSURL URLWithString:str1];
                [sIV setImageWithURL:url];
            }else if (i < 12)
            {
                
                UIImageView *sIV = [[UIImageView alloc]init];
                [cell.bsView addSubview:sIV];
                [sIV mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(kDAXIAO, kDAXIAO));
                    make.left.mas_equalTo(5+(kDAXIAO+10)*(i-6));
                    make.top.mas_equalTo(kDAXIAO+15);
                    
                }];
                id str= self.xiVM.composeImgArr[i];
                NSString *str1 = [NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",str];
                NSURL *url = [NSURL URLWithString:str1];
                [sIV setImageWithURL:url];
            }else{
                
                UIImageView *sIV = [[UIImageView alloc]init];
                [cell.bsView addSubview:sIV];
                [sIV mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(kDAXIAO, kDAXIAO));
                    make.left.mas_equalTo(5+(kDAXIAO+10)*(i-12));
                    make.top.mas_equalTo(2*kDAXIAO+20);
                    
                }];
                id str= self.xiVM.composeImgArr[i];
                NSString *str1 = [NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",str];
                NSURL *url = [NSURL URLWithString:str1];
                [sIV setImageWithURL:url];
            }

        }
       
        
    }
    
    return cell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.topView.backgroundColor =[UIColor whiteColor];
    self.view.backgroundColor=kRGBColor(246, 247, 251);
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.xiVM getDataFromNetCompleteHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }else{
              
                NSURL *iconURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%ld_64x64.png", (long)_Id]];
               
                [self.touImg.imageView setImageWithURL:iconURL placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
                self.nameLb.text = self.xiVM.detailModel.name;
                
                NSInteger price = self.xiVM.detailModel.allPrice;
                self.parceLb.text = [NSString stringWithFormat:@"价格 %ld",price];
                NSInteger sellprice = self.xiVM.detailModel.sellPrice;
                self.sellLb.text = [NSString stringWithFormat:@"出售价格 %ld",(long)sellprice];
                [_tableView reloadData];
            }
            [_tableView.mj_header endRefreshing];
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
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
- (UIView *)topView
{
    if(_topView == nil) {
        _topView = [[UIView alloc] init];
        [self.view addSubview:_topView];
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(90);
        }];

    }return _topView;

}
- (TRImageView *)touImg {
	if(_touImg == nil) {
		_touImg = [[TRImageView alloc] init];
        [_topView addSubview:_touImg];

                [_touImg mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(60, 60));
                    make.left.top.mas_equalTo(8);
                }];

	}
	return _touImg;
}

- (UILabel *)nameLb {
	if(_nameLb == nil) {
		_nameLb = [[UILabel alloc] init];
        
      
        [_topView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.touImg.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(self.touImg);
        }];

	}
	return _nameLb;
}

- (UILabel *)parceLb {
	if(_parceLb == nil) {
		_parceLb = [[UILabel alloc] init];
        _parceLb.font=[UIFont systemFontOfSize:12];
        _parceLb.textColor=[UIColor lightGrayColor];
        [_topView addSubview:_parceLb];
        [_parceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.rightMargin.mas_equalTo(self.nameLb);
            make.top.mas_equalTo(self.nameLb.mas_bottom).mas_equalTo(5);
        }];

	}
	return _parceLb;
}

- (UILabel *)sellLb {
	if(_sellLb == nil) {
		_sellLb = [[UILabel alloc] init];
        _sellLb.font=[UIFont systemFontOfSize:12];
        _sellLb.textColor=[UIColor lightGrayColor];
        [_topView addSubview:_sellLb];
        [_sellLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.rightMargin.mas_equalTo(self.nameLb);
            make.top.mas_equalTo(self.parceLb.mas_bottom).mas_equalTo(5);
        }];
	}
	return _sellLb;
}

@end
