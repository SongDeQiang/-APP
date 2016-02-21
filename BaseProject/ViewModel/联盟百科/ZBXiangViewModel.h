//
//  ZBXiangViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface ZBXiangViewModel : BaseViewModel
- (id)initWithId:(NSInteger)Id;

@property(nonatomic)NSInteger Id;

@property(nonatomic,strong)ItemDetailModel *detailModel;

@property(nonatomic,strong)NSArray *needImgArr;
@property(nonatomic,strong)NSArray *composeImgArr;
@property(nonatomic)NSInteger needNum;
@property(nonatomic)NSInteger composeNum;

@end
