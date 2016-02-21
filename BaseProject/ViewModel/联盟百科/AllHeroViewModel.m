//
//  AllHeroViewModel.m
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AllHeroViewModel.h"

@implementation AllHeroViewModel
-(id)initWithHeroType:(HeroType)type{
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(AllHeroAllModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuoWanNetManager getHeroWithType:_type completionHandle:^(AllHeroModel *model, NSError *error) {
        if (!error) {
            [self.dataArr addObjectsFromArray:model.all];
        }
        completionHandle(error);
    }];
}

-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].cnName;
}

-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",[self modelForRow:row].enName]];
}

@end
