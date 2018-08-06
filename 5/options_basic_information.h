//
//  options_basic_information.h
//  share模仿
//
//  Created by 开朗的男子 on 2018/8/1.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface options_basic_information : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView * tableView;
@property(nonatomic, copy)NSArray * data;
@property(nonatomic, copy)NSArray * head;
@property(nonatomic, strong)UIButton * btn1;
@property(nonatomic, strong)UIButton * btn2;

@end
