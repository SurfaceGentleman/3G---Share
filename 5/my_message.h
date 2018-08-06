//
//  my_message.h
//  share模仿
//
//  Created by 开朗的男子 on 2018/8/1.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface my_message : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, copy)NSArray * number;
@property(nonatomic, copy)NSArray * message;
@property(nonatomic, strong)UITableView * tableView;

@end
