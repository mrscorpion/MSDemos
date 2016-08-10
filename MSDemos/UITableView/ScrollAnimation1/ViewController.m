//
//  ViewController.m
//  LRTableViewRollAnimation
//
//  Created by luran on 16/7/13.
//  Copyright © 2016年 luran. All rights reserved.
//

#import "ViewController.h"
#import "LRAnimationCell.h"

#define LRRowHeight 240

#define LRCount 10

#define LRGetImage(row) [UIImage imageNamed:[NSString stringWithFormat:@"%zd",row]]

#define kAngle (90.0 * M_PI) / 180.0

@interface ViewController ()
<
UITableViewDataSource,
UITableViewDelegate,
UIScrollViewDelegate
>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, assign) CGFloat lastScrollOffset;
/**设置cell角度 */
@property (nonatomic, assign) CGFloat angle;
/**设置cell锚点 */
@property (nonatomic, assign) CGPoint cellAnchorPoint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
}

- (void)setupTableView
{
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.rowHeight = LRRowHeight;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bak"]];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return LRCount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LRAnimationCell *cell = [LRAnimationCell cellFromXib:tableView cellAnchorPoint:_cellAnchorPoint angle:_angle];
    
    cell.backgroundImage.image = LRGetImage(indexPath.row + 1);
    
    
    return cell;
}

/**
 * 此方法的效果是单独存在的, 可以拿出去单独使用
 */
#if 0
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DRotate(transform, 0, 0, 0, 1);//渐变
    transform = CATransform3DTranslate(transform, -200, 0, 0);//左边水平移动
    //        transform = CATransform3DScale(transform, 0, 0, 0);//由小变大
    
    cell.layer.transform = transform;
    cell.layer.opacity = 0.0;
    
    [UIView animateWithDuration:0.6 animations:^{
        cell.layer.transform = CATransform3DIdentity;
        cell.layer.opacity = 1;
    }];
}
#endif

//滚动监听
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if (scrollView != self.tableView) return;
    
    CGFloat y = scrollView.contentOffset.y;
    
    if (y > _lastScrollOffset) {//用户往上拖动
        // x=0 y=0 左
        // x=1 y=0 -angle 右
        _angle = - kAngle;
        _cellAnchorPoint = CGPointMake(1, 0);
        
    } else {//用户往下拖动
        // x=0 y=1 -angle 左
        // x=1 y=1 右
        _angle =  - kAngle;
        _cellAnchorPoint = CGPointMake(0, 1);
    }
    //存储最后的y值
    _lastScrollOffset = y;
    
}

@end
