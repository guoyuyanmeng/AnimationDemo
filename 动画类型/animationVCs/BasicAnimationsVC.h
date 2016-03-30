//
//  BasicAnimationsVC.h
//  动画类型
//
//  Created by kang on 16/3/29.
//  Copyright © 2016年 kang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicAnimationsVC : UIViewController

//缩放动画
- (void)initScaleLayer;

//平移动画
- (void)initPositionLayer;

//x轴 旋转动画
- (void) initTransformXLayer;

//y轴 旋转动画
- (void) initTransformYLayer;

//z轴 旋转动画
- (void) initTransformZLayer;

//透明度动画
- (void) opacityAnimation;

//图片切换动画
- (void) backgrounImageAnimation;

//背景色动画
- (void) backgroundColorAnimation;

@end
