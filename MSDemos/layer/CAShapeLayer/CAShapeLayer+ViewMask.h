//
//  CAShapeLayer+ViewMask.h
//  MSDemos
//
//  Created by mr.scorpion on 16/8/11.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//  聊天UIImageView的遮罩效果

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CAShapeLayer (ViewMask)
+ (instancetype)createMaskLayerWithView : (UIView *)maskView;
@end
