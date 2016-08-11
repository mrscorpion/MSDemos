//
//  RhythmBar.m
//  MSDemos
//
//  Created by mr.scorpion on 16/8/11.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "RhythmBar.h"
#define COMMAN_NUM  12

@implementation RhythmBar
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        _gradientLayer.colors = @[(id)[UIColor colorWithRed:0.27 green:0.80 blue:0.80 alpha:1.0].CGColor, (id)[UIColor colorWithRed:0.90 green:0.59 blue:0.20 alpha:1.0].CGColor, (id)[UIColor colorWithRed:0.98 green:0.12 blue:0.45 alpha:1.0].CGColor];
        _gradientLayer.startPoint = CGPointMake(0.5, 1);
        _gradientLayer.endPoint = CGPointMake(0.5, 0);
        [self.layer addSublayer:_gradientLayer];
    }
    return self;
}

- (void)refreshBarWithRhythm:(CGFloat)rate command:(NSInteger)command
{
    NSInteger power = command ? command : COMMAN_NUM;
    CGFloat height = (rate) * (CGRectGetHeight(self.frame) / power);
    [_rythemLayer removeFromSuperlayer];
    _rythemLayer = nil;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, CGRectGetHeight(self.frame)-height, CGRectGetWidth(self.frame), height) cornerRadius:0];
    _rythemLayer = [CAShapeLayer layer];
    _rythemLayer.path = path.CGPath;
    _rythemLayer.fillColor = [UIColor blackColor].CGColor;
    [self.layer insertSublayer:_rythemLayer above:_gradientLayer];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)-height) cornerRadius:0];
    maskLayer.path = path2.CGPath;
    maskLayer.fillColor = [UIColor blueColor].CGColor;
    _gradientLayer.mask = _rythemLayer;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//- (void)refreshBarWithRhythm:(NSInteger)voicePower
//{
//    CGFloat height = (voicePower)*(CGRectGetHeight(_barView.frame)/TOTAL_NUM);
//    [_rythemLayer removeFromSuperlayer];
//    _rythemLayer = nil;
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, CGRectGetHeight(_barView.frame)-height, CGRectGetWidth(_barView.frame), height) cornerRadius:0];
//    _rythemLayer = [CAShapeLayer layer];
//    _rythemLayer.path = path.CGPath;
//    _rythemLayer.fillColor = [UIColor blackColor].CGColor;
//    [_barView.layer insertSublayer:_rythemLayer above:_gradientLayer];
//
//    CAShapeLayer *maskLayer = [CAShapeLayer layer];
//    UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, CGRectGetWidth(_barView.frame), CGRectGetHeight(_barView.frame)-height) cornerRadius:0];
//    maskLayer.path = path2.CGPath;
//    maskLayer.fillColor = [UIColor blueColor].CGColor;
//    _gradientLayer.mask = _rythemLayer;
//}
@end
