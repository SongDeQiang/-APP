//
//  ZBXiangViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZBXiangViewController : UIViewController
- (id)initWithURL:(NSURL *)url Id:(NSInteger)Id;


@property(nonatomic) NSInteger Id;
@property(nonatomic,strong) NSURL *url;
@end
