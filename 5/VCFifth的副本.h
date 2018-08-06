//
//  VCFifth.h
//  share模仿
//
//  Created by 开朗的男子 on 2018/7/27.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCFifth : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, copy)NSArray * message;
@property(nonatomic, copy)NSArray * icon;
@property(nonatomic, strong)UITableView * tableView;

@end
