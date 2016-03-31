//
//  KeyframeAnimationVC.m
//  动画类型
//
//  Created by kang on 16/3/29.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "KeyframeAnimationVC.h"

@interface KeyframeAnimationVC ()
{

//    UIImageView *_imageView;
}
@end

@implementation KeyframeAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];

}


- (void) movePointAnimation {
    
    UIImageView *_imageView = [[UIImageView alloc]init];
    [_imageView setImage:[UIImage imageNamed:@"lufei2"]];
    _imageView.bounds = CGRectMake(0, 0, 100, 100);
    _imageView.center = self.view.center;
    _imageView.layer.cornerRadius = 50;
    [self.view addSubview:_imageView];
    
    
//    CGFloat w = self.view.bounds.size.width - 60 ;
//    CGFloat h = self.view.bounds.size.height- 60 - 60;
//    CGFloat xoffset = w/5;
//    CGFloat yoffset = h/5;
    
    [UIView animateKeyframesWithDuration: 4 delay: 0 options: UIViewKeyframeAnimationOptionCalculationModeLinear animations: ^{
//        __block CGPoint center = _imageView.center;
        [UIView addKeyframeWithRelativeStartTime: 0 relativeDuration: 0.1 animations: ^{
            _imageView.center = (CGPoint){ 50, 300  };
        }];
        [UIView addKeyframeWithRelativeStartTime: 0.1 relativeDuration: 0.15 animations: ^{
            _imageView.center = (CGPoint){ 100 , 100 };
        }];
        [UIView addKeyframeWithRelativeStartTime: 0.25 relativeDuration: 0.3 animations: ^{
            _imageView.center = (CGPoint){ 150, 250 };
        }];
        [UIView addKeyframeWithRelativeStartTime: 0.55 relativeDuration: 0.3 animations: ^{
            _imageView.center = (CGPoint){ 200, 450 };
        }];
        [UIView addKeyframeWithRelativeStartTime: 0.85 relativeDuration: 0.15 animations: ^{
            _imageView.center = (CGPoint){ 300, 200 };
        }];
        [UIView addKeyframeWithRelativeStartTime: 0 relativeDuration: 1 animations: ^{
            _imageView.transform = CGAffineTransformMakeRotation(2 * M_PI);
        }];
    } completion: nil];

}

//缩放
- (void) scaleAnimation {

    CALayer *scaleLayer = [[CALayer alloc] init];
    scaleLayer.frame = CGRectMake(100, 200, 100, 100);
    scaleLayer.position = self.view.center;
    scaleLayer.cornerRadius = 50;
    scaleLayer.backgroundColor = [[UIColor blackColor] CGColor];
    [self.view.layer addSublayer:scaleLayer];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D scale1 = CATransform3DMakeScale(0.5, 0.5, 1);
    CATransform3D scale2 = CATransform3DMakeScale(1.0, 1.0, 1);
    CATransform3D scale3 = CATransform3DMakeScale(2.0, 2.0, 1);
    CATransform3D scale4 = CATransform3DMakeScale(3.0, 3.0, 1);
    
    NSArray *frameValues = [NSArray arrayWithObjects:
                            [NSValue valueWithCATransform3D:scale1],
                            [NSValue valueWithCATransform3D:scale2],
                            [NSValue valueWithCATransform3D:scale3],
                            [NSValue valueWithCATransform3D:scale4],
                            nil];
    
    [animation setValues:frameValues];
    
    NSArray *frameTimes = [NSArray arrayWithObjects:
                           [NSNumber numberWithFloat:0.0],
                           [NSNumber numberWithFloat:1.5],
                           [NSNumber numberWithFloat:3.0],
                           [NSNumber numberWithFloat:5.0],
                           nil];
    [animation setKeyTimes:frameTimes];
    [animation setRemovedOnCompletion:NO];
    animation.fillMode = kCAFillModeForwards;
    animation.calculationMode = kCAAnimationPaced;
    animation.delegate = self;
    animation.duration = 5;
    animation.repeatCount = 0;
    animation.autoreverses = YES;
    
    [scaleLayer addAnimation:animation forKey:@"scaleAnimation"];
}

