//
//  my_message_sixin.h
//  share模仿
//
//  Created by 开朗的男子 on 2018/8/2.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface my_message_sixin : UIViewController
<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)UITableView * tableView;
@property(nonatomic, copy)NSArray * name;
@property(nonatomic, copy)NSArray * message;
@property(nonatomic, copy)NSArray * date;
@property(nonatomic, copy)NSArray * imag;

@end
