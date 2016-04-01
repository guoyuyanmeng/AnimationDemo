//
//  TransitionAnimationVC.m
//  动画类型
//
//  Created by kang on 16/3/31.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "TransitionAnimationVC.h"

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


/**
 
 setSubtype:有四种类型：
 
 kCATransitionFromRight；
 
 kCATransitionFromLeft(默认值)
 
 kCATransitionFromTop；
 
 kCATransitionFromBottom
 
 */

@interface TransitionAnimationVC ()
{
    UIView *_bgView;
    UIImageView *_imageView;
    UIImageView *_imageView2;
    CATransition *_animation;
    
    NSArray *_images;
    
    int direction;
    BOOL isBlue;
    
    int current;
}


@end

@implementation TransitionAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    direction = 0;
    isBlue = YES;
    current = 1;
    
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
    _bgView.backgroundColor = [UIColor lightGrayColor];
    _bgView.center = self.view.center;
    _bgView.tag = 150;
    
    _imageView = [[UIImageView alloc]init];
    _imageView.image = [UIImage imageNamed:@"ace1"];
    _imageView.frame = CGRectMake(0, 0, 100, 200);
//    _imageView.center = _bgView.center;
    _imageView.layer.cornerRadius = 5;
    _imageView.tag = 100;
    
    _imageView2 = [[UIImageView alloc]init];
    _imageView2.image = [UIImage imageNamed:@"ace2"];
    _imageView2.frame = CGRectMake(0, 0, 100, 200);
//    _imageView2.center = _bgView.center;
    _imageView2.layer.cornerRadius = 5;
    _imageView2.tag = 101;
    
    [_bgView addSubview:_imageView2];
    [_bgView addSubview:_imageView];
    
    
    _images = [[NSArray alloc]initWithObjects:
               @"ace1",
               @"ace2",
               @"ace3",
               
               @"lufei1",
               @"lufei2",
               @"lufei4",
               @"lufei5",
               @"lufei6",
               @"lufei7",
               @"lufei8",
               @"lufei9",
               
               @"suolong1",
               @"suolong2",
               @"suolong3",
               @"suolong4",
               @"suolong5",
               @"suolong6",
                nil];
    
    
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [startBtn setTitle:@"开始" forState:UIControlStateNormal];
    startBtn.frame = CGRectMake(0, 0, 40, 25);
    [startBtn addTarget:self action:@selector(doAnimation)forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:startBtn];
    
    [self.view addSubview:_bgView];
    [self.view addSubview:startBtn];
    
    
}

- (void) doAnimation {
    
    if (direction == _images.count - 1) {

        if (current == 1) {
            [_imageView2 setImage:[UIImage imageNamed:[_images objectAtIndex:0]]];
        }else if (current == 2) {
            [_imageView setImage:[UIImage imageNamed:[_images objectAtIndex:0]]];
        }

    }else {
        if (current == 1) {
            [_imageView2 setImage:[UIImage imageNamed:[_images objectAtIndex:direction +1]]];
        }else if (current == 2) {
            [_imageView setImage:[UIImage imageNamed:[_images objectAtIndex:direction +1 ]]];
        }
    }
    
    
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 1.0f; //动画时长
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.fillMode = kCAFillModeForwards;
    animation.startProgress = 0.0; //动画开始起点(在整体动画的百分比)
    animation.endProgress = 1.0;  //动画停止终点(在整体动画的百分比)
    animation.removedOnCompletion = YES;
    
    animation.type = _animationType;
//    animation.type = @"curlUp";
    animation.subtype = @"fromLeft"; //过渡方向
    
    
    //执行动画
    NSInteger front = [[_bgView subviews] indexOfObject:_imageView];
    NSInteger back = [[_bgView subviews] indexOfObject:_imageView2];
    
    if (isBlue) {
        [_bgView exchangeSubviewAtIndex:front withSubviewAtIndex:back];  //图形变换
    }else {
        [_bgView exchangeSubviewAtIndex:back withSubviewAtIndex:front];
    }
    
    
    [[_bgView layer] addAnimation:animation forKey:@"animation"];     //bgView层执行动画

    if(++direction > _images.count-1) direction -= _images.count;
    if (current == 1) {
        current = 2;
    }else {
        current = 1;
    }
    isBlue = !isBlue;
    
    NSLog(@"type = %@",animation.type);
}


//方块动画
- (void) cubeAnimation {
    
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 1.0f; //动画时长
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.fillMode = kCAFillModeForwards;
    animation.startProgress = 0.0; //动画开始起点(在整体动画的百分比)
    animation.endProgress = 1.0;  //动画停止终点(在整体动画的百分比)
    animation.removedOnCompletion = NO;
    
    animation.type = @"cube"; //过度效果
    animation.subtype = @"formLeft"; //过渡方向
    
    [_imageView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [_imageView.layer addAnimation:animation forKey:@"animation"];
    [self.view addSubview:_imageView];
}


@end
