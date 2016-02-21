//
//  InfomationModel.h
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class InfomationListModel;
@interface InfomationModel : BaseModel

@property (nonatomic, strong) NSArray<InfomationListModel *> *list;

@property (nonatomic, copy) NSString *next;

@property (nonatomic, copy) NSString *thisPageNum;

@end
@interface InfomationListModel : BaseModel

@property (nonatomic, copy) NSString *isDirect;

@property (nonatomic, copy) NSString *channelDesc;

@property (nonatomic, copy) NSString *articleId;

@property (nonatomic, copy) NSString *imageSpec;

@property (nonatomic, copy) NSString *isTop;

@property (nonatomic, copy) NSString *publicationDate;

@property (nonatomic, copy) NSString *imageWithBtn;

@property (nonatomic, copy) NSString *imageUrlBig;

@property (nonatomic, copy) NSString *targetid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *channelId;

@property (nonatomic, copy) NSString *summary;

@property (nonatomic, copy) NSString *articleUrl;

@property (nonatomic, copy) NSString *imageUrlSmall;

@property (nonatomic, copy) NSString *isNew;

@property (nonatomic, copy) NSString *insertDate;

@property (nonatomic, copy) NSString *isAct;

@property (nonatomic, copy) NSString *score;

@property (nonatomic, copy) NSString *isHot;

@end

