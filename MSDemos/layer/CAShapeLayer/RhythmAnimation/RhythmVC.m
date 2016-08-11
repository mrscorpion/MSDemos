//
//  RhythmVC.m
//  MSDemos
//
//  Created by mr.scorpion on 16/8/11.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "RhythmVC.h"
#import "RhythmBar.h"

@interface RhythmVC ()
@property (nonatomic, strong) UIView *rhythmView;
@property (nonatomic, strong) NSArray *barsArr;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSArray *weights; // 权重
@end

@implementation RhythmVC
#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.rhythmView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetWidth(self.view.frame) / 3)];
    [self.view addSubview:self.rhythmView];
    
    
    CGFloat padding = 8;
    CGFloat count = 14;
    NSMutableArray *barArrM = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        CGFloat w = (SCREEN_WIDTH - padding * (count - 1)) / count;
        CGFloat x = i * (w + padding);
        RhythmBar *bar = [[RhythmBar alloc] initWithFrame:CGRectMake(x, 0, w, CGRectGetHeight(self.rhythmView.frame))];
        [self.rhythmView addSubview:bar];
        [barArrM addObject:bar];
    }
    self.barsArr = [barArrM copy];
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    self.timer = timer;
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.timer invalidate];
    self.timer = nil;
}


//// MARK: Weights
//- (NSArray *)weights
//{
//    if (!_weights) {
//        _weights = @[@0.5, @0.3, @0.26, @0.6, @0.45, @0.75, @1, @0.5, @0.3, @0.26, @0.6, @0.45, @0.75, @1];
////        NSArray *reverseArray = [[_weights reverseObjectEnumerator] allObjects];
////        NSMutableArray *weightArrM = [NSMutableArray arrayWithArray:_weights];
////        [weightArrM arrayByAddingObjectsFromArray:reverseArray];
////        _weights = [weightArrM copy];
//    }
//    return _weights;
//}

// MARK: Action
- (void)timerAction
{
    CGFloat rate = (float)(arc4random()%100)/100; //  random  0.0 ~ 1.0
    NSInteger command = arc4random() % 12;
    
    for (RhythmBar *bar in self.barsArr) {
        [bar refreshBarWithRhythm:rate command:command];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
