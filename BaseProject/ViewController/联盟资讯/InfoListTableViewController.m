//
//  InfoListTableViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "InfoListTableViewController.h"
#import "InforMationCell.h"
#import "InformationViewModel.h"
#import "GunDongViewModel.h"
#import "iCarousel.h"
#import "InfoSecondViewController.h"
@interface InfoListTableViewController ()<iCarouselDelegate,iCarouselDataSource>
@property(nonatomic,strong)InformationViewModel *InfoVM;
@property(nonatomic,strong)GunDongViewModel *GunVM;
//是否有滚动视图
@property(nonatomic)BOOL gunD;
@end

@implementation InfoListTableViewController

{//添加成员变量，因为不需要懒加载，所以不需要是属性
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    NSTimer *_timer;
    
}
- (GunDongViewModel *)GunVM
{
    if (!_GunVM) {
        _GunVM = [GunDongViewModel new];
    }return _GunVM;
}
/** 头部滚动视图*/
- (UIView *)headerView{
    [_timer invalidate];
    //    如果当前没有头部视图 返回nil
    if (self.gunD == NO) {
        return nil;
    }
    
    //    头部视图 ， origin无效 宽度无效 肯定是和table同宽
    //    比例 750 * 500
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, kWindowW/750*500)];
    //    添加底部视图
    UIView *buttomView = [UIView new];
    buttomView.backgroundColor = kRGBColor(240, 240, 240);
    [headerView addSubview:buttomView];
    [buttomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    _titleLb = [UILabel new];
    [buttomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages =self.GunVM.rowNumber;
    //禁止与用户的交互(用户点后无反应)
    _pageControl.userInteractionEnabled = NO;
    [buttomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(10);
    }];
    _titleLb.text = [self.GunVM titleForRow:0];
    //    添加滚动栏
    _ic   = [iCarousel new];
    [headerView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(buttomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed = 1;
    _ic.type = 3;
    //    如果只有一张图，则不显示原点
    _pageControl.hidesForSinglePage = YES;
    //    如果只有一张图，则不可滚动
    _ic.scrollEnabled = self.GunVM.rowNumber != 1;
    _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:239/255.0 green:141/255.0 blue:119/255.0 alpha:1.0];
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    if (self.GunVM.rowNumber > 1) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    
    }
    return headerView;
}

#pragma mark - iCarousel Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.GunVM.rowNumber;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750*500 - 35)];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    [imageView setImageWithURL:[self.GunVM iconURLForRow:index] placeholderImage:[UIImage imageNamed:@"bg_create_bar_fail"]];
    return view;
}
//允许循环滚动
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}
/** 监控当前滚动到第几个*/
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    //    NSLog(@"%ld",carousel.currentItemIndex);
    _titleLb.text = [self.GunVM titleForRow:carousel.currentItemIndex];
    _pageControl.currentPage = carousel.currentItemIndex;
}

- (InformationViewModel *)InfoVM
{
    if (!_InfoVM) {
        _InfoVM = [[InformationViewModel alloc]initWithType:_infoType.integerValue];
    }return _InfoVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[InforMationCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
      
        [self.InfoVM refreshDataCompletionHandle:^(NSError *error) {
            if (error) {
               [self showErrorMsg:error];
            }else{

            
            [self.tableView reloadData];
                
            [self.GunVM refreshDataCompletionHandle:^(NSError *error) {
                self.tableView.tableHeaderView = [self headerView];
                
            }];}
            [self.tableView.mj_footer resetNoMoreData];
            [self.tableView.mj_header endRefreshing];
        }];

       
    }];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self.InfoVM getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
                if (error.code == 999) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }}else{
                [self.tableView reloadData];
                
                    [self.tableView.mj_footer endRefreshing];
                    
               

                    
                 
                }
        }];
       }];
    [self.tableView.mj_header beginRefreshing];

}



#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.InfoVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InforMationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.InfoVM titleForRowInList:indexPath.row];
    cell.descLb.text = [self.InfoVM descForRowInList:indexPath.row];
    if ([[self.InfoVM nameForRowInList:indexPath.row] isEqualToString:@"最新"]) {
        self.gunD = YES;
    }else{
        self.gunD = NO;
    }
     [cell.iconView.imageView setImageWithURL:[self.InfoVM iconURLForRowInList:indexPath.row] placeholderImage:[UIImage imageNamed:@"bg_create_bar_fail"]];
    //判断是否是视频播放
    if ([[self.InfoVM btnForRow:indexPath.row] isEqualToString:@"True"]) {
    
//                添加播放标识
        UIImageView *playIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"list_news_play_media_mark"]];
       
        
        [cell.iconView addSubview:playIV];
        [playIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.right.bottom.mas_equalTo(-5);
        }];
        
       
    }
    else {
        for (UIView *view in cell.iconView.subviews) {
            if (![view isEqual:cell.iconView.imageView]) {
                [view removeFromSuperview];
            }
        }
    }

  

    // Configure the cell...
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

kRemoveCellSeparator
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[self.InfoVM lunForRow:indexPath.row] isEqualToString:@"False"]) {
        InfoSecondViewController *vc = [[InfoSecondViewController alloc]initWithURL:[self.InfoVM imageURLForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    if ([[self.InfoVM lunForRow:indexPath.row] isEqualToString:@"True"]) {
        InfoSecondViewController *vc = [[InfoSecondViewController alloc]initWithURL:[self.InfoVM videoURLForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}
//滚动栏选中时候触发
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    if ([[self.GunVM lunForRow:index] isEqualToString:@"False"]) {
        InfoSecondViewController *vc = [[InfoSecondViewController alloc]initWithURL:[self.GunVM imageURLForRow:index]];
       
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([[self.GunVM lunForRow:index] isEqualToString:@"True"]) {
        InfoSecondViewController *vc = [[InfoSecondViewController alloc]initWithURL:[self.GunVM videoURLForRow:index]];
        [self.navigationController pushViewController:vc animated:YES];
    }

}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
