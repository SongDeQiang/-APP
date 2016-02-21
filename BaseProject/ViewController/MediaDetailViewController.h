//
//  MediaDetailViewController.h
//  BaseProject
//
//  Created by Colette71 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MediaDetailViewController : UIViewController

@property (nonatomic,strong) NSString *tag;

- (id)initWithTag:(NSString *)tag name:(NSString *)name;

@end
