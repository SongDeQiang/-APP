//
//  MediaListNetManager.h
//  BaseProject
//
//  Created by Colette71 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

@interface MediaListNetManager : BaseNetManager

+ (id)getMediaCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

+ (id)getMediaDetailWithID:(NSString*)ID completionHandle:(void(^)(id model, NSError *error))completionHandle;

@end
