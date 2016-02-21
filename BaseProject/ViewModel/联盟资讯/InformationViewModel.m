//
//  InformationViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "InformationViewModel.h"

@implementation InformationViewModel

-(instancetype)initWithType:(InfoType)type
{
    if (self = [super init]) {
        _type = type;
    }return self;
}

//预防性编程，防止没有使用上方初始化
- (id)init{
    if (self = [super init]) {
        NSAssert1(NO, @"%s 必须使用initWithType出事化", __func__);
    }return self;
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _page = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    if (self.nextPage == nil) {
        //        [self showErrorMsg:@"没有更多数据"];
        NSError *err = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多数据了"}];
        
        completionHandle(err);
        return;
    }

    _page += 1;
    [self getDataFromNetCompleteHandle:completionHandle];

}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    if (_page == 1) {
        self.dataTask = [InformationNetManager getInfoWithInfoType:_type Page:_page Data:nil completionHandle:^(InfomationModel *model, NSError *error) {
            if (!error) {
                [self.dataArr removeAllObjects];
                [self.dataArr addObjectsFromArray:model.list];
                self.nextPage= model.next;
               
            }
            completionHandle(error);
        }];
    }else{
        self.dataTask = [InformationNetManager getInfoWithInfoType:_type Page:_page Data:_nextPage completionHandle:^(InfomationModel *model, NSError *error) {
            if (!error) {
                [self.dataArr addObjectsFromArray:model.list];
                self.nextPage = model.next;
               
            }
            completionHandle(error);
        }];
        
    }
        
    
    
}
//- (NSInteger)maxPage
//{
//    return 4;
//}
//- (BOOL)isHasMore
//{
//    return self.maxPage > _page;
//}
- (NSInteger)rowNumber
{
    return self.dataArr.count;
}
- (InfomationListModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
- (NSURL *)iconURLForRowInList:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].imageUrlBig];
}
- (NSString *)titleForRowInList:(NSInteger)row
{
    return [self modelForRow:row].title;
}
-(NSString *)descForRowInList:(NSInteger)row
{
    return [self modelForRow:row].summary;
}
/**   此处需要改*/
- (NSString *)dataForRowInList:(NSInteger)row
{
  
    return [self modelForRow:row].publicationDate;
}
/** 返回列表的名字*/
- (NSString *)nameForRowInList:(NSInteger)row
{
    
    return [self modelForRow:row].channelDesc;
    
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
/** 返回是不是视频*/
- (NSString *)btnForRow:(NSInteger)row
{
    return [self modelForRow:row].imageWithBtn;
}
/** 返回论坛*/
- (NSString *)lunForRow:(NSInteger)row
{
    return [self modelForRow:row].isDirect;
}
@end
