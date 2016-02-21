//
//  InforMationCell.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "InforMationCell.h"

@implementation InforMationCell
- (TRImageView *)iconView {
    if(_iconView == nil) {
        _iconView = [[TRImageView alloc] init];
       

    }
    return _iconView;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _timeLb.font = [UIFont systemFontOfSize:18];
    }
    return _titleLb;
}

- (UILabel *)descLb {
    if(_descLb == nil) {
        _descLb = [[UILabel alloc] init];
        _descLb.font = [UIFont systemFontOfSize:14];
        _descLb.textColor = [UIColor lightGrayColor];
        _descLb.numberOfLines = 2;
    }
    return _descLb;
}

- (UILabel *)timeLb {
    if(_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        _timeLb.font = [UIFont systemFontOfSize:14];
        _timeLb.textColor = [UIColor lightGrayColor];
    }
    return _timeLb;
}

/** 重写初始化*/
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.descLb];
        [self.contentView addSubview:self.timeLb];
//        左10 宽高 75 55  竖向居中
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(75, 55));
            make.centerY.mas_equalTo(0);
        }];
//        左8 右 15 上对齐
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.iconView);
            make.left.mas_equalTo(self.iconView.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(-15);
            
        }];
//    竖向居中
        [self.descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb);
            make.right.mas_equalTo(-15);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(3);
           
        }];
        [self.timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.width.mas_equalTo(40);
            make.bottomMargin.mas_equalTo(self.iconView);
        }];
        
        
    }return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
