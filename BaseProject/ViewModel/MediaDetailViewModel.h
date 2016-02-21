//
//  MediaDetailViewModel.h
//  BaseProject
//
//  Created by Colette71 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface MediaDetailViewModel : BaseViewModel

@property (nonatomic) NSInteger rowNumber;

@property (nonatomic,strong) NSString *tag;

- (id)initWithTag:(NSString *)tag;

/** 
 "img": "http://r1.ykimg.com/054104085642A9E26A0A4D0475080CA9",
 "length": "20:40",
 "name": "《最强擂台2》24 自带奶妈 冰女3000血全吸干",
 "open_type": 1,
 "play_mode": 1,
 "play_type": 1,
 "time": 1447257599,
 "video_addr"
 */

- (NSURL *)VideoWithRow:(NSInteger)row;

- (NSString *)nameWithRow:(NSInteger)row;

- (NSString *)lengthWithRow:(NSInteger)row;

- (NSString *)timeForRow:(NSInteger)row;

- (NSURL *)iconWithRow:(NSInteger)row;


@end
