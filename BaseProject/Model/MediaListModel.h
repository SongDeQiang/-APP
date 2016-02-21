//
//  MediaListModel.h
//  BaseProject
//
//  Created by Colette71 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface MediaListModel : BaseModel

@property (nonatomic, copy) NSString *ID;//id

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *qxcount;//count

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger time;

@end

