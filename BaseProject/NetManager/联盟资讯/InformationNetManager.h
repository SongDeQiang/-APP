//
//  InformationNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "InfomationModel.h"
typedef NS_ENUM(NSUInteger, InfoType) {
    InfoTypeZuiXin,
    InfoTypeSaiShi,
//    InfoTypeYueLe,
    InfoTypeGuanFang,
//    InfoTypeMeiNv,
    InfoTypeGonLve,
    InfoTypeHuoDong,
};
@interface InformationNetManager : BaseNetManager
/** Num 切换  Page 第几个页面*/
+(id)getInfoWithInfoType:(InfoType)type Page:(NSInteger)page Data:(NSString *)data kCompletionHandle;
/** 得到滚动视图*/
+ (id)getGunCompletionHandle:(void(^)(id model, NSError *error))completionHandle;
@end
