//
//  GunDongViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "GunDongViewModel.h"

@implementation GunDongViewModel
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{   _cishu = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
//- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
//{
//    _cishu +=1;
//    [self getMoreDataCompletionHandle:completionHandle];
//}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [InformationNetManager getGunCompletionHandle:^(InfomationModel *model, NSError *error) {
       
        if (_cishu == 1) {
            [self.dataArr removeAllObjects];
        }
         [self.dataArr addObjectsFromArray:model.list];
        completionHandle(error);
    }];
}
- (NSInteger)rowNumber
{
    return self.dataArr.count;
}
- (InfomationListModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
    
}
- (NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].title;
}
- (NSURL *)iconURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].imageUrlBig];
}
/**返回下一页面的网络地址*/
- (NSURL *)imageURLForRow:(NSInteger)row
{
    NSString *path = [NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/%@",[self modelForRow:row].articleUrl];
    return [NSURL URLWithString:path];
    
    
}

/** 返回视频地址*/
- (NSURL *)videoURLForRow:(NSInteger)row
{
    NSString *path = [self modelForRow:row].articleUrl;
    return [NSURL URLWithString:path];
}
/** 返回是什么*/
- (NSString *)btnForRow:(NSInteger)row
{
    return [self modelForRow:row].imageWithBtn;
}
- (NSString *)lunForRow:(NSInteger)row
{
    return [self modelForRow:row].isDirect;
}
@end
