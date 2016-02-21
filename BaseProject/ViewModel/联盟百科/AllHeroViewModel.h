//
//  AllHeroViewModel.h
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface AllHeroViewModel : BaseViewModel
@property(nonatomic,assign)NSInteger rowNumber;
-(NSString *)titleForRow:(NSInteger)row;
-(NSURL *)iconURLForRow:(NSInteger)row;

-(id)initWithHeroType:(HeroType)type;
@property(nonatomic,assign)HeroType type;
//用来传参
-(AllHeroAllModel *)modelForRow:(NSInteger)row;
@end
