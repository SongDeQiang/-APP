//
//  ZBXiangViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBXiangViewModel.h"

@implementation ZBXiangViewModel
- (id)initWithId:(NSInteger)Id
{
    if (self = [super init]) {
        self.Id = Id;
    }return self;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getItemDetailWithItemId:self.Id completionHandle:^(id model, NSError *error) {
        if (!error) {
            self.detailModel = model;
        }
        completionHandle(error);
    }];
}


- (NSArray *)needImgArr
{
     NSArray *arr = [self.detailModel.need componentsSeparatedByString:@","];
    return arr;
}

- (NSArray *)composeImgArr
{
    NSArray *arr = [self.detailModel.compose componentsSeparatedByString:@","];
    return arr;
}
- (NSInteger)needNum
{
    return self.needImgArr.count;
}
- (NSInteger)composeNum
{
    return self.composeImgArr.count;
}
@end