//旋转动画
- (void) rotationAnimation {
    
    UIImageView *_imageView = [[UIImageView alloc]init];
    [_imageView setImage:[UIImage imageNamed:@"lufei2"]];
    _imageView.bounds = CGRectMake(0, 0, 100, 100);
    _imageView.center = self.view.center;
    _imageView.layer.cornerRadius = 50;
    [self.view addSubview:_imageView];

    CAKeyframeAnimation *keyAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    CATransform3D rotation1 = CATransform3DMakeRotation(30 * M_PI/180, 0, 0, -1);
    CATransform3D rotation2 = CATransform3DMakeRotation(60 * M_PI/180, 0, 0, -1);
    CATransform3D rotation3 = CATransform3DMakeRotation(90 * M_PI/180, 0, 0, -1);
    CATransform3D rotation4 = CATransform3DMakeRotation(120 * M_PI/180, 0, 0, -1);
    CATransform3D rotation5 = CATransform3DMakeRotation(150 * M_PI/180, 0, 0, -1);
    CATransform3D rotation6 = CATransform3DMakeRotation(180 * M_PI/180, 0, 0, -1);
    
    [keyAnim setValues:[NSArray arrayWithObjects:
                        [NSValue valueWithCATransform3D:rotation1],
                        [NSValue valueWithCATransform3D:rotation2],
                        [NSValue valueWithCATransform3D:rotation3],
                        [NSValue valueWithCATransform3D:rotation4],
                        [NSValue valueWithCATransform3D:rotation5],
                        [NSValue valueWithCATransform3D:rotation6],
                        nil]];
    [keyAnim setKeyTimes:[NSArray arrayWithObjects:
                          [NSNumber numberWithFloat:0.0],
                          [NSNumber numberWithFloat:0.2f],
                          [NSNumber numberWithFloat:0.4f],
                          [NSNumber numberWithFloat:0.6f],
                          [NSNumber numberWithFloat:0.8f],
                          [NSNumber numberWithFloat:1.0f],
                          nil]];
    [keyAnim setDuration:1];
    [keyAnim setFillMode:kCAFillModeForwards];
    [keyAnim setRemovedOnCompletion:NO];
    keyAnim.repeatCount = 0;
    keyAnim.autoreverses = YES;
    keyAnim.delegate = self;
    [_imageView.layer addAnimation:keyAnim forKey:@"rotationAnimation"];

}

//位置关键正动画
- (void) positionAnimation {
    
    UIImageView *_imageView = [[UIImageView alloc]init];
    [_imageView setImage:[UIImage imageNamed:@"lufei2"]];
    _imageView.bounds = CGRectMake(0, 0, 60, 60);
    _imageView.center = CGPointMake(30, 90);
    _imageView.layer.cornerRadius = 30;
    [self.view addSubview:_imageView];
    
    
    CGPoint beginPoint = _imageView.center;
    CGPoint endPoint = CGPointMake(self.view.bounds.size.width - 30, self.view.bounds.size.height- 30);

    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.delegate = self;
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.duration = 3.0;
    pathAnimation.repeatCount = 0;
    
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, 30, 0);
    CGPathAddQuadCurveToPoint(curvedPath, NULL, beginPoint.x, endPoint.y, endPoint.x, endPoint.y);
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    
    //开始动画
    [_imageView.layer addAnimation:pathAnimation forKey:@"moveTheSquare"];
    
}

//多路径动画
- (void) multiPathAnimation {
    
    UIImageView *_imageView = [[UIImageView alloc]init];
    [_imageView setImage:[UIImage imageNamed:@"lufei2"]];
    _imageView.bounds = CGRectMake(0, 0, 60, 60);
    _imageView.center = CGPointMake(30, 90);
    _imageView.layer.cornerRadius = 30;
    [self.view addSubview:_imageView];

    
    CGMutablePathRef path = CGPathCreateMutable();
    //将路径的起点定位到（50  120）
    CGPathMoveToPoint(path,NULL,50.0,120.0);
    //下面5行添加5条直线的路径到path中
    CGPathAddLineToPoint(path, NULL, 60, 130);
    CGPathAddLineToPoint(path, NULL, 70, 140);
    CGPathAddLineToPoint(path, NULL, 80, 150);
    CGPathAddLineToPoint(path, NULL, 90, 160);
    CGPathAddLineToPoint(path, NULL, 100, 170);
    //下面四行添加四条曲线路径到path
    CGPathAddCurveToPoint(path,NULL,50.0,275.0,150.0,275.0,70.0,120.0);
    CGPathAddCurveToPoint(path,NULL,150.0,275.0,250.0,275.0,90.0,120.0);
    CGPathAddCurveToPoint(path,NULL,250.0,275.0,350.0,275.0,110.0,120.0);
    CGPathAddCurveToPoint(path,NULL,350.0,275.0,450.0,275.0,130.0,120.0);
    //以“position”为关键字
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //设置path属性
    [animation setPath:path];
    [animation setDuration:3.0];
    //这句代码表示 是否动画回到原位
    //[animation setAutoreverses:YES];
    [animation setRemovedOnCompletion:NO];
    CFRelease(path);  
    [_imageView.layer addAnimation:animation forKey:NULL];
    
}

