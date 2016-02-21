//
//  MediaListDetailModel.h
//  BaseProject
//
//  Created by Colette71 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface MediaListDetailModel : BaseModel

@property (nonatomic, copy) NSString *qxid;//id

@property (nonatomic, assign) NSInteger downloadMode;

@property (nonatomic, assign) NSInteger time;

@property (nonatomic, copy) NSURL *videoAddrSuper;

@property (nonatomic, copy) NSURL *img;

@property (nonatomic, copy) NSString *length;

@property (nonatomic, copy) NSURL *videoAddrHigh;

@property (nonatomic, assign) NSInteger playType;

@property (nonatomic, copy) NSString *youkuId;

@property (nonatomic, assign) NSInteger openType;

@property (nonatomic, assign) NSInteger playMode;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSURL *videoAddr;

@end

