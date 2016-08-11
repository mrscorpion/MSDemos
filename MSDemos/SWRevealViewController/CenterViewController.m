//
//  CenterViewController.m
//  MSDemos
//
//  Created by mr.scorpion on 16/8/10.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "CenterViewController.h"
#import "SWRevealViewController.h"

#import "ViewController.h"

#import "Demo1ViewController.h"
#import "Demo3ViewController.h"
#import "Demo4ViewController.h"
#import "Demo5ViewController.h"
#import "Demo6ViewController.h"
#import "Demo7ViewController.h"

#import "LayerTVC.h"

@interface CenterViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;
@end

@implementation CenterViewController
#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Mr Scorpion";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bak"]];
    [self.view addSubview:self.tableView];
    
    //注册该页面可以执行滑动切换
    SWRevealViewController *revealController = self.revealViewController;
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self configureNavigationController];
    
    if (self.type == 1) {
        self.dataArr = @[@"滚动时的视觉差效果"];
    } else if (self.type == 2) {
        self.dataArr = @[@"顶部cellheight逐步增大", @"头部拉伸效果",@"倾斜的Cell", @"瀑布流",@"照片墙", @"网格视图"];
    } else if (self.type == 3) {
        self.dataArr = @[@"CAShapeLayer实现View的遮罩效果"];
    }
    else {
        self.dataArr = @[@"Mr Scorpion"];
    }
    [self.tableView reloadData];
}

- (void)configureNavigationController
{
    self.navigationController.navigationBar.barTintColor = [UIColor purpleColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.navigationController.navigationBar.opaque = YES;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.hidesBarsOnSwipe = YES;
}

- (NSArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [[NSArray alloc] init];
    }
    return _dataArr;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (self.type) {
        case 1:
            [self tableSelectedIndex:indexPath.row];
            break;
            
        case 2:
            [self collectionSelectedIndex:indexPath.row];
            break;
            
        case 3:
            [self layerSelectedIndex:indexPath.row];
            break;
        default:
            break;
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}
- (void)tableSelectedIndex:(NSInteger)index
{
    ViewController *vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)collectionSelectedIndex:(NSInteger)index
{
    UIViewController *vc = nil;
    switch (index) {
        case 0:
            vc = [[Demo7ViewController alloc] init];
            break;
        case 1:
            vc = [[Demo5ViewController alloc] init];
            break;
        case 2:
            vc = [[Demo6ViewController alloc] init];
            break;
        case 3:
            vc = [[Demo4ViewController alloc] init];
            break;
        case 4:
            vc = [[Demo3ViewController alloc] init];
            break;
        case 5:
            vc = [[Demo1ViewController alloc] init];
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)layerSelectedIndex:(NSInteger)index
{
    LayerTVC *vc = [[LayerTVC alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:vc animated:YES];
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
