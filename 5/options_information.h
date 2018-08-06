//
//  options_information.h
//  share模仿
//
//  Created by 开朗的男子 on 2018/8/1.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface options_information : UIViewController
<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)UITableView * tableView;
@property(nonatomic, copy)NSArray * data;

@end
