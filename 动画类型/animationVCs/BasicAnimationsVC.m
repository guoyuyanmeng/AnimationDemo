//
//  BasicAnimationsVC.m
//  动画类型
//
//  Created by kang on 16/3/29.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "BasicAnimationsVC.h"

@interface BasicAnimationsVC ()
{

    CGPoint viewCenter;
}
@end

@implementation BasicAnimationsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    viewCenter = self.view.layer.position;
}

//缩放动画
- (void)initScaleLayer
{
    //演员初始化
    CALayer *scaleLayer = [[CALayer alloc] init];
    scaleLayer.backgroundColor = [UIColor blueColor].CGColor;
    scaleLayer.bounds = CGRectMake(0, 0, 50, 50);
    scaleLayer.cornerRadius = 10;
    [self.view.layer addSublayer:scaleLayer];
    scaleLayer.position = viewCenter;
    
    //设定剧本
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
    scaleAnimation.autoreverses = YES;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.repeatCount = MAXFLOAT;
    scaleAnimation.duration = 0.5;
    
    //开演
    [scaleLayer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}

//平移动画
- (void)initPositionLayer
{
    //演员初始化
    CALayer *positionLayer = [[CALayer alloc] init];
    positionLayer.backgroundColor = [UIColor blueColor].CGColor;
    positionLayer.bounds = CGRectMake(0, 0, 50, 50);
    positionLayer.cornerRadius = 10;
    [self.view.layer addSublayer:positionLayer];
    positionLayer.position = viewCenter;
    
    //设定剧本
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:positionLayer.position];
    positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(320 - 80,
                                                                      positionLayer.position.y)];
    positionAnimation.autoreverses = YES;
    positionAnimation.repeatCount = MAXFLOAT;
    positionAnimation.duration = 2;
    
    //开演
    [positionLayer addAnimation:positionAnimation forKey:@"positionAnimation"];
}


//x轴 旋转动画
- (void) initTransformXLayer {
    
    //演员初始化
    CALayer *transformXLayer = [[CALayer alloc] init];
    transformXLayer.backgroundColor = [UIColor blueColor].CGColor;
    transformXLayer.bounds = CGRectMake(0, 0, 50, 50);
    transformXLayer.cornerRadius = 10;
    [self.view.layer addSublayer:transformXLayer];
    transformXLayer.position = viewCenter;
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:6 * M_PI];
    rotateAnimation.autoreverses = NO;
    rotateAnimation.repeatCount = MAXFLOAT;
    rotateAnimation.duration = 2;
    
    //开演
    [transformXLayer addAnimation:rotateAnimation forKey:@"transformXAnimation"];
}

//y轴 旋转动画
- (void) initTransformYLayer {
    
    //演员初始化
    CALayer *transformYLayer = [[CALayer alloc] init];
    transformYLayer.backgroundColor = [UIColor blueColor].CGColor;
    transformYLayer.bounds = CGRectMake(60, 80, 50, 50);
    transformYLayer.cornerRadius = 10;
    [self.view.layer addSublayer:transformYLayer];
    transformYLayer.position = viewCenter;
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:6 * M_PI];
    rotateAnimation.autoreverses = NO;
    rotateAnimation.repeatCount = MAXFLOAT;
    rotateAnimation.duration = 2;
    
    //开演
    [transformYLayer addAnimation:rotateAnimation forKey:@"transformYAnimation"];
}

//z轴 旋转动画
- (void) initTransformZLayer {
    
    //演员初始化
    CALayer *transformZLayer = [[CALayer alloc] init];
    transformZLayer.backgroundColor = [UIColor blueColor].CGColor;
    transformZLayer.bounds = CGRectMake(0, 0, 50, 50);
    transformZLayer.cornerRadius = 10;
    [self.view.layer addSublayer:transformZLayer];
    transformZLayer.position = viewCenter;
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:6 * M_PI];
    rotateAnimation.autoreverses = NO;
    rotateAnimation.repeatCount = MAXFLOAT;
    rotateAnimation.duration = 2;
    
    //开演
    [transformZLayer addAnimation:rotateAnimation forKey:@"transformYAnimation"];
}

