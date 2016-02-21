//
//  MediaViewModel.m
//  BaseProject
//
//  Created by Colette71 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MediaViewModel.h"
#import "MediaListModel.h"
@implementation MediaViewModel

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [MediaListNetManager getMediaCompletionHandle:^(id model, NSError *error) {
        if (!error) {
            self.dataArr = model;
        }
        completionHandle(error);
    }];
}

- (MediaListModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSString *)nameForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}

-(NSString *)IDForRow:(NSInteger)row{
    return [self modelForRow:row].ID;
}

-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].img];
}

@end
