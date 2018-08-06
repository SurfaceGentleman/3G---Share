//
//  Options_recommend.m
//  share模仿
//
//  Created by 开朗的男子 on 2018/8/1.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "Options_recommend.h"

@interface Options_recommend ()

@end

@implementation Options_recommend

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatData];
    //tableView的添加
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.sectionFooterHeight  = 1.0;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ID"];
        //添加Label
        UILabel * name = [[UILabel alloc] initWithFrame:CGRectMake(210, 35, 200, 25)];
        name.text = _names[indexPath.section];
        name.font = [UIFont systemFontOfSize:15];
        UILabel * detail = [[UILabel alloc] initWithFrame:CGRectMake(210, 55, 200, 25)];
        detail.text = _detail[indexPath.section];
        detail.font = [UIFont systemFontOfSize:11];
        UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(210, 15, 200, 25)];
        title.font = [UIFont systemFontOfSize:20];
        title.text = _t[indexPath.section];
        UILabel * time = [[UILabel alloc] initWithFrame:CGRectMake(210, 75, 200, 25)];
        time.text = _times[indexPath.section];
        time.font = [UIFont systemFontOfSize:11];
        [cell.contentView addSubview:name];
        [cell.contentView addSubview:detail];
        [cell.contentView addSubview:time];
        [cell.contentView addSubview:title];
        //添加image
        UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_imag[indexPath.section]]];
        imageView.frame = CGRectMake(10, 0, 180, 140);
        [cell.contentView addSubview:imageView];
        //添加按钮
        UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn1.frame = CGRectMake(210, 105, 50, 20);
        [btn1 setTitle:@"102" forState:UIControlStateNormal];
        [btn1 setTitleColor:[UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00] forState:UIControlStateNormal];
        [btn1 setImage:[UIImage imageNamed:@"5-2"] forState:UIControlStateNormal];
        [cell.contentView addSubview:btn1];
        UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn2.frame = CGRectMake(270, 105, 50, 20);
        [btn2 setTitle:@"26" forState:UIControlStateNormal];
        [btn2 setTitleColor:[UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00] forState:UIControlStateNormal];
        [btn2 setImage:[UIImage imageNamed:@"button_guanzhu"] forState:UIControlStateNormal];
        [cell.contentView addSubview:btn2];
        UIButton * btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn3.frame = CGRectMake(330, 105, 50, 20);
        [btn3 setTitle:@"102" forState:UIControlStateNormal];
        [btn3 setTitleColor:[UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00] forState:UIControlStateNormal];
        [btn3 setImage:[UIImage imageNamed:@"button_share"] forState:UIControlStateNormal];
        [cell.contentView addSubview:btn3];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)creatData
{
    _t = [NSArray arrayWithObjects:@"匆匆那年", @"国外画册欣赏", @"collection扁平设计", @"字体故事", @"板式整理术:高效解决多风格要求", nil];
    _names = [NSArray arrayWithObjects:@"share小白", @"share小王", @"share小吕", @"share小律", @"share小王", nil];
    _detail = [NSArray arrayWithObjects:@"原创-摄影-联系习作", @"平面设计-画册设计", @"平面设计-海报设计", @"设计文章-经验-设计观点", @"设计文章-经验-案例分析", nil];
    _times = [NSArray arrayWithObjects:@"10分钟前", @"16分钟前", @"17分钟前", @"45分钟前", @"4小时前", nil];
    _imag = [NSArray arrayWithObjects:@"list_img1", @"list_img2", @"list_img3", @"note_img3", @"list_img4", nil];
    
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
    return 10;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

@end
