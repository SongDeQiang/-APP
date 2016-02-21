//
//  HeroDetailViewController.h
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllHeroModel.h"
@interface HeroDetailViewController : UIViewController
-(id)initWithHeroModel:(AllHeroAllModel *)heroModel;
@property(nonatomic,strong)AllHeroAllModel *heroModel;
@end