//背景色动画
- (void) backgroundColorAnimation {
    
    
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    
    animation.values= @[
                        (id)[UIColor redColor].CGColor,
                        (id)[UIColor yellowColor].CGColor,
                        (id)[UIColor blueColor].CGColor
                        ];
    //设定每个关键帧的时长，如果没有显式地设置，则默认每个帧的时间=总duration/(values.count - 1)
    animation.keyTimes = @[
                            [NSNumber numberWithFloat:0.0],
                            [NSNumber numberWithFloat:0.8],
                            [NSNumber numberWithFloat:1.2],
                            [NSNumber numberWithFloat:1.5]
                           ];
    
    animation.repeatCount=MAXFLOAT;
    
    animation.duration=1.5;
    
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
    backgroundLayer.position = self.view.center;
    
    //开演
    [backgroundLayer addAnimation:animation forKey:@"backgroundLayerAnimation"];
}

//内容动画
- (void) contentsAnimation {
    
    UIImageView *_imageView = [[UIImageView alloc]init];
    [_imageView setImage:[UIImage imageNamed:@"lufei2"]];
    _imageView.bounds = CGRectMake(0, 0, 100, 200);
    _imageView.center = self.view.center;
    _imageView.layer.cornerRadius = 5;
    [self.view addSubview:_imageView];
    
    
    id value0 = (id)[UIImage imageNamed:@"lufei2"].CGImage;
    id value1 = (id)[UIImage imageNamed:@"lufei8"].CGImage;
    id value2 = (id)[UIImage imageNamed:@"suolong2"].CGImage;
    id value3 = (id)[UIImage imageNamed:@"suolong3"].CGImage;
    
    
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    [animation setDuration:2];
    animation.repeatCount=MAXFLOAT;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    
    
    [animation setValues:@[value0,value1,value2,value3]];
     
    [animation setKeyTimes:[NSArray arrayWithObjects:
                          [NSNumber numberWithFloat:0.0],
                          [NSNumber numberWithFloat:0.3f],
                          [NSNumber numberWithFloat:0.8f],
                          [NSNumber numberWithFloat:2.0f],
                          nil]];

    
    //这句代码表示 是否动画回到原位
    [animation setAutoreverses:YES];
    [animation setRemovedOnCompletion:NO];
    animation.calculationMode = kCAAnimationLinear;
    //begin animation
    [_imageView.layer addAnimation:animation forKey:NULL];
    
}

//绕矩形循环跑
- (void)initRectLayer {

    CALayer *rectLayer = [[CALayer alloc] init];
    rectLayer.frame = CGRectMake(25, 200, 50, 50);
    rectLayer.cornerRadius = 25;
    rectLayer.backgroundColor = [[UIColor greenColor] CGColor];
    [self.view.layer addSublayer:rectLayer];

    CGPoint begin = rectLayer.position;
    CGFloat w = self.view.bounds.size.width -50;
    CAKeyframeAnimation *rectRunAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];

    //设定关键帧位置，必须含起始与终止位置
    rectRunAnimation.values = @[
                             [NSValue valueWithCGPoint:begin],
                             [NSValue valueWithCGPoint:CGPointMake(w,begin.y)],
                             [NSValue valueWithCGPoint:CGPointMake(w,begin.y + 100)],
                             [NSValue valueWithCGPoint:CGPointMake(begin.x,begin.y + 100)],
                             [NSValue valueWithCGPoint:begin]
                             ];

    //设定每个关键帧的时长，如果没有显式地设置，则默认每个帧的时间=总duration/(values.count - 1)
    rectRunAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0],
                               [NSNumber numberWithFloat:0.5],
                               [NSNumber numberWithFloat:0.7],
                               [NSNumber numberWithFloat:0.9],
                               [NSNumber numberWithFloat:1.2]];
    
    rectRunAnimation.timingFunctions = @[
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    rectRunAnimation.repeatCount = 1000;
    rectRunAnimation.autoreverses = NO;
    [rectRunAnimation setRemovedOnCompletion:NO];
//    rectRunAnimation.calculationMode = kCAAnimationLinear;
    rectRunAnimation.duration = 1.2;
    [rectLayer addAnimation:rectRunAnimation forKey:@"rectRunAnimation"];

}



//动画暂停
-(void)pauseLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

//继续动画
-(void)resumeLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}

@end
