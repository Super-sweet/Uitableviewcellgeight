//
//  BaseViewController.m
//  UITableViewCellHeightDemo
//
//  Created by lisong on 2016/10/8.
//  Copyright © 2016年 lisong. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong) NSMutableDictionary *heightAtIndexPath;//缓存高度

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //如果想去除plain下面多出来的分割线
    //那么就
    /*
     
      self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
     */
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *height = [self.heightAtIndexPath objectForKey:indexPath];
    if(height)
    {
        return height.floatValue;
    }
    else
    {
        return 100;
    }
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *height = @(cell.frame.size.height);
    [self.heightAtIndexPath setObject:height forKey:indexPath];
    
    
    NSArray * array = tableView.indexPathsForVisibleRows;
    NSIndexPath * firstIndexPath = array [0];
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    cell.layer.position = CGPointMake(cell.layer.position.x, cell.layer.position.y);
    if (firstIndexPath.row < indexPath.row) {
        cell.layer.transform = CATransform3DMakeRotation(M_PI_2, 0, 0, 0.5);
    }else {
     cell.layer.transform = CATransform3DMakeRotation(-M_PI_2, 0, 0, 1.0);
    }
    cell.alpha = 0;
    [UIView animateWithDuration:1.0 animations:^{
        cell.layer.transform = CATransform3DIdentity;
        cell.alpha = 1.0;
    }];
    
    
}


#pragma mark - Getters
- (NSMutableDictionary *)heightAtIndexPath
{
    if (!_heightAtIndexPath) {
        _heightAtIndexPath = [NSMutableDictionary dictionary];
    }
    return _heightAtIndexPath;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
