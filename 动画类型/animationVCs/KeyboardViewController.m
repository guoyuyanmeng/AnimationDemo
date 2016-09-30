//
//  KeyboardViewController.m
//  动画类型
//
//  Created by kang on 2016/9/30.
//  Copyright © 2016年 kang. All rights reserved.
//

#import "KeyboardViewController.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface KeyboardViewController ()
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIView *leftView;

@end

@implementation KeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNotification];
    
    [self setBottomView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

#pragma mark - 初始化

- (void) setNotification {

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyBoardFrameWillChanged:)
//                                                 name:UIKeyboardWillChangeFrameNotification
//                                               object:nil];
}

- (void) setBottomView {
    
    //将多余的部分切掉
    self.textField.layer.masksToBounds = YES;
    self.textField.layer.cornerRadius = 16;
    
   
    self.textField.leftView = self.leftView;
    self.textField.leftViewMode = UITextFieldViewModeAlways;
}


#pragma mark - notification Action

- (void)keyboardWillShow:(NSNotification *)aNotification
{
    //获取键盘的动画时间
    CGFloat duration = [aNotification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    //创建自带来获取穿过来的对象的info配置信息
    NSDictionary *userInfo = [aNotification userInfo];
    NSLog(@"userInfo:%@",userInfo);
    CGRect endFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //改变底部工具条的底部约束
    self.bottomConstraint.constant =  SCREEN_HEIGHT - endFrame.origin.y;
    
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:duration animations:^{
        [weakSelf.view layoutIfNeeded];//刷新布局，使得工具条随键盘frame改变有动画
    }];
}

//当键退出时调用
- (void)keyboardWillHide:(NSNotification *)aNotification{
    
    //获取键盘的动画时间
    CGFloat duration = [aNotification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    //创建自带来获取穿过来的对象的info配置信息
    NSDictionary *userInfo = [aNotification userInfo];
    NSLog(@"userInfo:%@",userInfo);
    CGRect endFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //改变底部工具条的底部约束
    self.bottomConstraint.constant =  SCREEN_HEIGHT - endFrame.origin.y;
    
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:duration animations:^{
        [weakSelf.view layoutIfNeeded];//刷新布局，使得工具条随键盘frame改变有动画
    }];
}


- (void)keyBoardFrameWillChanged:(NSNotification *)note
{
    
    //获取键盘的动画时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    //创建自带来获取穿过来的对象的info配置信息
    NSDictionary *userInfo = [note userInfo];
    NSLog(@"userInfo:%@",userInfo);
    CGRect endFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //改变底部工具条的底部约束
    self.bottomConstraint.constant =  SCREEN_HEIGHT - endFrame.origin.y;
    
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:duration animations:^{
        
        [weakSelf.view layoutIfNeeded];//刷新布局，使得工具条随键盘frame改变有动画
    }];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.textField resignFirstResponder];
}


- (IBAction)thumbButtonAction:(id)sender {
    
    [self.textField resignFirstResponder];
}


- (IBAction)commentButtonAction:(id)sender {
    
    [self.textField resignFirstResponder];
}

@end
