//
//  TransitionAnimationViewController.m
//  动画类型
//
//  Created by kang on 16/3/31.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "TransitionAnimationViewController.h"
#import <objc/runtime.h>
#import "TransitionAnimationVC.h"

@interface TransitionAnimationViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    NSMutableDictionary *_dic;// storage animation message
    
}
@end

/* 过渡效果
 
 以下是基本的四种效果
 kCATransitionPush       推入效果
 kCATransitionMoveIn     移入效果
 kCATransitionReveal     截开效果
 kCATransitionFade       渐入渐出效果
 
 */

/*
 
 以下API效果可以安全使用
 cube                  方块
 suckEffect            三角
 rippleEffect          水波抖动
 pageCurl              上翻页
 pageUnCurl            下翻页
 oglFlip               上下翻转
 cameraIrisHollowOpen  镜头快门开
 cameraIrisHollowClose 镜头快门关
 
 */

/*
 
 以下API效果请慎用
 
 spewEffect               新版面在屏幕下方中间位置被释放出来覆盖旧版面.
 genieEffect              旧版面在屏幕左下方或右下方被吸走, 显示出下面的新版面
 unGenieEffect            新版面在屏幕左下方或右下方被释放出来覆盖旧版面.
 twist                    版面以水平方向像龙卷风式转出来.
 tubey                    版面垂直附有弹性的转出来.
 swirl                    旧版面360度旋转并淡出, 显示出新版面.
 charminUltra             旧版面淡出并显示新版面.
 zoomyIn                  新版面由小放大走到前面, 旧版面放大由前面消失.
 zoomyOut                 新版面屏幕外面缩放出现, 旧版面缩小消失.
 oglApplicationSuspend    像按”home” 按钮的效果.
 
 */

@implementation TransitionAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //更改push后视图的返回按钮标题
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
    
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
    [_dataArray addObject:@"kCATransitionPush"];
    [_dataArray addObject:@"kCATransitionMoveIn"];
    [_dataArray addObject:@"kCATransitionReveal"];
    [_dataArray addObject:@"kCATransitionFade"];
    
    [_dataArray addObject:@"cube"];
    [_dataArray addObject:@"alignedCube"];
    
    [_dataArray addObject:@"suckEffect"];
    [_dataArray addObject:@"rippleEffect"];
    
    [_dataArray addObject:@"pageCurl"];
    [_dataArray addObject:@"pageUnCurl"];
    
    [_dataArray addObject:@"flip"];
    [_dataArray addObject:@"alignedFlip"];
    [_dataArray addObject:@"oglFlip"];
    
    [_dataArray addObject:@"cameraIris"];
    [_dataArray addObject:@"cameraIrisHollowOpen"];
    [_dataArray addObject:@"cameraIrisHollowClose"];
    
    
    
    
//    [_dataArray addObject:@"spewEffect"];
//    [_dataArray addObject:@"genieEffect"];
//    [_dataArray addObject:@"unGenieEffect"];
//    [_dataArray addObject:@"twist"];
//    [_dataArray addObject:@"tubey"];
//    [_dataArray addObject:@"swirl"];
//    [_dataArray addObject:@"charminUltra"];
//    [_dataArray addObject:@"zoomyIn"];
//    [_dataArray addObject:@"zoomyOut"];
//    [_dataArray addObject:@"oglApplicationSuspend"];

    
    
    
    //添加核心动画类型
    //CAAnimation 包含以下几种动画类型
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
    [dictionary setObject:@"推入效果" forKey:@"kCATransitionPush"];
    [dictionary setObject:@"移入效果" forKey:@"kCATransitionMoveIn"];
    [dictionary setObject:@"截开效果" forKey:@"kCATransitionReveal"];
    [dictionary setObject:@"渐入渐出" forKey:@"kCATransitionFade"];
    
    
    [dictionary setObject:@"立体效果一" forKey:@"cube"];
    [dictionary setObject:@"立体效果二" forKey:@"alignedCube"];
    
    [dictionary setObject:@"三角" forKey:@"suckEffect"];
    [dictionary setObject:@"水波抖动" forKey:@"rippleEffect"];
    
    [dictionary setObject:@"上翻页" forKey:@"pageCurl"];
    [dictionary setObject:@"下翻页" forKey:@"pageUnCurl"];
    
    [dictionary setObject:@"翻转效果一" forKey:@"flip"];
    [dictionary setObject:@"翻转效果二" forKey:@"alignedFlip"];
    [dictionary setObject:@"翻转效果三" forKey:@"oglFlip"];
    
    [dictionary setObject:@"镜头快门" forKey:@"cameraIris"];
    [dictionary setObject:@"镜头快门开" forKey:@"cameraIrisHollowOpen"];
    [dictionary setObject:@"镜头快门关" forKey:@"cameraIrisHollowClose"];
    
    
