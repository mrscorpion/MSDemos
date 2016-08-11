//
//  CircleProgressVC.m
//  MSDemos
//
//  Created by mr.scorpion on 16/8/11.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "CircleProgressVC.h"

@interface CircleProgressVC ()
@property (nonatomic, strong) UIView *demoView;
@property (nonatomic, strong) UIView *circleView;
@end

@implementation CircleProgressVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _demoView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:_demoView];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = _demoView.bounds;
    shapeLayer.strokeEnd = 0.7f;
    shapeLayer.strokeStart = 0.1f;
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:_demoView.bounds];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2.0f;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    [_demoView.layer addSublayer:shapeLayer];
    
    [self configureCircleProgress];
}
- (void)configureCircleProgress
{
    _circleView = [[UIView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    [self.view addSubview:_circleView];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = _circleView.bounds;
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:_circleView.bounds];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2.0f;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    [_circleView.layer addSublayer:shapeLayer];
    CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnima.duration = 3.0f;
    pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnima.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnima.fillMode = kCAFillModeForwards;
    pathAnima.removedOnCompletion = NO;
    [shapeLayer addAnimation:pathAnima forKey:@"strokeEndAnimation"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
