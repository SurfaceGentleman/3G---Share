//
//  options_basic_information.m
//  share模仿
//
//  Created by 开朗的男子 on 2018/8/1.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "options_basic_information.h"

@interface options_basic_information ()

@end

@implementation options_basic_information

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
    
    _head = [NSArray arrayWithObjects:@"头像", @"昵称", @"签名", @"性别", @"邮箱", nil];
    _data = [NSArray arrayWithObjects:@" ", @"share小白", @"开心了就笑，不开心了就过会儿再笑", @" ", @"186####3@qq.com", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 100;
    }
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell1 = [tableView dequeueReusableCellWithIdentifier:@"ID1"];
    UITableViewCell * cell2 = [tableView dequeueReusableCellWithIdentifier:@"ID2"];
    if (indexPath.section == 0) {
        if (cell1 == nil) {
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID1"];
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 13, 75, 75)];
            imageView.image = [UIImage imageNamed:@"sixin_img1"];
            [cell1.contentView addSubview:imageView];
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(40, 40, 60, 20)];
            label.text = _head[indexPath.section];
            [cell1.contentView addSubview:label];
        }
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell1;
    } else
    {
        if (cell2 == nil) {
            cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID2"];
            if (indexPath.section == 3) {
                _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
                [_btn1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
                _btn1.frame = CGRectMake(100, 15, 40, 30);
                _btn1.imageView.frame = CGRectMake(0, 0, 25, 25);
                [_btn1 setImage:[UIImage imageNamed:@"boy_button"] forState:UIControlStateNormal];
                [_btn1 setTitle:@"男" forState:UIControlStateNormal];
                [_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
                [_btn1 setImage:[UIImage imageNamed:@"girl_button"] forState:UIControlStateSelected];
                _btn1.tag = 101;
                [cell2.contentView addSubview:_btn1];
                _btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
                _btn2.frame = CGRectMake(160, 15, 40, 30);
                [_btn2 setImage:[UIImage imageNamed:@"boy_button"] forState:UIControlStateNormal];
                [_btn2 setImage:[UIImage imageNamed:@"girl_button"] forState:UIControlStateSelected];
                [_btn2 setTitle:@"女" forState:UIControlStateNormal];
                [_btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [_btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
                [_btn2 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
                _btn2.tag = 102;
                _btn2.selected = YES;
                [cell2.contentView addSubview:_btn2];
            }
            else{
                UILabel * l = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 300, 20)];
                l.text = _data[indexPath.section];
                [cell2.contentView addSubview:l];
            }
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(40, 20, 60, 20)];
            label.text = _head[indexPath.section];
            [cell2.contentView addSubview:label];
        }
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell2;
    }
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (void)click:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.tag == 101) {
        _btn2.selected = !_btn2.selected;
    }
    else {
        _btn1.selected = !_btn1.selected;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
