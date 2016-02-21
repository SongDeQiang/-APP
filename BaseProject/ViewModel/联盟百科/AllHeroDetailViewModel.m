///
//  AllHeroDetailViewModel.m
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AllHeroDetailViewModel.h"

@implementation AllHeroDetailViewModel
-(id)initWithenName:(NSString *)enName{
    if (self = [super init]) {
        self.enName = enName;
    }
    return self;
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

//-(HeroDetailModel *)modelForRow:(NSInteger)row{
//    return self.dataArr[row];
//}
-(HeroDetailModel *)model{
    return self.dataArr.firstObject;
   // return self.heroDetail;
}

-(NSURL *)iconForRow{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",[self model].name]];
}
//   //
-(NSString *)titleForRow{
    return [self model].title;
}
-(NSString *)tagsForRow{
    return [self model].tags;
}
-(NSString *)priceTitleForRow{
    return [self model].price;
}


-(NSString *)ratingAttackForRow{
    return [self model].ratingAttack;
}
-(NSString *)ratingDefenseForRow{
    return  [self model].ratingDefense;
}
-(NSString *)ratingMagicForRow{
    return  [self model].ratingMagic;
}
-(NSString *)ratingDifficultyForRow{
    return [self model].ratingDifficulty;
}

//使用技巧
-(NSString *)tipsForRow{
    return [self model].tips;
}
//应对技巧
-(NSString *)opponentTipsForRow{
    return  [self model].opponentTips;
}
//英雄背景
-(NSString *)descForRow{
    return [self model].desc;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuoWanNetManager getHeroDetailWithHeroName:_enName completionHandle:^(HeroDetailModel *model, NSError *error) {
        if (!error) {
            //self.heroDetail = model;
            [self.dataArr addObject:model];
        }
        completionHandle(error);
    }];
}
@end
