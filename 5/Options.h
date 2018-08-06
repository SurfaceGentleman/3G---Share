//
//  Options.h
//  share模仿
//
//  Created by 开朗的男子 on 2018/7/31.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Options : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, copy)NSArray * option;
@property(nonatomic, strong)UITableView * tableView;

@end
