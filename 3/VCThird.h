//
//  VCThird.h
//  share模仿
//
//  Created by 开朗的男子 on 2018/7/27.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCThird : UIViewController

<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property(nonatomic, strong)UITableView * tableView1;
@property(nonatomic, strong)UITableView * tableView2;
@property(nonatomic, strong)UITableView * tableView3;
@property(nonatomic, strong)UIScrollView * scrollView;


@property(nonatomic, copy)NSArray * t;
@property(nonatomic, copy)NSArray * detail;
@property(nonatomic, copy)NSArray * times;
@property(nonatomic, copy)NSArray * names;
@property(nonatomic, copy)NSArray * imag;

@property(nonatomic, strong)UIButton * btn1;
@property(nonatomic, strong)UIButton * btn2;
@property(nonatomic, strong)UIButton * btn3;
@end
