//
//  MediaDetailViewModel.m
//  BaseProject
//
//  Created by Colette71 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MediaDetailViewModel.h"
#import "MediaListNetManager.h"
#import "MediaListDetailModel.h"
@implementation MediaDetailViewModel

- (id)initWithTag:(NSString *)tag{
    if (self = [super init]) {
        self.tag = tag;
    }
    return self;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [MediaListNetManager getMediaDetailWithID:_tag completionHandle:^(id model, NSError *error) {
        if(!error){
            self.dataArr = model;
        }
        completionHandle(error);
    }];
}

- (MediaListDetailModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

- (NSInteger)rowNumber{
    return self.dataArr.count;
}
- (NSURL *)VideoWithRow:(NSInteger)row{
    return [self modelForRow:row].videoAddrHigh;
}

- (NSString *)nameWithRow:(NSInteger)row{
    return [self modelForRow:row].name;
}

- (NSString *)lengthWithRow:(NSInteger)row{
    NSString *path = [self modelForRow:row].length;
    
    return [NSString stringWithFormat:@"时长 %@",path];
}

/** 获取某行更新时间 */
- (NSString *)timeForRow:(NSInteger)row{
    //    1447088462000 创建时间,距离1970年的秒数
    //获取当前秒数
    NSTimeInterval currentTime= [[NSDate date] timeIntervalSince1970];
    //算出当前时间和创建时间的间隔秒数
    NSTimeInterval delta = currentTime-[self modelForRow:row].time/1000;
    //秒数转小时
    NSInteger hours = delta/3600;
    if (hours < 24) {
        return [NSString stringWithFormat:@"%ld小时前",hours];
    }
    //秒数转天数
    NSInteger days = delta/3600/24;
    return [NSString stringWithFormat:@"%ld天前", days];
}

- (NSURL *)iconWithRow:(NSInteger)row{
    return [self modelForRow:row].img;
}


@end
