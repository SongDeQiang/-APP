//
//  LiveDetailViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveDetailViewController : UIViewController
-(id)initWithRequest:(NSURLRequest *)request Name:(NSString *)name;
@property(nonatomic,strong) NSURLRequest *request;
@property(nonatomic,strong) NSString *name;
@end
