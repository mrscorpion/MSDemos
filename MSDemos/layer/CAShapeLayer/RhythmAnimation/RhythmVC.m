//
//  RhythmVC.m
//  MSDemos
//
//  Created by mr.scorpion on 16/8/11.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "RhythmVC.h"

@interface RhythmVC ()
@property (nonatomic, strong) UIView *rhythmView;
@end

@implementation RhythmVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.rhythmView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetWidth(self.view.frame) / 3)];
    [self.view addSubview:self.rhythmView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