//透明度动画
- (void) opacityAnimation {

    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    
    animation.fromValue=[NSNumber numberWithFloat:1.0];
    
    animation.toValue=[NSNumber numberWithFloat:0.2];
    
    animation.repeatCount=MAXFLOAT;
    
    animation.duration=1;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    animation.autoreverses=YES;
    
    
    //演员初始化
    CALayer *opacityLayer = [[CALayer alloc] init];
    opacityLayer.backgroundColor = [UIColor blueColor].CGColor;
    opacityLayer.bounds = CGRectMake(0, 0, 50, 50);
    opacityLayer.cornerRadius = 10;
    [self.view.layer addSublayer:opacityLayer];
    opacityLayer.position = viewCenter;
    
    //开演
    [opacityLayer addAnimation:animation forKey:@"opacityAnimation"];

}

//背景色动画
- (void) backgroundColorAnimation {
    
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    
    animation.fromValue= (id)[UIColor blueColor].CGColor;
    
    animation.toValue= (id)[UIColor greenColor].CGColor;
    
    animation.repeatCount=MAXFLOAT;
    
    animation.duration=2;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    animation.autoreverses=YES;
    
    
    //演员初始化
    CALayer *backgroundLayer = [[CALayer alloc] init];
    backgroundLayer.backgroundColor = [UIColor blueColor].CGColor;
    backgroundLayer.bounds = CGRectMake(0, 0, 50, 50);
    backgroundLayer.cornerRadius = 10;
    [self.view.layer addSublayer:backgroundLayer];
    backgroundLayer.position = viewCenter;
    
    //开演
    [backgroundLayer addAnimation:animation forKey:@"backgroundLayerAnimation"];
}






//图片切换动画
- (void) backgrounImageAnimation {
    
    UIImageView *_imageView = [[UIImageView alloc]init];
    [_imageView setImage:[UIImage imageNamed:@"lufei2"]];
    _imageView.bounds = CGRectMake(0, 0, 100, 200);
    _imageView.center = self.view.center;
    _imageView.layer.cornerRadius = 10;
    [self.view addSubview:_imageView];
    
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"contents"];
    
    animation.fromValue= (id)[UIImage imageNamed:@"lufei8"].CGImage;
    
    animation.toValue= (id)[UIImage imageNamed:@"suolong2"].CGImage;
    
    animation.repeatCount=MAXFLOAT;
    
    animation.duration=5;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    animation.autoreverses=YES;
    
    
    //开演
    [_imageView.layer addAnimation:animation forKey:@"backgrounImageAnimation"];

}
//动画组
- (void)initGroupLayer
{
    //演员初始化
    CALayer *groupLayer = [[CALayer alloc] init];
    groupLayer.frame = CGRectMake(60, 340+100 + 10, 50, 50);
    groupLayer.cornerRadius = 10;
    groupLayer.backgroundColor = [[UIColor purpleColor] CGColor];
    [self.view.layer addSublayer:groupLayer];
    
    //设定剧本
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
    scaleAnimation.autoreverses = YES;
    scaleAnimation.repeatCount = MAXFLOAT;
    scaleAnimation.duration = 0.8;
    
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnimation.fromValue = [NSValue valueWithCGPoint:groupLayer.position];
    moveAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(320 - 80,
                                                                  groupLayer.position.y)];
    moveAnimation.autoreverses = YES;
    moveAnimation.repeatCount = MAXFLOAT;
    moveAnimation.duration = 2;
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:6.0 * M_PI];
    rotateAnimation.autoreverses = YES;
    rotateAnimation.repeatCount = MAXFLOAT;
    rotateAnimation.duration = 2;
    
    CAAnimationGroup *groupAnnimation = [CAAnimationGroup animation];
    groupAnnimation.duration = 2;
    groupAnnimation.autoreverses = YES;
    groupAnnimation.animations = @[moveAnimation, scaleAnimation, rotateAnimation];
    groupAnnimation.repeatCount = MAXFLOAT;
    //开演
    [groupLayer addAnimation:groupAnnimation forKey:@"groupAnnimation"];
}

@end
