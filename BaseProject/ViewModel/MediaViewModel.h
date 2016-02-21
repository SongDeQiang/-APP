//
//  MediaViewModel.h
//  BaseProject
//
//  Created by Colette71 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "MediaListNetManager.h"
@interface MediaViewModel : BaseViewModel

@property (nonatomic) NSInteger rowNumber;

- (NSURL *)iconURLForRow:(NSInteger)row;

- (NSString *)nameForRow:(NSInteger)row;

- (NSString *)IDForRow:(NSInteger)row;

@end
