//
//  AllHeroDetailViewModel.h
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface AllHeroDetailViewModel : BaseViewModel
-(id)initWithenName:(NSString *)enName;
@property(nonatomic,strong)NSString *enName;
//@property(nonatomic,strong)HeroDetailModel *heroDetail;

@property(nonatomic,assign)NSInteger rowNumber;
-(NSURL *)iconForRow;
-(NSString *)titleForRow;
-(NSString *)tagsForRow;
-(NSString *)priceTitleForRow;


-(NSString *)ratingAttackForRow;
-(NSString *)ratingDefenseForRow;
-(NSString *)ratingMagicForRow;
-(NSString *)ratingDifficultyForRow;

//使用技巧
-(NSString *)tipsForRow;
//应对技巧
-(NSString *)opponentTipsForRow;
//英雄背景
-(NSString *)descForRow;

@end
