//
//  KeyframeAnimationViewController.m
//  动画类型
//
//  Created by kang on 16/3/29.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "KeyframeAnimationViewController.h"
#import "KeyframeAnimationVC.h"
#import <objc/runtime.h>

@interface KeyframeAnimationViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    NSMutableDictionary *_dic;// storage animation message

}
@end

@implementation KeyframeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createDataArrayObject];
    
    //create tableView object
    _tableView = [[UITableView alloc]init];
    _tableView.frame = self.view.bounds;
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
}


-(void) createDataArrayObject {
    
    _dataArray = [[NSMutableArray alloc]init];
    [_dataArray addObject:@"scaleAnimation"];
    [_dataArray addObject:@"positionAnimation"];
    [_dataArray addObject:@"rotationAnimation"];
    [_dataArray addObject:@"movePointAnimation"];
    [_dataArray addObject:@"initRectLayer"];
    [_dataArray addObject:@"multiPathAnimation"];
    [_dataArray addObject:@"contentsAnimation"];
    [_dataArray addObject:@"backgroundColorAnimation"];
    
    
    
    
    //添加核心动画类型
    //CAAnimation 包含以下几种动画类型
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
    [dictionary setObject:@"缩放动画" forKey:@"scaleAnimation"];
    
    [dictionary setObject:@"平移动画" forKey:@"positionAnimation"];
    
    [dictionary setObject:@"旋转动画" forKey:@"rotationAnimation"];
    
    [dictionary setObject:@"移动中心点，旋转" forKey:@"movePointAnimation"];
    
    [dictionary setObject:@"矩形轨迹动画" forKey:@"initRectLayer"];
    
    [dictionary setObject:@"多路径动画" forKey:@"multiPathAnimation"];
    
    [dictionary setObject:@"内容动画" forKey:@"contentsAnimation"];
    
    [dictionary setObject:@"背景色动画" forKey:@"backgroundColorAnimation"];

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
    NSString *basicCell = @"basicCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:basicCell];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:basicCell];
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
    
    KeyframeAnimationVC *vc = [[KeyframeAnimationVC alloc]init];
    switch (indexPath.row) {
        case 0://缩放动画
        {
            if (class_respondsToSelector(object_getClass(vc), @selector(scaleAnimation)) )
                [vc performSelector:@selector(scaleAnimation)];
            break;
            
        }
        case 1://平移动画
        {
            if (class_respondsToSelector(object_getClass(vc), @selector(positionAnimation)) )
                [vc performSelector:@selector(positionAnimation)];
            break;
        }
        case 2://旋转动画
        {
            if (class_respondsToSelector(object_getClass(vc), @selector(rotationAnimation)) )
                [vc performSelector:@selector(rotationAnimation)];
            break;
        }
        case 3:
        {
            if (class_respondsToSelector(object_getClass(vc), @selector(movePointAnimation)) )
                [vc performSelector:@selector(movePointAnimation)];
            break;
        }
        case 4:
        {
            if (class_respondsToSelector(object_getClass(vc), @selector(initRectLayer)) )
                [vc performSelector:@selector(initRectLayer)];
            break;
        }
        case 5:
        {
            if (class_respondsToSelector(object_getClass(vc), @selector(multiPathAnimation)) )
                [vc performSelector:@selector(multiPathAnimation)];
            break;
        }
        case 6:
        {
            if (class_respondsToSelector(object_getClass(vc), @selector(contentsAnimation)) )
                [vc performSelector:@selector(contentsAnimation)];
            break;
        }
        case 7:
        {
            if (class_respondsToSelector(object_getClass(vc), @selector(backgroundColorAnimation)) )
                [vc performSelector:@selector(backgroundColorAnimation)];
            break;
        }
        default:{
            
            NSLog(@"default,%ld",(long)indexPath.row);
            break;
        }
    }
    
    vc.title = [_dic valueForKey:[_dataArray objectAtIndex:indexPath.row]];
    
    //更改push后视图的返回按钮标题
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
