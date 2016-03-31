//
//  TransitionAnimationVC.h
//  动画类型
//
//  Created by kang on 16/3/31.
//  Copyright © 2016年 kang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TransitionType) {
    
    TransitionFade = 1,     // 淡入淡出
    TransitionPush,         // 推进效果
    TransitionReveal,       // 揭开效果
    TransitionMoveIn,       // 慢慢进入并覆盖效果
    TransitionCube,         // 立体翻转效果
    TransitionSuckEffect,   // 像被吸入瓶子的效果
    TransitionRippleEffect, // 波纹效果
    TransitionPageCurl,     // 翻页效果
    TransitionPageUnCurl,   // 反翻页效果
    TransitionCameraOpen,   // 开镜头效果
    TransitionCameraClose,  // 关镜头效果
    TransitionCurlDown,     // 下翻页效果
    TransitionCurlUp,       // 上翻页效果
    TransitionFlipFromLeft, // 左翻转效果
    TransitionFlipFromRight,// 右翻转效果
    TransitionOglFlip       // 翻转
};

typedef NS_ENUM(NSUInteger, TransitionSubtype) {
    
    TransitionSubtypeFromLeft = 1,  // 从左边进入
    TransitionSubtypeFromRight,     // 从右边进入
    TransitionSubtypeFromTop,       // 从顶部进入
    TransitionSubtypeFromBottom     // 从底部进入
};

@interface TransitionAnimationVC : UIViewController
{
    
}

@property (nonatomic, strong)id animationType;
@end
