//
//  InformationNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "InformationNetManager.h"

@implementation InformationNetManager

+(id)getInfoWithInfoType:(InfoType)type Page:(NSInteger)page Data:(NSString *)data completionHandle:(void (^)(id, NSError *))completionHandle
{
    switch (type) {
        case InfoTypeZuiXin: {
            if (page == 1) {
                NSString *path = [NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/c12_list_%ld.shtml",page];
                return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                    completionHandle([InfomationModel mj_objectWithKeyValues:responseObj],error);
                }];
                break;
            }else{
                NSString *path =[NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/%@",data];
                return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                    completionHandle([InfomationModel mj_objectWithKeyValues:responseObj],error);
                }];
                break;
            }
          
        }
        case InfoTypeSaiShi: {
            if (page == 1) {
                NSString *path = [NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/c73_list_%ld.shtml",page];
                return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                    completionHandle([InfomationModel mj_objectWithKeyValues:responseObj],error);
                }];
                break;
            }else{
                NSString *path =[NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/%@",data];
                return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                    completionHandle([InfomationModel mj_objectWithKeyValues:responseObj],error);
                }];
                break;
            }
            
        }
//        case InfoTypeYueLe: {
//            if (page == 1) {
//                NSString *path = [NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/c18_list_%ld.shtml",page];
//                return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
//                    completionHandle([InfomationModel mj_objectWithKeyValues:responseObj],error);
//                }];
//                break;
//            }else{
//                NSString *path =[NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/%@",data];
//                return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
//                    completionHandle([InfomationModel mj_objectWithKeyValues:responseObj],error);
//                }];
//                break;
//            }
//            
//        }
        case InfoTypeGuanFang: {
            if (page == 1) {
                
            
             NSString *path = [NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/c3_list_%ld.shtml",page];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completionHandle([InfomationModel mj_objectWithKeyValues:responseObj],error);
            }];
                break;}
            else{
                NSString *path =[NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/%@",data];
                return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                    completionHandle([InfomationModel mj_objectWithKeyValues:responseObj],error);
                }];
                break;
            }
            
        }
//        case InfoTypeMeiNv: {
//            if (page == 1) {
//                
//            
//            NSString *path = [NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/c17_list_%ld.shtml",page];
//            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
//                completionHandle([InfomationModel mj_objectWithKeyValues:responseObj],error);
//            }];
//                break;}
//            else{
//                NSString *path =[NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/%@",data];
//                return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
//                    completionHandle([InfomationModel mj_objectWithKeyValues:responseObj],error);
//                }];
//                break;
//            }
//            
//        }

        case InfoTypeGonLve: {
            if (page == 1) {
                
            
             NSString *path = [NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/c10_list_%ld.shtml",page];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completionHandle([InfomationModel mj_objectWithKeyValues:responseObj],error);
            }];
                break;}
            else{
                NSString *path =[NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/%@",data];
                return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                    completionHandle([InfomationModel mj_objectWithKeyValues:responseObj],error);
                }];
                break;
            }
            
        }
        case InfoTypeHuoDong: {
            if (page == 1) {
                
            
             NSString *path = [NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/c23_list_%ld.shtml",page];
            return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                completionHandle([InfomationModel mj_objectWithKeyValues:responseObj],error);
            }];
                break;}
            else{
                NSString *path =[NSString stringWithFormat:@"http://qt.qq.com/static/pages/news/phone/%@",data];
                return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
                    completionHandle([InfomationModel mj_objectWithKeyValues:responseObj],error);
                }];
                break;
            }
            
        }
        default: {
            break;
        }
    }
}
+ (id)getGunCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    NSString *path = @"http://qt.qq.com/static/pages/news/phone/c13_list_1.shtml";
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([InfomationModel mj_objectWithKeyValues:responseObj], error);
    }];
}
@end
