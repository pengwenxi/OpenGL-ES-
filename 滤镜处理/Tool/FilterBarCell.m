//
//  FilterBarCell.m
//  滤镜处理
//
//  Created by 彭文喜 on 2020/8/7.
//  Copyright © 2020 彭文喜. All rights reserved.
//

#import "FilterBarCell.h"

@interface FilterBarCell()
@property(nonatomic,strong)UILabel *label;

@end

@implementation FilterBarCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self initUI];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.label.frame = CGRectInset(self.label.frame, 10, 10);
}

-(void)initUI{
    self.label = [[UILabel alloc]initWithFrame:self.bounds];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont boldSystemFontOfSize:20];
    self.label.layer.cornerRadius = 20;
    self.label.layer.masksToBounds = YES;
    [self addSubview:self.label];
}

-(void)setTitle:(NSString *)title{
    _title = title;
    self.label.text = title;
}
-(void)setIsSelect:(BOOL)isSelect{
    _isSelect = isSelect;
    self.label.backgroundColor = isSelect ? UIColor.blackColor:UIColor.clearColor;
    self.label.textColor = isSelect ? UIColor.whiteColor : UIColor.blackColor;
}
@end
