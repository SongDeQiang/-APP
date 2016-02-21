//
//  InforMationCell.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface InforMationCell : UITableViewCell
/** 图片*/
@property (nonatomic,strong)TRImageView *iconView;
/** 题目标识*/
@property (nonatomic,strong)UILabel *titleLb;
/** 详情*/
@property (nonatomic,strong)UILabel *descLb;
/** 时间*/
@property (nonatomic,strong)UILabel *timeLb;

@property(nonatomic ,strong)UIImage *image;


@end
