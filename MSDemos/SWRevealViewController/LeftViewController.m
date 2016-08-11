//
//  LeftViewController.m
//  侧滑菜单
//
//  Created by mr.scorpion on 15/7/13.
//  Copyright (c) 2015年 mr.scorpion. All rights reserved.
//

#import "LeftViewController.h"
#import "SWRevealViewController.h"
#import "CenterViewController.h"

@interface LeftViewController()
<
UITableViewDataSource,
UITableViewDelegate
>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *menuArray;

@property (nonatomic, strong) UINavigationController *nav;
@property (nonatomic, strong) CenterViewController *vc;
@end

@implementation LeftViewController

-
(void)viewDidLoad
{
    [super viewDidLoad];
    [self initData];
    [self initView];
}

-(void)initData
{
//    _menuArray = [NSArray arrayWithObjects:@"顶部cellheight逐步增大", @"头部拉伸效果",@"倾斜的Cell", @"瀑布流",@"照片墙", @"网格视图", nil];
    _menuArray = [NSArray arrayWithObjects:@"UITableView", @"UICollectionView", @"Layer", nil];
}

- (void)initView
{
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT-20) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _menuArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *TABLE_VIEW_ID = @"table_view_id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLE_VIEW_ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLE_VIEW_ID];
    }
    cell.textLabel.text = [_menuArray objectAtIndex:indexPath.row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWRevealViewController *revealViewController = self.revealViewController;
//    //调用pushFrontViewController进行页面切换
    
//    if (!self.vc.parentViewController) {
    self.nav = [[UINavigationController alloc] initWithRootViewController:self.vc];
        self.vc.type = indexPath.row + 1;
        [revealViewController pushFrontViewController:self.nav animated:YES];
//    } else {
//        self.vc.type = indexPath.row + 1;
//        [revealViewController pushFrontViewController:self.vc animated:YES];
//    }
}
- (UINavigationController *)nav
{
    if (!_nav) {
        _nav = [[UINavigationController alloc] init];
    }
    return _nav;
}
- (CenterViewController *)vc
{
    if (!_vc) {
        _vc = [[CenterViewController alloc] init];
    }
    return _vc;
}
@end
