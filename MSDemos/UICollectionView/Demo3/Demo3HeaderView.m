//
//  Demo3HeaderView.m
//  YXCollectionView
//
//  Created by mr.scorpion on 15/10/15.
//  Copyright © 2015年 mr.scorpion. All rights reserved.
//

#import "Demo3HeaderView.h"

@interface Demo3HeaderView()

@property (nonatomic , strong) UILabel *titleLabel;

@end

@implementation Demo3HeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.backgroundColor = [UIColor blackColor];
        _titleLabel.alpha = 0.5;
        _titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:_titleLabel];
    }
    return self;
}

- (void)layoutSubviews{
    _titleLabel.frame = self.bounds;
}

- (void)setTitle:(NSString *)title{
    _titleLabel.text = title;
}

@end
