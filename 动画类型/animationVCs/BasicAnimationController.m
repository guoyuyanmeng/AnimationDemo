//
//  BasicAnimationController.m
//  动画类型
//
//  Created by kang on 16/3/29.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "BasicAnimationController.h"
#import "BasicAnimationsVC.h"
#import <objc/runtime.h>
#import "BasicAnimationCell.h"

@interface BasicAnimationController ()<UITableViewDataSource, UITableViewDelegate>{

    UITableView *_tableView;
    NSMutableArray *_dataArray;
    NSMutableDictionary *_dic;// storage animation message
}

@end

@implementation BasicAnimationController

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


- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    //    [self initScaleLayer];
    //    [self initGroupLayer];
    
//    [self initPositionLayer];
//    [self initTransformXLayer];
}


-(void) createDataArrayObject {
    
    _dataArray = [[NSMutableArray alloc]init];
    [_dataArray addObject:@"scaleAnimation"];
    [_dataArray addObject:@"positionAnimation"];
    [_dataArray addObject:@"transformXAnimation"];
    [_dataArray addObject:@"transformYAnimation"];
    [_dataArray addObject:@"transformZAnimation"];
    [_dataArray addObject:@"opacityAnimation"];
    [_dataArray addObject:@"backgroundColorAnimation"];
    [_dataArray addObject:@"backgrounImageAnimation"];
    
    
    //添加核心动画类型
    //CAAnimation 包含以下几种动画类型
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
    
    [dictionary setObject:@"缩放动画" forKey:@"scaleAnimation"];
    
    [dictionary setObject:@"平移动画" forKey:@"positionAnimation"];
    
    [dictionary setObject:@"X轴旋转动画" forKey:@"transformXAnimation"];
    
    [dictionary setObject:@"Y轴旋转动画" forKey:@"transformYAnimation"];
    
    [dictionary setObject:@"Z轴旋转动画" forKey:@"transformZAnimation"];
    
    [dictionary setObject:@"透明度动画" forKey:@"opacityAnimation"];
    
    [dictionary setObject:@"背景色动画" forKey:@"backgroundColorAnimation"];
    
    [dictionary setObject:@"图片切换动画" forKey:@"backgrounImageAnimation"];
    
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
    BasicAnimationCell *cell = [tableView dequeueReusableCellWithIdentifier:basicCell];
    
    if (cell == nil) {
        cell = [[BasicAnimationCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:basicCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (class_respondsToSelector(object_getClass(cell), @selector(removeLayer)) )
        [cell performSelector:@selector(removeLayer)];
    switch (indexPath.row) {
        case 0://缩放动画
        {
            if (class_respondsToSelector(object_getClass(cell), @selector(initScaleLayer)) )
                [cell performSelector:@selector(initScaleLayer)];
            
            break;
            
        }
        case 1://平移动画
        {
            if (class_respondsToSelector(object_getClass(cell), @selector(initPositionLayer)) )
                [cell performSelector:@selector(initPositionLayer)];
            break;
        }
        case 2://X轴旋转动画
        {
            if (class_respondsToSelector(object_getClass(cell), @selector(initTransformXLayer)) )
                [cell performSelector:@selector(initTransformXLayer)];
            break;
        }
        case 3://Y轴旋转动画
        {
            if (class_respondsToSelector(object_getClass(cell), @selector(initTransformYLayer)) )
                [cell performSelector:@selector(initTransformYLayer)];
            break;
        }
        case 4://Z轴旋转动画
        {
            if (class_respondsToSelector(object_getClass(cell), @selector(initTransformZLayer)) )
                [cell performSelector:@selector(initTransformZLayer)];
            break;
        }
        case 5:
        {
            if (class_respondsToSelector(object_getClass(cell), @selector(opacityAnimation)) )
                [cell performSelector:@selector(opacityAnimation)];
            break;
        }
        case 6:
        {
            if (class_respondsToSelector(object_getClass(cell), @selector(backgroundColorAnimation)) )
                [cell performSelector:@selector(backgroundColorAnimation)];
            break;
        }
        case 7:
        {
            if (class_respondsToSelector(object_getClass(cell), @selector(backgrounImageAnimation)) )
                [cell performSelector:@selector(backgrounImageAnimation)];
            break;
        }
        default:{
            
            NSLog(@"default,%ld",(long)indexPath.row);
            break;
        }
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

    BasicAnimationsVC *vc = [[BasicAnimationsVC alloc]init];
    switch (indexPath.row) {
        case 0://缩放动画
        {
            if (class_respondsToSelector(object_getClass(vc), @selector(initScaleLayer)) )
                [vc performSelector:@selector(initScaleLayer)];
            
            break;
            
        }
        case 1://平移动画
        {
            if (class_respondsToSelector(object_getClass(vc), @selector(initPositionLayer)) )
                [vc performSelector:@selector(initPositionLayer)];
            break;
        }
        case 2://X轴旋转动画
        {
            if (class_respondsToSelector(object_getClass(vc), @selector(initTransformXLayer)) )
                [vc performSelector:@selector(initTransformXLayer)];
            break;
        }
        case 3://Y轴旋转动画
        {
            if (class_respondsToSelector(object_getClass(vc), @selector(initTransformYLayer)) )
                [vc performSelector:@selector(initTransformYLayer)];
            break;
        }
        case 4://Z轴旋转动画
        {
            if (class_respondsToSelector(object_getClass(vc), @selector(initTransformZLayer)) )
                [vc performSelector:@selector(initTransformZLayer)];
            break;
        }
        case 5:
        {
            if (class_respondsToSelector(object_getClass(vc), @selector(opacityAnimation)) )
                [vc performSelector:@selector(opacityAnimation)];
            break;
        }
        case 6:
        {
            if (class_respondsToSelector(object_getClass(vc), @selector(backgroundColorAnimation)) )
                [vc performSelector:@selector(backgroundColorAnimation)];
            break;
        }
        case 7:
        {
            if (class_respondsToSelector(object_getClass(vc), @selector(backgrounImageAnimation)) )
                [vc performSelector:@selector(backgrounImageAnimation)];
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
