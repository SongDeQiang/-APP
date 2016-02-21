//
//  BaiKeViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaiKeViewController.h"
#import "LiveDetailViewController.h"
#import "BestGroupViewController.h"
#import "SumAbilityViewController.h"
#import "ZBCategoryViewController.h"
#import "LinshengViewController.h"
#import "HeroViewController.h"
@interface BaiKeViewController ()
/** 背景图*/
@property(nonatomic,strong)UIView *bigView;
@property (nonatomic,strong)UIButton *bB1;
@property (nonatomic,strong)UIButton *bB2;
@property (nonatomic,strong)UIButton *bB3;
@property (nonatomic,strong)UIButton *bB4;
@property (nonatomic,strong)UIButton *bB5;
@property (nonatomic,strong)UIButton *bB6;
@property (nonatomic,strong)UIButton *bB7;
@property (nonatomic,strong)UIButton *bB8;
@property (nonatomic,strong)UIButton *bB9;
/** 第一视图*/
@property(nonatomic,strong)UIView *oneView;
/** 第一个image*/
@property(nonatomic,strong)UIImageView *oneIV;
/** 第一个扁平化按钮*/
@property(nonatomic,strong)FUIButton *oneBt2;
/** 第二视图*/
@property (nonatomic,strong)UIView *twoView;
/** 第二个image*/
@property (nonatomic,strong)UIImageView *twoIV;
/** 第二个按钮*/
@property (nonatomic,strong)FUIButton *twoBt;
/** 第3视图*/
@property (nonatomic,strong)UIView *threeView;
/** 第3个image*/
@property (nonatomic,strong)UIImageView *threeIV;
/** 第3个按钮*/
@property (nonatomic,strong)FUIButton *threeBt;
/** 第4视图*/
@property (nonatomic,strong)UIView *fourView;
/** 第4个image*/
@property (nonatomic,strong)UIImageView *fourIV;
/** 第4个按钮*/
@property (nonatomic,strong)FUIButton *fourBt;
/** 第5视图*/
@property (nonatomic,strong)UIView *fiveView;
/** 第5个image*/
@property (nonatomic,strong)UIImageView *fiveIV;
/** 第5个按钮*/
@property (nonatomic,strong)FUIButton *fiveBt;
/** 第6视图*/
@property (nonatomic,strong)UIView *sixView;
/** 第6个image*/
@property (nonatomic,strong)UIImageView *sixIV;
/** 第6个按钮*/
@property (nonatomic,strong)FUIButton *sixBt;
/** 第7视图*/
@property (nonatomic,strong)UIView *sevenView;
/** 第7个image*/
@property (nonatomic,strong)UIImageView *sevenIV;
/** 第7个按钮*/
@property (nonatomic,strong)FUIButton *sevenBt;
/** 第8视图*/
@property (nonatomic,strong)UIView *eightView;
/** 第8个image*/
@property (nonatomic,strong)UIImageView *eightIV;
/** 第8个按钮*/
@property (nonatomic,strong)FUIButton *eightBt;
/** 第9视图*/
@property (nonatomic,strong)UIView *nineView;
/** 第9个image*/
@property (nonatomic,strong)UIImageView *nineIV;
/** 第9个按钮*/
@property (nonatomic,strong)FUIButton *nineBt;

@end

