//
//  MaskVC.m
//  MSDemos
//
//  Created by mr.scorpion on 16/8/11.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "MaskVC.h"
#import "CAShapeLayer+ViewMask.h"

@interface MaskVC ()

@end

@implementation MaskVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageView.image = [UIImage imageNamed:@"51"];
    [self.view addSubview:imageView];
    CAShapeLayer *layer = [CAShapeLayer createMaskLayerWithView:imageView];
    imageView.layer.mask = layer;
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(40, 250, 80, 100)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    CAShapeLayer *layer2 = [CAShapeLayer createMaskLayerWithView:view];
    view.layer.mask = layer2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
