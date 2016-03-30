//
//  ViewController.m
//  动画类型
//
//  Created by kang on 16/3/29.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "ViewController.h"
#import "AnimationViewController.h"
#import "BasicAnimationController.h"
#import "KeyframeAnimationViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_tableView;
    NSMutableDictionary *_dic;// storage animation message
    NSMutableArray *_dataArray;
}
@end

NSString * cellIdentify = @"cellIdentify";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //create tableView object
    _tableView = [[UITableView alloc]init];
    _tableView.frame = self.view.bounds;
    _tableView.delegate =self;
    _tableView.dataSource = self;
    
//    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentify];
    [self.view addSubview:_tableView];
    
    //create dataArray Object
    [self createDataArrayObject];
}

-(void) createDataArrayObject {
    
    _dataArray = [[NSMutableArray alloc]init];
    [_dataArray addObject:@"CABasicAnimation"];
    [_dataArray addObject:@"CAKeyframeAnimation"];
    [_dataArray addObject:@"CAPropertyAnimation"];
    [_dataArray addObject:@"CAAnimationGroup"];
    [_dataArray addObject:@"CATransition"];
    
    //添加核心动画类型
    //CAAnimation 包含以下几种动画类型
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
    [dictionary setObject:@"基础动画，(CAPropertyAnimation <--- CABasicAnimation)通过属性修改进行动画参数控制，只有初始状态和结束状态。" forKey:@"CABasicAnimation"];
    
    [dictionary setObject:@"关键帧动画，(CAPropertyAnimation <--- CAKeyframeAnimation)同样是通过属性进行动画参数控制，但是同基础动画不同的是它可以有多个状态控制。" forKey:@"CAKeyframeAnimation"];
    
    [dictionary setObject:@"属性动画的基类（通过属性进行动画设置，注意是可动画属性），不能直接使用。" forKey:@"CAPropertyAnimation"];
    
    [dictionary setObject:@"动画组，动画组是一种组合模式设计，可以通过动画组来进行所有动画行为的统一控制，组中所有动画效果可以并发执行。" forKey:@"CAAnimationGroup"];
    
    [dictionary setObject:@"转场动画，主要通过滤镜进行动画效果设置。" forKey:@"CATransition"];

    _dic = dictionary;
}


#pragma mark - UITableViewDataSource
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    //设置换行
    cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.detailTextLabel.numberOfLines = 0;
    
    
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [_dic valueForKey:[_dataArray objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"default,%ld",(long)indexPath.row);
    AnimationViewController *animationVC ;
    //核心动画类包含以下几种
    switch (indexPath.row) {
        case 0://基础动画,CABasicAnimation
        {
            animationVC = [[BasicAnimationController alloc]init];
            animationVC.title = @"基础动画";
            
            break;
        
        }
        case 1://关键帧动画,CAKeyframeAnimation
        {
            animationVC = [[KeyframeAnimationViewController alloc]init];
            animationVC.title = @"关键帧动画";
            break;
        }
        case 2://属性动画,CAPropertyAnimation
        {
            animationVC.title = @"关键帧动画";
            [self.navigationController pushViewController:animationVC animated:YES];
            break;
        }
        case 3://动画组,CAAnimationGroup
        {
            animationVC.title = @"动画组";
            [self.navigationController pushViewController:animationVC animated:YES];
            break;
        }
        case 4://转场动画,CATransition
        {
            animationVC.title = @"转场动画";
            [self.navigationController pushViewController:animationVC animated:YES];
            break;
        }
        default:
            break;
            
    }
    //更改push后视图的返回按钮标题
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
    [self.navigationController pushViewController:animationVC animated:YES];

}


@end