@implementation BaiKeViewController
/** 单例*/
+ (UINavigationController *)defaultNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        BaiKeViewController *vc = [BaiKeViewController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });return navi;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.title = @"小刚百科";
//    self.bigView.backgroundColor = kRGBColor(27, 30, 42);
    self.bigView.backgroundColor = [UIColor lightGrayColor];
    /** 第一个按钮*/
    self.oneView.backgroundColor = [UIColor whiteColor];
    [self.bB1 bk_addEventHandler:^(id sender) {
        NSURL *url = [NSURL URLWithString:@"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView"];
        NSURLRequest *req = [[NSURLRequest alloc]initWithURL:url];
        LiveDetailViewController *vc = [[LiveDetailViewController alloc]initWithRequest:req Name:self.oneBt2.titleLabel.text];
        [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    self.oneIV.image = [UIImage imageNamed:@"icon_card.png"];
    [self.oneBt2 bk_addEventHandler:^(id sender) {
        NSURL *url = [NSURL URLWithString:@"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView"];
                NSURLRequest *req = [[NSURLRequest alloc]initWithURL:url];
                LiveDetailViewController *vc = [[LiveDetailViewController alloc]initWithRequest:req Name:self.oneBt2.titleLabel.text];
                [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    /** 第二个按钮*/
    self.twoView.backgroundColor = [UIColor whiteColor];
    [self.bB2 bk_addEventHandler:^(id sender) {
        BestGroupViewController *vc = [BestGroupViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    self.twoIV.image = [UIImage imageNamed:@"icon_paihang"];
    [self.twoBt bk_addEventHandler:^(id sender) {
        BestGroupViewController *vc = [BestGroupViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    /** 第三个按钮*/
    self.threeView.backgroundColor = [UIColor whiteColor];
    [self.bB3 bk_addEventHandler:^(id sender) {
        SumAbilityViewController *vc = [SumAbilityViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    self.threeIV.image = [UIImage imageNamed:@"icon_duizhen"];
    [self.threeBt bk_addEventHandler:^(id sender) {
        SumAbilityViewController *vc = [SumAbilityViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    /** 第四个按钮*/
    self.fourView.backgroundColor = [UIColor whiteColor];
    [self.bB4 bk_addEventHandler:^(id sender) {
        ZBCategoryViewController *vc = [ZBCategoryViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    self.fourIV.image = [UIImage imageNamed:@"icon_wupin"];
    [self.fourBt bk_addEventHandler:^(id sender) {
        ZBCategoryViewController *vc = [ZBCategoryViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    /** 第五个按钮 英雄展示*/
    self.fiveView.backgroundColor = [UIColor whiteColor];
    [self.bB5 bk_addEventHandler:^(id sender) {
        HeroViewController *vc = [HeroViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    self.fiveIV.image = [UIImage imageNamed:@"icon_fuwen"];
    [self.fiveBt bk_addEventHandler:^(id sender) {
        HeroViewController *vc = [HeroViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    /** 第六个按钮 关键字*/
    self.sixView.backgroundColor = [UIColor whiteColor];
    [self.bB6 bk_addEventHandler:^(id sender) {
        NSURL *url = [NSURL URLWithString:@"http://service.mbox.duowan.com/index.php?r=tags/index"];
        NSURLRequest *quest = [NSURLRequest requestWithURL:url];
        NSString *str =@"LOL关键字查询";
        LiveDetailViewController *vc = [[LiveDetailViewController alloc]initWithRequest:quest Name:str];
        [self.navigationController pushViewController:vc animated:YES];
        
    } forControlEvents:UIControlEventTouchUpInside];
    self.sixIV.image = [UIImage imageNamed:@"icon_pingheng"];
    [self.sixBt bk_addEventHandler:^(id sender) {
        NSURL *url = [NSURL URLWithString:@"http://service.mbox.duowan.com/index.php?r=tags/index"];
        NSURLRequest *quest = [NSURLRequest requestWithURL:url];
        NSString *str =@"LOL关键字查询";
        LiveDetailViewController *vc = [[LiveDetailViewController alloc]initWithRequest:quest Name:str];
        [self.navigationController pushViewController:vc animated:YES];
        
    } forControlEvents:UIControlEventTouchUpInside];
    /** 第七个按钮 铃声*/
    self.sevenView.backgroundColor = [UIColor whiteColor];
    [self.bB7 bk_addEventHandler:^(id sender) {
        LinshengViewController *vc = [LinshengViewController new];
        [self.navigationController pushViewController:vc animated:YES];
        
    } forControlEvents:UIControlEventTouchUpInside];
    self.sevenIV.image = [UIImage imageNamed:@"icon_sound"];
    [self.sevenBt bk_addEventHandler:^(id sender) {
        LinshengViewController *vc = [LinshengViewController new];
        [self.navigationController pushViewController:vc animated:YES];
        
    } forControlEvents:UIControlEventTouchUpInside];
    /** 第八个按钮 小游戏*/
    self.eightView.backgroundColor = [UIColor whiteColor];
    [self.bB8 bk_addEventHandler:^(id sender) {
        NSURL *url = [NSURL URLWithString:@"http://guess.anzogame.com/test/index?id=1&v=2"];
        NSURLRequest *quest = [NSURLRequest requestWithURL:url];
        LiveDetailViewController *vc = [[LiveDetailViewController alloc]initWithRequest:quest Name:_eightBt.titleLabel.text];
        [self.navigationController pushViewController:vc animated:YES];
        
    } forControlEvents:UIControlEventTouchUpInside];
    self.eightIV.image = [UIImage imageNamed:@"icon_paihang"];
    [self.eightBt bk_addEventHandler:^(id sender) {
        NSURL *url = [NSURL URLWithString:@"http://guess.anzogame.com/test/index?id=1&v=2"];
        NSURLRequest *quest = [NSURLRequest requestWithURL:url];
        LiveDetailViewController *vc = [[LiveDetailViewController alloc]initWithRequest:quest Name:_eightBt.titleLabel.text];
        [self.navigationController pushViewController:vc animated:YES];
        
    } forControlEvents:UIControlEventTouchUpInside];
    /** 第九个按钮 撸小说*/
    self.nineView.backgroundColor = [UIColor whiteColor];
    [self.bB9 bk_addEventHandler:^(id sender) {
        NSURL *url = [NSURL URLWithString:@"http://m.ouj.com/box?channel=baike"];
        NSURLRequest *quest = [NSURLRequest requestWithURL:url];
        LiveDetailViewController *vc = [[LiveDetailViewController alloc]initWithRequest:quest Name:_nineBt.titleLabel.text];
        [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    self.nineIV.image = [UIImage imageNamed:@"icon_gonglue"];
    [self.nineBt bk_addEventHandler:^(id sender) {
        NSURL *url = [NSURL URLWithString:@"http://m.ouj.com/box?channel=baike"];
        NSURLRequest *quest = [NSURLRequest requestWithURL:url];
        LiveDetailViewController *vc = [[LiveDetailViewController alloc]initWithRequest:quest Name:_nineBt.titleLabel.text];
        [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    
}

- (UIView *)bigView {
    if(_bigView == nil) {
        _bigView = [[UIView alloc] init];
        [self.view addSubview:_bigView];
        [_bigView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _bigView;
}
/** 第一个按钮*/
- (UIView *)oneView {
    if(_oneView == nil) {
        _oneView = [[UIView alloc] init];
        [self.bigView addSubview:_oneView];
        [_oneView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(kWindowW/3, kWindowW/3));
        }];
        _oneView.layer.borderColor = kRGBColor(220, 220, 220).CGColor;
        _oneView.layer.borderWidth = 1;
    }
    return _oneView;
}
- (UIButton *)bB1
{
    if (!_bB1) {
        _bB1 = [UIButton buttonWithType:0];
        _bB1.backgroundColor = [UIColor clearColor];
        [_oneView addSubview:_bB1];
        [_bB1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }return _bB1;
}
- (UIImageView *)oneIV {
    if(_oneIV == nil) {
        _oneIV = [[UIImageView alloc] init];
        [self.oneView addSubview:_oneIV];
        [_oneIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(kWindowW/5, kWindowW/5));
        }];
    }
    return _oneIV;
}
- (FUIButton *)oneBt2
{
   if (!_oneBt2) {
        _oneBt2 = [FUIButton buttonWithType:0];
        _oneBt2.buttonColor = [UIColor turquoiseColor];
        _oneBt2.shadowColor = [UIColor greenSeaColor];
        _oneBt2.shadowHeight = 3.0;
        _oneBt2.cornerRadius = 6.0;
        _oneBt2.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_oneBt2 setTitleColor:[UIColor cloudsColor] forState:0];
        [_oneBt2 setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [self.oneView addSubview:_oneBt2];
        [_oneBt2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(self.oneIV.mas_width).mas_equalTo(0);
            make.top.mas_equalTo(self.oneIV.mas_bottom).mas_equalTo(0);
        }];
        [_oneBt2 setTitle:@"战绩查询" forState:0 ];

    }return _oneBt2;
}
/** 第二个按钮*/
- (UIView *)twoView {
    if(_twoView == nil) {
        _twoView = [[UIView alloc] init];
        [self.bigView addSubview:_twoView];
        [_twoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.oneView.mas_right).mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(kWindowW/3, kWindowW/3));
        }];
        _twoView.layer.borderColor = kRGBColor(220, 220, 220).CGColor;
        _twoView.layer.borderWidth = 1;
    }
    return _twoView;
}
- (UIButton *)bB2
{
    if (!_bB2) {
        _bB2 = [UIButton buttonWithType:0];
        _bB2.backgroundColor = [UIColor clearColor];
        [_twoView addSubview:_bB2];
        [_bB2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }return _bB2;
}

- (UIImageView *)twoIV {
    if(_twoIV == nil) {
        _twoIV = [[UIImageView alloc] init];
        [self.twoView addSubview:_twoIV];
        [_twoIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(kWindowW/5, kWindowW/5));
        }];
        
    }
    return _twoIV;
}
- (FUIButton *)twoBt
{
    if (!_twoBt) {
        _twoBt = [FUIButton buttonWithType:0];
        _twoBt.buttonColor = [UIColor turquoiseColor];
        _twoBt.shadowColor = [UIColor greenSeaColor];
        _twoBt.shadowHeight = 3.0;
        _twoBt.cornerRadius = 6.0;
        _twoBt.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_twoBt setTitleColor:[UIColor cloudsColor] forState:0];
        [_twoBt setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [self.twoView addSubview:_twoBt];
        [_twoBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(self.oneIV.mas_width).mas_equalTo(0);
            make.top.mas_equalTo(self.oneIV.mas_bottom).mas_equalTo(0);
        }];
        [_twoBt setTitle:@"最佳阵容" forState:0 ];
        
    }return _twoBt;
}
/** 第三个按钮*/
- (UIView *)threeView {
    if(_threeView == nil) {
        _threeView = [[UIView alloc] init];
        [self.bigView addSubview:_threeView];
        [_threeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.twoView.mas_right).mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(kWindowW/3, kWindowW/3));
        }];
        _threeView.layer.borderColor = kRGBColor(220, 220, 220).CGColor;
        _threeView.layer.borderWidth = 1;
    }
    return _threeView;
}
- (UIButton *)bB3
{
    if (!_bB3) {
        _bB3 = [UIButton buttonWithType:0];
        _bB3.backgroundColor = [UIColor clearColor];
        [_threeView addSubview:_bB3];
        [_bB3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }return _bB3;
}
- (UIImageView *)threeIV {
    if(_threeIV == nil) {
        _threeIV = [[UIImageView alloc] init];
        [self.threeView addSubview:_threeIV];
        [_threeIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(kWindowW/5, kWindowW/5));
        }];
        
    }
    return _threeIV;
}
- (FUIButton *)threeBt
{
    if (!_threeBt) {
        _threeBt = [FUIButton buttonWithType:0];
        _threeBt.buttonColor = [UIColor turquoiseColor];
        _threeBt.shadowColor = [UIColor greenSeaColor];
        _threeBt.shadowHeight = 3.0;
        _threeBt.cornerRadius = 6.0;
        _threeBt.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_threeBt setTitleColor:[UIColor cloudsColor] forState:0];
        [_threeBt setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [self.threeView addSubview:_threeBt];
        [_threeBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(self.oneIV.mas_width).mas_equalTo(0);
            make.top.mas_equalTo(self.oneIV.mas_bottom).mas_equalTo(0);
        }];
        [_threeBt setTitle:@"技  能" forState:0 ];
        
    }return _threeBt;
}
/** 第四个按钮*/
- (UIView *)fourView {
    if(_fourView == nil) {
        _fourView = [[UIView alloc] init];
        [self.bigView addSubview:_fourView];
        [_fourView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(self.oneView.mas_bottom).mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(kWindowW/3, kWindowW/3));
        }];
        _fourView.layer.borderColor = kRGBColor(220, 220, 220).CGColor;
        _fourView.layer.borderWidth = 1;
    }
    return _fourView;
}
- (UIButton *)bB4
{
    if (!_bB4) {
        _bB4 = [UIButton buttonWithType:0];
        _bB4.backgroundColor = [UIColor clearColor];
        [_fourView addSubview:_bB4];
        [_bB4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }return _bB4;
}
- (UIImageView *)fourIV {
    if(_fourIV == nil) {
       _fourIV = [[UIImageView alloc] init];
        [self.fourView addSubview:_fourIV];
        [_fourIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(kWindowW/5, kWindowW/5));
        }];
    }
    return _fourIV;
}
- (FUIButton *)fourBt
{
    if (!_fourBt) {
        _fourBt = [FUIButton buttonWithType:0];
        _fourBt.buttonColor = [UIColor turquoiseColor];
        _fourBt.shadowColor = [UIColor greenSeaColor];
        _fourBt.shadowHeight = 3.0;
        _fourBt.cornerRadius = 6.0;
        _fourBt.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_fourBt setTitleColor:[UIColor cloudsColor] forState:0];
        [_fourBt setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [self.fourView addSubview:_fourBt];
        [_fourBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(self.fourIV.mas_width).mas_equalTo(0);
            make.top.mas_equalTo(self.fourIV.mas_bottom).mas_equalTo(0);
        }];
        [_fourBt setTitle:@"装备列表" forState:0 ];
        
    }return _fourBt;
}
/** 第五个按钮*/
- (UIView *)fiveView {
    if(_fiveView  == nil) {
        _fiveView = [[UIView alloc] init];
        [self.bigView addSubview:_fiveView];
        [_fiveView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.fourView.mas_right).mas_equalTo(0);
            make.top.mas_equalTo(self.twoView.mas_bottom).mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(kWindowW/3, kWindowW/3));
        }];
        _fiveView.layer.borderColor = kRGBColor(220, 220, 220).CGColor;
        _fiveView.layer.borderWidth = 1;
    }
    return _fiveView;
}
- (UIButton *)bB5
{
    if (!_bB5) {
        _bB5 = [UIButton buttonWithType:0];
        _bB5.backgroundColor = [UIColor clearColor];
        [_fiveView addSubview:_bB5];
        [_bB5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }return _bB5;
}
- (UIImageView *)fiveIV {
    if(_fiveIV == nil) {
        _fiveIV = [[UIImageView alloc] init];
        [self.fiveView addSubview:_fiveIV];
        [_fiveIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(kWindowW/5, kWindowW/5));
        }];
    }
    return _fiveIV;
}
- (FUIButton *)fiveBt
{
    if (!_fiveBt) {
        _fiveBt = [FUIButton buttonWithType:0];
        _fiveBt.buttonColor = [UIColor turquoiseColor];
        _fiveBt.shadowColor = [UIColor greenSeaColor];
        _fiveBt.shadowHeight = 3.0;
       _fiveBt.cornerRadius = 6.0;
        _fiveBt.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_fiveBt setTitleColor:[UIColor cloudsColor] forState:0];
        [_fiveBt setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [self.fiveView addSubview:_fiveBt];
        [_fiveBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(self.fiveIV.mas_width).mas_equalTo(0);
            make.top.mas_equalTo(self.fiveIV.mas_bottom).mas_equalTo(0);
        }];
        [_fiveBt setTitle:@"英雄展示" forState:0 ];
        
    }return _fiveBt;
}
/** 第6个按钮*/
- (UIView *)sixView {
    if(_sixView  == nil) {
       _sixView = [[UIView alloc] init];
        [self.bigView addSubview:_sixView];
        [_sixView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.fiveView.mas_right).mas_equalTo(0);
            make.top.mas_equalTo(self.threeView.mas_bottom).mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(kWindowW/3, kWindowW/3));
        }];
        _sixView.layer.borderColor = kRGBColor(220, 220, 220).CGColor;
        _sixView.layer.borderWidth = 1;
    }
    return _sixView;
}
- (UIButton *)bB6
{
    if (!_bB6) {
        _bB6 = [UIButton buttonWithType:0];
        _bB6.backgroundColor = [UIColor clearColor];
        [_sixView addSubview:_bB6];
        [_bB6 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }return _bB6;
}
- (UIImageView *)sixIV {
    if(_sixIV == nil) {
        _sixIV = [[UIImageView alloc] init];
        [self.sixView addSubview:_sixIV];
        [_sixIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(kWindowW/5, kWindowW/5));
        }];
    }
    return _sixIV;
}
- (FUIButton *)sixBt
{
    if (!_sixBt) {
        _sixBt = [FUIButton buttonWithType:0];
        _sixBt.buttonColor = [UIColor turquoiseColor];
        _sixBt.shadowColor = [UIColor greenSeaColor];
        _sixBt.shadowHeight = 3.0;
        _sixBt.cornerRadius = 6.0;
        _sixBt.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_sixBt setTitleColor:[UIColor cloudsColor] forState:0];
        [_sixBt setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [self.sixView addSubview:_sixBt];
        [_sixBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(self.sixIV.mas_width).mas_equalTo(0);
            make.top.mas_equalTo(self.sixIV.mas_bottom).mas_equalTo(0);
        }];
        [_sixBt setTitle:@"关键字" forState:0 ];
        
    }return _sixBt;
}
/** 第7个按钮*/
- (UIView *)sevenView {
    if(_sevenView  == nil) {
        _sevenView = [[UIView alloc] init];
        [self.bigView addSubview:_sevenView];
        [_sevenView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(self.fourView.mas_bottom).mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(kWindowW/3, kWindowW/3));
        }];
        _sevenView.layer.borderColor = kRGBColor(220, 220, 220).CGColor;
        _sevenView.layer.borderWidth = 1;
    }
    return _sevenView;
}
- (UIButton *)bB7
{
    if (!_bB7) {
        _bB7 = [UIButton buttonWithType:0];
        _bB7.backgroundColor = [UIColor clearColor];
        [_sevenView addSubview:_bB7];
        [_bB7 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }return _bB7;
}
- (UIImageView *)sevenIV {
    if(_sevenIV == nil) {
        _sevenIV = [[UIImageView alloc] init];
        [self.sevenView addSubview:_sevenIV];
        [_sevenIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(kWindowW/5, kWindowW/5));
        }];
    }
    return _sevenIV;
}
- (FUIButton *)sevenBt
{
    if (!_sevenBt) {
        _sevenBt = [FUIButton buttonWithType:0];
        _sevenBt.buttonColor = [UIColor turquoiseColor];
        _sevenBt.shadowColor = [UIColor greenSeaColor];
        _sevenBt.shadowHeight = 3.0;
        _sevenBt.cornerRadius = 6.0;
        _sevenBt.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_sevenBt setTitleColor:[UIColor cloudsColor] forState:0];
        [_sevenBt setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [self.sevenView addSubview:_sevenBt];
        [_sevenBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(self.sixIV.mas_width).mas_equalTo(0);
            make.top.mas_equalTo(self.sevenIV.mas_bottom).mas_equalTo(0);
        }];
        [_sevenBt setTitle:@"铃声" forState:0 ];
        
    }return _sevenBt;
}
/** 第8个按钮*/
- (UIView *)eightView {
    if(_eightView  == nil) {
        _eightView = [[UIView alloc] init];
        [self.bigView addSubview:_eightView];
        [_eightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.sevenView.mas_right).mas_equalTo(0);
            make.top.mas_equalTo(self.fiveView.mas_bottom).mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(kWindowW/3, kWindowW/3));
        }];
        _eightView.layer.borderColor = kRGBColor(220, 220, 220).CGColor;
        _eightView.layer.borderWidth = 1;
    }
    return _eightView;
}
- (UIButton *)bB8
{
    if (!_bB8) {
        _bB8 = [UIButton buttonWithType:0];
        _bB8.backgroundColor = [UIColor clearColor];
        [_eightView addSubview:_bB8];
        [_bB8 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }return _bB8;
}
- (UIImageView *)eightIV {
    if(_eightIV == nil) {
        _eightIV = [[UIImageView alloc] init];
        [self.eightView addSubview:_eightIV];
        [_eightIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(kWindowW/5, kWindowW/5));
        }];
    }
    return _eightIV;
}
- (FUIButton *)eightBt
{
    if (!_eightBt) {
        _eightBt = [FUIButton buttonWithType:0];
       _eightBt.buttonColor = [UIColor turquoiseColor];
        _eightBt.shadowColor = [UIColor greenSeaColor];
        _eightBt.shadowHeight = 3.0;
        _eightBt.cornerRadius = 6.0;
        _eightBt.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_eightBt setTitleColor:[UIColor cloudsColor] forState:0];
        [_eightBt setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [self.eightView addSubview:_eightBt];
        [_eightBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(self.sixIV.mas_width).mas_equalTo(0);
            make.top.mas_equalTo(self.eightIV.mas_bottom).mas_equalTo(0);
        }];
        [_eightBt setTitle:@"小游戏" forState:0 ];
        
    }return _eightBt;
}
/** 第9个按钮*/
- (UIView *)nineView {
    if(_nineView  == nil) {
        _nineView = [[UIView alloc] init];
        [self.bigView addSubview:_nineView];
        [_nineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.eightView.mas_right).mas_equalTo(0);
            make.top.mas_equalTo(self.sixView.mas_bottom).mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(kWindowW/3, kWindowW/3));
        }];
        _nineView.layer.borderColor = kRGBColor(220, 220, 220).CGColor;
        _nineView.layer.borderWidth = 1;
    }
    return _nineView;
}
- (UIButton *)bB9
{
    if (!_bB9) {
        _bB9 = [UIButton buttonWithType:0];
        _bB9.backgroundColor = [UIColor clearColor];
        [_nineView addSubview:_bB9];
        [_bB9 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }return _bB9;
}
- (UIImageView *)nineIV {
    if(_nineIV == nil) {
        _nineIV = [[UIImageView alloc] init];
        [self.nineView addSubview:_nineIV];
        [_nineIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(kWindowW/5, kWindowW/5));
        }];
    }
    return _nineIV;
}
- (FUIButton *)nineBt
{
    if (!_nineBt) {
        _nineBt = [FUIButton buttonWithType:0];
        _nineBt.buttonColor = [UIColor turquoiseColor];
        _nineBt.shadowColor = [UIColor greenSeaColor];
        _nineBt.shadowHeight = 3.0;
        _nineBt.cornerRadius = 6.0;
        _nineBt.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_nineBt setTitleColor:[UIColor cloudsColor] forState:0];
        [_nineBt setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [self.nineView addSubview:_nineBt];
        [_nineBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(self.sixIV.mas_width).mas_equalTo(0);
            make.top.mas_equalTo(self.nineIV.mas_bottom).mas_equalTo(0);
        }];
        [_nineBt setTitle:@"撸小说" forState:0 ];
        
    }return _nineBt;
}
@end
