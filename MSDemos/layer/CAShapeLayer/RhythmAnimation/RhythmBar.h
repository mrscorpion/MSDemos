//
//  RhythmBar.h
//  MSDemos
//
//  Created by mr.scorpion on 16/8/11.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RhythmBar : UIView
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) CAShapeLayer *rythemLayer;

/// rate :  0.0 ~ 1.0   command : control default 1 ~ 12
- (void)refreshBarWithRhythm:(CGFloat)rate command:(NSInteger)command;
@end
