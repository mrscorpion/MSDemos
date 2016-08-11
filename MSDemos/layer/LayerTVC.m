//
//  LayerTVC.m
//  MSDemos
//
//  Created by mr.scorpion on 16/8/11.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "LayerTVC.h"
#import "MaskVC.h"
#import "CircleProgressVC.h"
#import "DynamicVC.h"

@interface LayerTVC ()
@property (nonatomic, strong) NSArray *dataArr;
@end

@implementation LayerTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataArr = @[@"使用CAShapeLayer实现View的遮罩效果", @"圆形进度条", @"使用CAShapeLayer动态改变进度"];
    
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"53"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
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
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[[MaskVC alloc] init] animated:YES];
            break;
            
        case 1:
            [self.navigationController pushViewController:[[CircleProgressVC alloc] init] animated:YES];
            break;
            
        case 2:
            [self.navigationController pushViewController:[[DynamicVC alloc] init] animated:YES];
            break;
        default:
            break;
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}
@end
