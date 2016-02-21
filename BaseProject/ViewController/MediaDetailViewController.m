//
//  MediaDetailViewController.m
//  BaseProject
//
//  Created by Colette71 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MediaDetailViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface MediaDetailCollectionCell : UICollectionViewCell

@property (nonatomic,strong) UILabel *nameLb;

@property (nonatomic,strong) UILabel *timeLb;

@property (nonatomic,strong) UILabel *lengthLb;

@property (nonatomic,strong) TRImageView *iconView;

@property (nonatomic,strong) TRImageView *imageView;

@end

@implementation MediaDetailCollectionCell
- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.font = [UIFont systemFontOfSize:12];
        _nameLb.textAlignment = NSTextAlignmentLeft;
        _nameLb.numberOfLines = 2;
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.top.mas_equalTo(_iconView.mas_bottom).mas_equalTo(0);
            make.height.mas_equalTo(30);
        }];
    }
    return _nameLb;
}

- (TRImageView *)iconView {
    if(_iconView == nil) {
        _iconView = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(_iconView.mas_width).mas_equalTo(-50);
        }];
    }
    return _iconView;
}

- (TRImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [TRImageView new];
        _imageView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [self.iconView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.mas_equalTo(0);
            make.height.mas_equalTo(20);
        }];
    }
    return _imageView;
}

-(UILabel *)lengthLb{
    if (_lengthLb == nil) {
        _lengthLb = [UILabel new];
        [self.imageView addSubview:_lengthLb];
        _lengthLb.font = [UIFont systemFontOfSize:12];
        [_lengthLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(15);
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(80);
        }];
        _lengthLb.textColor = [UIColor whiteColor];
    }
    return _lengthLb;
}

-(UILabel *)timeLb{
    if (_timeLb == nil) {
        _timeLb = [UILabel new];
        [self.imageView addSubview:_timeLb];
        _timeLb.textColor = [UIColor whiteColor];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(50);
        }];
        _lengthLb.font = [UIFont systemFontOfSize:10];
    }
    return _timeLb;
}

@end

#import "MediaDetailViewModel.h"
@interface MediaDetailViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) MediaDetailViewModel *mediaDetailVM;
@end

@implementation MediaDetailViewController

- (id)initWithTag:(NSString *)tag name:(NSString *)name{
    if (self = [super init]) {
        self.tag = tag;
        self.title = name;
        [Factory addBackItemToVC:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.collectionView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.mediaDetailVM.rowNumber;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MediaDetailCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconView.imageView setImageWithURL:[self.mediaDetailVM iconWithRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.nameLb.text = [self.mediaDetailVM nameWithRow:indexPath.row];
//    cell.timeLb.text = [self.mediaDetailVM timeForRow:indexPath.row];
    cell.lengthLb.text = [self.mediaDetailVM lengthWithRow:indexPath.row];
    return cell;
}
#pragma mark - UICollectionViewDataDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    AVPlayerViewController *avc = [AVPlayerViewController new];
    avc.player = [AVPlayer playerWithURL:[self.mediaDetailVM VideoWithRow:indexPath.row]];
    [Factory addEnjoyItemToVC:avc];
    [self presentViewController:avc animated:YES completion:nil];
    
    [avc.player play];
}

#pragma mark - UICollectionViewDelegateFlowLayout
/** section的上下左右边距 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 20, 5, 20);
}
/** 最小行间距 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

/** 最小列间距、因为已经算出每个cell的宽度。 cell的列间距不用指定也会自动适配的*/
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 20;
}

/** 每格cell的 宽高 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kWindowW - 3 * 20) / 2;
    CGFloat height = width - 30 ;  //width + 17
    return CGSizeMake(width, height);
}

- (MediaDetailViewModel *)mediaDetailVM {
    if(_mediaDetailVM == nil) {
        _mediaDetailVM = [[MediaDetailViewModel alloc] initWithTag:self.tag];
    }
    return _mediaDetailVM;
}

- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        [self.view addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.mediaDetailVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_collectionView reloadData];
                }
                [_collectionView.mj_header endRefreshing];
            }];
        }];
        [_collectionView registerClass:[MediaDetailCollectionCell class] forCellWithReuseIdentifier:@"Cell"];
    }
    return _collectionView;
}

@end
