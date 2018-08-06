//
//  Login.h
//  share模仿
//
//  Created by 开朗的男子 on 2018/7/27.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Login : UIViewController
<UITextFieldDelegate>

@property(nonatomic, strong)UITabBarController * tbController;

@property (strong, nonatomic) UIWindow * window;

@property (copy, nonatomic) NSArray * pageTable;

@property(nonatomic, strong)UITextField * tf1;
@property(nonatomic, strong)UITextField * tf2;
@property(nonatomic, copy)NSString * na;
@property(nonatomic, copy)NSString * pa;

@end
