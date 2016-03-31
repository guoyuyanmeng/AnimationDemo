//
//  KeyframeAnimationVC.h
//  动画类型
//
//  Created by kang on 16/3/29.
//  Copyright © 2016年 kang. All rights reserved.
//

#import <UIKit/UIKit.h>


/** animationWithKeyPath的值：
 
 *   transform.scale = 比例转换
 
 *   transform.scale.x = 宽的比例转换
 
 *   transform.scale.y = 高的比例转换
 
 *   transform.rotation.z = 平面旋转
 
 *   opacity = 透明度
 
 *   margin
 
 *   zPosition
 
 *   backgroundColor    背景颜色
 
 *   cornerRadius    圆角
 
 *   borderWidth
 
 *   bounds
 
 *   contents
 
 *   contentsRect
 
 *   cornerRadius
 
 *   frame
 
 *   hidden
 
 *   mask
 
 *   masksToBounds
 
 *   opacity
 
 *   position
 
 *   shadowColor
 
 *   shadowOffset
 
 *   shadowOpacity
 
 *   shadowRadius
 */


@interface KeyframeAnimationVC : UIViewController

//多路径动画
- (void) multiPathAnimation;



@end
