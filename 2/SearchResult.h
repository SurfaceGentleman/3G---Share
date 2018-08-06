//
//  SearchResult.h
//  share模仿
//
//  Created by 开朗的男子 on 2018/8/3.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResult : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, copy)NSArray * t;
@property(nonatomic, copy)NSArray * detail;
@property(nonatomic, copy)NSArray * times;
@property(nonatomic, copy)NSArray * names;
@property(nonatomic, copy)NSArray * imag;
@property(nonatomic, copy)UITableView * tableView;

@end
