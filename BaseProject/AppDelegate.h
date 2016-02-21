//
//  AppDelegate.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <RESideMenu.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) RESideMenu *sideMenu;
@property(nonatomic,getter=isOnLine) BOOL onLine; //网络状态

/**  是否允许横屏的标记*/
@property (nonatomic,assign)BOOL allowRotation;
@end

