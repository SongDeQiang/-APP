//
//  MediaListDetailModel.m
//  BaseProject
//
//  Created by Colette71 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MediaListDetailModel.h"

@implementation MediaListDetailModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"qxid":@"id"};
}

+(NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName mj_underlineFromCamel];
}

@end


