//
//  HeroTimeDetailViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroTimeDetailViewController : UIViewController
-(id)initWithRequest:(NSURLRequest *)request;
@property(nonatomic,strong) NSURLRequest *request;
@end
