//
//  options_changePassword.h
//  share模仿
//
//  Created by 开朗的男子 on 2018/8/1.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface options_changePassword : UIViewController
<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, copy)NSArray * data;
@property(nonatomic, copy)NSArray * detail;
@property(nonatomic, strong)UITableView * tableView;

@end
