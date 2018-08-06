//
//  my_message_sixin.m
//  share模仿
//
//  Created by 开朗的男子 on 2018/8/2.
//  Copyright © 2018年 开朗的男子. All rights reserved.
//

#import "my_message_sixin.h"
#import "ChatViewController.h"

@interface my_message_sixin ()

@end

@implementation my_message_sixin

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _name = @[@"share小格", @"share小兰", @"share小明", @"share小雪"];
    _message = @[@"你的作品我很喜欢!!!", @"谢谢，已关注你", @"为你点赞!", @"你好可以问问你是怎么拍的吗?"];
    _date = @[@"11-03 09:45", @"11-03 10:00", @"11-03 10:23", @"11-03 11:20"];
    _imag = @[@"sixin_img1", @"sixin_img2", @"sixin_img3", @"sixin_img4"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        UILabel * name = [[UILabel alloc] initWithFrame:CGRectMake(120, 20, 80, 20)];
        name.text = _name[indexPath.section];
        [cell.contentView addSubview:name];
        UILabel * message = [[UILabel alloc] initWithFrame:CGRectMake(120, 55, 200, 20)];
        message.text = _message[indexPath.section];
        message.textColor = [UIColor colorWithRed:0.12 green:0.50 blue:0.81 alpha:1.00];
        message.font = [UIFont systemFontOfSize:14];
        [cell.contentView addSubview:message];
        UILabel * date = [[UILabel alloc] initWithFrame:CGRectMake(325, 15, 150, 20)];
        date.text = _date[indexPath.section];
        date.font = [UIFont systemFontOfSize:12];
        date.textColor = [UIColor colorWithRed:0.59 green:0.59 blue:0.60 alpha:1.00];
        [cell.contentView addSubview:date];
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 15, 60, 60)];
        imageView.image = [UIImage imageNamed:_imag[indexPath.section]];
        [cell.contentView addSubview:imageView];
    }
    return cell;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatViewController * a = [ChatViewController new];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:a animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
