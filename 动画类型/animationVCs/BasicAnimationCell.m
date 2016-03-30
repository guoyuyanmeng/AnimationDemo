//
//  BasicAnimationCell.m
//  动画类型
//
//  Created by kang on 16/3/30.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "BasicAnimationCell.h"

@interface BasicAnimationCell ()
{
    
    UIImageView *_imageView;
}
@end

@implementation BasicAnimationCell


- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _imageView = [[UIImageView alloc]init];
        _imageView.image = [UIImage imageNamed:@"lufei2"];
        _imageView.frame = CGRectMake(self.frame.size.width -80, 10, 60, 60);
        _imageView.layer.cornerRadius = 5;
        [self addSubview:_imageView];
        
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

//缩放动画
- (void)initScaleLayer
{

    //设定剧本
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
    scaleAnimation.autoreverses = YES;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.repeatCount = MAXFLOAT;
    scaleAnimation.duration = 0.5;
    
    //开演
    [_imageView.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}

//平移动画
- (void)initPositionLayer
{
    CGPoint position = _imageView.center;

    //设定剧本
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:position];
    positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(position.x + 50,
                                                                      position.y)];
    positionAnimation.autoreverses = YES;
    positionAnimation.repeatCount = MAXFLOAT;
    positionAnimation.duration = 2;
    
    //开演
    [_imageView.layer addAnimation:positionAnimation forKey:@"positionAnimation"];
}


//x轴 旋转动画
- (void) initTransformXLayer {
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:6 * M_PI];
    rotateAnimation.autoreverses = NO;
    rotateAnimation.repeatCount = MAXFLOAT;
    rotateAnimation.duration = 2;
    
    //开演
    [_imageView.layer addAnimation:rotateAnimation forKey:@"transformXAnimation"];
}

//y轴 旋转动画
- (void) initTransformYLayer {
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:6 * M_PI];
    rotateAnimation.autoreverses = NO;
    rotateAnimation.repeatCount = MAXFLOAT;
    rotateAnimation.duration = 2;
    
    //开演
    [_imageView.layer addAnimation:rotateAnimation forKey:@"transformYAnimation"];
}

//z轴 旋转动画
- (void) initTransformZLayer {
    
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:6 * M_PI];
    rotateAnimation.autoreverses = NO;
    rotateAnimation.repeatCount = MAXFLOAT;
    rotateAnimation.duration = 2;
    
    //开演
    [_imageView.layer addAnimation:rotateAnimation forKey:@"transformYAnimation"];
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
    
    
    //开演
    [_imageView.layer addAnimation:animation forKey:@"opacityAnimation"];
    
}

//背景色动画
- (void) backgroundColorAnimation {
    
    _imageView.image = nil;
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    
    animation.fromValue= (id)[UIColor blackColor].CGColor;
    
    animation.toValue= (id)[UIColor redColor].CGColor;
    
    animation.repeatCount=MAXFLOAT;
    
    animation.duration=2;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    animation.autoreverses=YES;
    
    //开演
    [_imageView.layer addAnimation:animation forKey:@"backgroundLayerAnimation"];
}



//图片切换动画
- (void) backgrounImageAnimation {
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"contents"];
    
    animation.fromValue= (id)[UIImage imageNamed:@"lufei8"].CGImage;
    
    animation.toValue= (id)[UIImage imageNamed:@"suolong2"].CGImage;
    
    animation.repeatCount=MAXFLOAT;
    
    animation.duration=2;
    
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
    [self.layer addSublayer:groupLayer];
    
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

//动画暂停
-(void)pauseLayer
{
    CFTimeInterval pausedTime = [_imageView.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    _imageView.layer.speed = 0.0;
    _imageView.layer.timeOffset = pausedTime;
}

//移除动画
-(void) removeLayer
{
    [_imageView.layer removeAllAnimations];
//    CFTimeInterval pausedTime = [_imageView.layer convertTime:CACurrentMediaTime() fromLayer:nil];
//    _imageView.layer.speed = 0.0;
//    _imageView.layer.timeOffset = pausedTime;
}

//继续动画
-(void)resumeLayer
{
    CFTimeInterval pausedTime = [_imageView.layer timeOffset];
    _imageView.layer.speed = 1.0;
    _imageView.layer.timeOffset = 0.0;
    _imageView.layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [_imageView.layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    _imageView.layer.beginTime = timeSincePause;
}


@end