//    [dictionary setObject:@"新版面在屏幕下方中间位置被释放出来覆盖旧版面." forKey:@"spewEffect"];
//    [dictionary setObject:@"旧版面在屏幕左下方或右下方被吸走, 显示出下面的新版面" forKey:@"genieEffect"];
//    [dictionary setObject:@"新版面在屏幕左下方或右下方被释放出来覆盖旧版面." forKey:@"unGenieEffect"];
//    [dictionary setObject:@"版面以水平方向像龙卷风式转出来." forKey:@"twist"];
//    [dictionary setObject:@"版面垂直附有弹性的转出来." forKey:@"tubey"];
//    [dictionary setObject:@"旧版面360度旋转并淡出, 显示出新版面." forKey:@"swirl"];
//    [dictionary setObject:@"旧版面淡出并显示新版面." forKey:@"charminUltra"];
//    [dictionary setObject:@"新版面由小放大走到前面, 旧版面放大由前面消失." forKey:@"zoomyIn"];
//    [dictionary setObject:@"新版面屏幕外面缩放出现, 旧版面缩小消失." forKey:@"zoomyOut"];
//    [dictionary setObject:@"像按”home” 按钮的效果." forKey:@"oglApplicationSuspend"];
    
    _dic = dictionary;
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {

    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 4;
    }else if (section == 1) {
        return 12;
    }
//    else if (section == 2) {
//        return 10;
//    }
    return 0;
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}


- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return @"四种基本效果";
    }else if (section == 1) {
        return @"其它API效果";
    }
//    else if (section == 2) {
//        return @"10种非安全API效果";
//    }
    return nil;
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
    
    if (indexPath.section == 0) {
        cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row ];
        cell.detailTextLabel.text = [_dic valueForKey:[_dataArray objectAtIndex:indexPath.row]];
    }else if (indexPath.section == 1) {
        cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row +4 ];
        cell.detailTextLabel.text = [_dic valueForKey:[_dataArray objectAtIndex:indexPath.row+ 4]];
    }
//    else if (indexPath.section == 2) {
//        cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row + 12];
//        cell.detailTextLabel.text = [_dic valueForKey:[_dataArray objectAtIndex:indexPath.row+ 12]];
//    }
   
    return cell;
}

#pragma mark - UITableViewDelegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TransitionAnimationVC *vc = [[TransitionAnimationVC alloc]init];
    
    NSInteger typeIndex = 0 ;
    if (indexPath.section == 0) {
        typeIndex = -1 ;
        vc.title = [_dic valueForKey:[_dataArray objectAtIndex:indexPath.row]];
    }else if (indexPath.section == 1) {
        typeIndex = indexPath.row +4;
        vc.title = [_dic valueForKey:[_dataArray objectAtIndex:indexPath.row + 4]];
    }
//    else if (indexPath.section == 2) {
//        typeIndex = indexPath.row +12;
//    }
    
    
    //定义动画
    CATransition *animation = [CATransition animation];
    // 响应时间
    animation.duration = 0.5;
    animation.delegate=self;
    animation.timingFunction=UIViewAnimationCurveEaseInOut;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    // 决定动画的进度
    animation.startProgress =0.0;
    animation.endProgress =1.0;
    // 动画效果
    if (typeIndex > 0) {
        
        animation.type = [_dataArray objectAtIndex:typeIndex];
        vc.animationType = [_dataArray objectAtIndex:typeIndex];
    }else {
        animation.subtype = kCATransitionFromRight;
        switch (indexPath.row) {
            case 0:
            {
                animation.type = kCATransitionPush;
                vc.animationType = kCATransitionPush;
                break;
            }
                
            case 1:
            {
                animation.type = kCATransitionMoveIn;
                vc.animationType = kCATransitionMoveIn;
                break;
            }
            case 2:
            {
                animation.type = kCATransitionReveal;
                vc.animationType = kCATransitionReveal;
                break;
            }
            case 3:
            {
                animation.type = kCATransitionFade;
                vc.animationType = kCATransitionFade;
                break;
            }
            default:
                break;
        }
    
    }
//    TransitionSubtypeFromLeft = 1,  // 从左边进入
//    TransitionSubtypeFromRight,     // 从右边进入
//    TransitionSubtypeFromTop,       // 从顶部进入
//    TransitionSubtypeFromBottom
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    
    
//    vc.title = [_dic valueForKey:[_dataArray objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
