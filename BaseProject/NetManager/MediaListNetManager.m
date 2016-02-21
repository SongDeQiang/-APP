//
//  MediaListNetManager.m
//  BaseProject
//
//  Created by Colette71 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MediaListNetManager.h"
#import "MediaListModel.h"
#import "MediaListDetailModel.h"
@implementation MediaListNetManager

+ (id)getMediaCompletionHandle:(void(^)(id model, NSError *error))completionHandle{
    NSString *path = [NSString stringWithFormat:@"http://lolbox.oss.aliyuncs.com/json/v4/videotype_3.json?"];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([MediaListModel mj_objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

+ (id)getMediaDetailWithID:(NSString*)ID completionHandle:(void(^)(id model, NSError *error))completionHandle{
    NSString *path = [NSString stringWithFormat:@"http://lolbox.oss.aliyuncs.com/json/v4/video/videolist_3_%@_1.json?",ID];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([MediaListDetailModel mj_objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

@end
