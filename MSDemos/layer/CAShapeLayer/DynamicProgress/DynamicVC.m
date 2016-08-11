//
//  DynamicVC.m
//  MSDemos
//
//  Created by mr.scorpion on 16/8/11.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "DynamicVC.h"

#define TOTAL_NUM 10

@interface DynamicVC ()
@property (nonatomic, strong) UIView *dynamicView;
@property (nonatomic, strong) CAShapeLayer *indicateLayer;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) CAShapeLayer *rythemLayer;
@property (nonatomic, strong) UIView *barView;

@property (nonatomic, strong) CADisplayLink *displayLink;
@end

@implementation DynamicVC
#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.dynamicView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.dynamicView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.dynamicView];
    
    
    _indicateLayer = [CAShapeLayer layer];
    [self.dynamicView.layer addSublayer:_indicateLayer];
    
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLink:)];
    self.displayLink.frameInterval = 6; // 7
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    
    // Demo2
    self.barView = [[UIView alloc] initWithFrame:CGRectMake(50, 250, 20, 200)];
    [self.view addSubview:self.barView];
    _gradientLayer = [CAGradientLayer layer];
    _gradientLayer.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(_barView.frame), CGRectGetHeight(_barView.frame));
    _gradientLayer.colors = @[(id)[UIColor colorWithRed:0.27 green:0.80 blue:0.80 alpha:1.0].CGColor, (id)[UIColor colorWithRed:0.90 green:0.59 blue:0.20 alpha:1.0].CGColor, (id)[UIColor colorWithRed:0.98 green:0.12 blue:0.45 alpha:1.0].CGColor];
    _gradientLayer.startPoint = CGPointMake(0.5, 1);
    _gradientLayer.endPoint = CGPointMake(0.5, 0);
    [self.barView.layer addSublayer:_gradientLayer];
    
    
//    [_barView.layer addSublayer:_rythemLayer];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.displayLink invalidate];
    self.displayLink = nil;
}

#pragma mark - Actions
- (void)handleDisplayLink:(CADisplayLink *)display
{
    NSInteger i = arc4random() % TOTAL_NUM;
    [self refreshUIWithVoicePower:i];
    
    [self refreshBarWithRhythm:i];
}
- (void)refreshUIWithVoicePower : (NSInteger)voicePower
{
    CGFloat height = (voicePower)*(CGRectGetHeight(_dynamicView.frame)/TOTAL_NUM);
    [_indicateLayer removeFromSuperlayer];
    _indicateLayer = nil;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, CGRectGetHeight(_dynamicView.frame)-height, CGRectGetWidth(_dynamicView.frame), height) cornerRadius:0];
    _indicateLayer = [CAShapeLayer layer];
    _indicateLayer.path = path.CGPath;
    _indicateLayer.fillColor = [UIColor purpleColor].CGColor;
    [_dynamicView.layer addSublayer:_indicateLayer];
}

- (void)refreshBarWithRhythm : (NSInteger)voicePower
{
    CGFloat height = (voicePower)*(CGRectGetHeight(_barView.frame)/TOTAL_NUM);
    [_rythemLayer removeFromSuperlayer];
    _rythemLayer = nil;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, CGRectGetHeight(_barView.frame)-height, CGRectGetWidth(_barView.frame), height) cornerRadius:0];
    _rythemLayer = [CAShapeLayer layer];
    _rythemLayer.path = path.CGPath;
    _rythemLayer.fillColor = [UIColor blackColor].CGColor;
    [_barView.layer insertSublayer:_rythemLayer above:_gradientLayer];

    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, CGRectGetWidth(_barView.frame), CGRectGetHeight(_barView.frame)-height) cornerRadius:0];
    maskLayer.path = path2.CGPath;
    maskLayer.fillColor = [UIColor blueColor].CGColor;
    _gradientLayer.mask = _rythemLayer;
}


//- (void)refreshBarWithRhythm : (NSInteger)voicePower
//{
//    [_gradientLayer removeFromSuperlayer];
//    _gradientLayer = nil;
//    CGFloat height = (voicePower)*(CGRectGetHeight(_barView.frame)/TOTAL_NUM);
//    _gradientLayer.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(_indicateLayer.frame), CGRectGetHeight(_dynamicView.frame));
//    _gradientLayer.colors = @[(id)[UIColor colorWithRed:0.27 green:0.80 blue:0.80 alpha:1.0].CGColor, (id)[UIColor colorWithRed:0.90 green:0.59 blue:0.20 alpha:1.0].CGColor, (id)[UIColor colorWithRed:0.98 green:0.12 blue:0.45 alpha:1.0].CGColor];
//    _gradientLayer.startPoint = CGPointMake(0.5, 1);
//    _gradientLayer.endPoint = CGPointMake(0.5, 0);
//    [_barView.layer addSublayer:_gradientLayer];
////    _rythemLayer = [CAShapeLayer layer];
////    _gradientLayer.mask = _rythemLayer;
//    
//    
//    [_rythemLayer removeFromSuperlayer];
//    _rythemLayer = nil;
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, CGRectGetHeight(_barView.frame)-height, CGRectGetWidth(_barView.frame), height) cornerRadius:0];
//    _rythemLayer = [CAShapeLayer layer];
//    _rythemLayer.path = path.CGPath;
//    _rythemLayer.fillColor = [UIColor blackColor].CGColor;
//    _gradientLayer.mask = _rythemLayer;
//     [_barView.layer addSublayer:_gradientLayer];
////    [_barView.layer addSublayer:_rythemLayer];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
