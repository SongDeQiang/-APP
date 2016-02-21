//
//  MediaListModel.m
//  BaseProject
//
//  Created by Colette71 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MediaListModel.h"

@implementation MediaListModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id",@"qxcount":@"count"};
}

@end


